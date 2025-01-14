part of 'single_character_bloc.dart';

@freezed
class SingleCharacterEvent with _$SingleCharacterEvent {
  const factory SingleCharacterEvent.getCharacter(int id) = _GetCharacter;
}
