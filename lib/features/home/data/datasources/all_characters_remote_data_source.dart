import '../../../../core/models/character.dart';

abstract class AllCharactersRemoteDataSource {
  Future<List<Character>> getAllCharacters();
}
