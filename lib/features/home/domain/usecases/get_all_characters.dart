import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/character.dart';
import '../repositories/all_characters_repository.dart';

class GetAllCharacters {
  final AllCharactersRepository allCharactersRepository;

  GetAllCharacters(this.allCharactersRepository);

  Future<Either<Failure, List<Character>>> call() async {
    return await allCharactersRepository.getAllCharacters();
  }
}
