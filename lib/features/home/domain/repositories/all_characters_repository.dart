import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/character_response.dart';

abstract class AllCharactersRepository {
  Future<Either<Failure, CharacterResponse>> getAllCharacters();
}
