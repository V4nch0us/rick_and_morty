import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/character.dart';

abstract class AllCharactersRepository {
  Future<Either<Failure, List<Character>>> getAllCharacters();
}
