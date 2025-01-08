import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/models/character_response.dart';
import '../../domain/repositories/all_characters_repository.dart';
import '../datasources/all_characters_remote_data_source.dart';

@LazySingleton(as: AllCharactersRepository)
class AllCharactersRepositoryImpl implements AllCharactersRepository {
  final AllCharactersRemoteDataSource remoteDataSource;

  AllCharactersRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CharacterResponse>> getAllCharacters() async {
    try {
      final remoteData = await remoteDataSource.getAllCharacters();
      return right(remoteData);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
