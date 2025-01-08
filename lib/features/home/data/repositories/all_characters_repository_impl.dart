import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/character.dart';
import '../../domain/repositories/all_characters_repository.dart';

class AllCharactersRepositoryImpl implements AllCharactersRepository {
  @override
  Future<Either<Failure, List<Character>>> getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }
}
