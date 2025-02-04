import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/character_response.dart';
import '../../domain/usecases/get_all_characters.dart';

part 'all_characters_bloc.freezed.dart';
part 'all_characters_event.dart';
part 'all_characters_state.dart';

@injectable
class AllCharactersBloc extends Bloc<AllCharactersEvent, AllCharactersState> {
  final GetAllCharacters _getAllCharacters;

  AllCharactersBloc(this._getAllCharacters) : super(_Loading()) {
    on<AllCharactersEvent>((event, emit) async {
      await event.when(
        fetch: () async => await _handleEventFetch(emit),
      );
    });

    add(AllCharactersEvent.fetch());
  }

  Future<void> _handleEventFetch(Emitter emit) async {
    emit(const _Loading());
    final failureOrData = await _getAllCharacters();

    failureOrData.fold(
      (failure) => emit(_Error(failure: failure)),
      (data) => emit(_Loaded(characterResponse: data)),
    );
  }
}
