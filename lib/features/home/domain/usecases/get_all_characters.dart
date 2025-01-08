import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/character_response.dart';
import '../repositories/all_characters_repository.dart';

@injectable
class GetAllCharacters {
  final AllCharactersRepository allCharactersRepository;

  GetAllCharacters(this.allCharactersRepository);

  Future<Either<Failure, CharacterResponse>> call() async {
    return await allCharactersRepository.getAllCharacters();
  }
}
