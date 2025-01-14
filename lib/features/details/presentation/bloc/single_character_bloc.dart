import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/character.dart';
import '../../domain/usecases/get_character.dart';

part 'single_character_bloc.freezed.dart';
part 'single_character_event.dart';
part 'single_character_state.dart';

@injectable
class SingleCharacterBloc extends Bloc<SingleCharacterEvent, SingleCharacterState> {
  final GetCharacter _getCharacter;

  SingleCharacterBloc(this._getCharacter) : super(_Loading()) {
    on<SingleCharacterEvent>((event, emit) async {
      await event.when(
        getCharacter: (id) async => await _handleEventGetCharacter(emit, id),
      );
    });
  }

  Future<void> _handleEventGetCharacter(Emitter emit, int id) async {
    emit(const _Loading());
    final failureOrData = await _getCharacter(id);

    failureOrData.fold(
      (failure) => emit(_Error(failure: failure)),
      (data) => emit(_Loaded(character: data)),
    );
  }
}
