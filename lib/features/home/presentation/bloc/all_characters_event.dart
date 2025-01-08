part of 'all_characters_bloc.dart';

@freezed
class AllCharactersEvent with _$AllCharactersEvent {
  const factory AllCharactersEvent.fetch() = _Fetch;
}
