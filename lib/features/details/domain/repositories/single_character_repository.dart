import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/character.dart';

abstract class SingleCharacterRepository {
  Future<Either<Failure, Character>> getCharacter(int id);
}
