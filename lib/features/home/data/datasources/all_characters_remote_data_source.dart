import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/character_response.dart';
import '../../../../core/network/endpoints.dart';

abstract class AllCharactersRemoteDataSource {
  Future<CharacterResponse> getAllCharacters();
}

@LazySingleton(as: AllCharactersRemoteDataSource)
class AllCharactersRemoteDataSourceImpl implements AllCharactersRemoteDataSource {
  final Dio _dio;

  AllCharactersRemoteDataSourceImpl(this._dio);

  @override
  Future<CharacterResponse> getAllCharacters() async {
    final res = await _dio.get(
      RickAndMortyApiEndpoints.allCharacters,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (res.statusCode == 200) {
      return CharacterResponse.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }
}
