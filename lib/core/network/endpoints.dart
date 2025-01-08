class RickAndMortyApiEndpoints {
  RickAndMortyApiEndpoints._();

  static const String baseUrl = 'https://rickandmortyapi.com/api';

  static const String allCharacters = '$baseUrl/character';

  static String specificCharacter(int id) => '$baseUrl/character/$id';
}
