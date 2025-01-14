import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/models/character.dart';
import '../../../../core/network/endpoints.dart';

abstract class SingleCharacterRemoteDataSource {
  Future<Character> getCharacter(int id);
}

@LazySingleton(as: SingleCharacterRemoteDataSource)
class SingleCharacterRemoteDataSourceImpl implements SingleCharacterRemoteDataSource {
  final _dio = serviceLocator<Dio>();

  @override
  Future<Character> getCharacter(int id) async {
    final res = await _dio.get(
      RickAndMortyApiEndpoints.specificCharacter(id),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    if (res.statusCode == 200) {
      return Character.fromJson(res.data);
    } else {
      throw ServerException();
    }
  }
}
