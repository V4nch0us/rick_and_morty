import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/character.dart';
import '../../domain/repositories/single_character_repository.dart';
import '../datasources/single_character_remote_data_source.dart';

@LazySingleton(as: SingleCharacterRepository)
class SingleCharacterRepositoryImpl implements SingleCharacterRepository {
  final SingleCharacterRemoteDataSource remoteDataSource;

  SingleCharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Character>> getCharacter(int id) async {
    try {
      final data = await remoteDataSource.getCharacter(id);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
