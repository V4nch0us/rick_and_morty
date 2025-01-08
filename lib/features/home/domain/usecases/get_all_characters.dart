import 'package:dartz/dartz.dart';
import '../../../../core/models/character_response.dart';

import '../../../../core/error/failures.dart';
import '../repositories/all_characters_repository.dart';

class GetAllCharacters {
  final AllCharactersRepository allCharactersRepository;

  GetAllCharacters(this.allCharactersRepository);

  Future<Either<Failure, CharacterResponse>> call() async {
    return await allCharactersRepository.getAllCharacters();
  }
}
