part of 'single_character_bloc.dart';

@freezed
class SingleCharacterState with _$SingleCharacterState {
  const factory SingleCharacterState.loading() = _Loading;
  const factory SingleCharacterState.loaded({required Character character}) = _Loaded;
  const factory SingleCharacterState.error({required Failure failure}) = _Error;
}
