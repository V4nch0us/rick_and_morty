import 'package:dartz/dartz.dart';
import '../../../../core/models/character_response.dart';

import '../../../../core/error/failures.dart';

abstract class AllCharactersRepository {
  Future<Either<Failure, CharacterResponse>> getAllCharacters();
}
