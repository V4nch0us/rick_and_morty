part of 'all_characters_bloc.dart';

@freezed
class AllCharactersState with _$AllCharactersState {
  const factory AllCharactersState.loading() = _Loading;
  const factory AllCharactersState.loaded({required CharacterResponse characterResponse}) = _Loaded;
  const factory AllCharactersState.error({required Failure failure}) = _Error;
}
