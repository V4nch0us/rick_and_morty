// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/datasources/all_characters_remote_data_source.dart'
    as _i227;
import '../../features/home/data/repositories/all_characters_repository_impl.dart'
    as _i291;
import '../../features/home/domain/repositories/all_characters_repository.dart'
    as _i734;
import '../../features/home/domain/usecases/get_all_characters.dart' as _i683;
import '../../features/home/presentation/bloc/all_characters_bloc.dart' as _i34;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i227.AllCharactersRemoteDataSource>(
        () => _i227.AllCharactersRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i734.AllCharactersRepository>(() =>
        _i291.AllCharactersRepositoryImpl(
            gh<_i227.AllCharactersRemoteDataSource>()));
    gh.factory<_i683.GetAllCharacters>(
        () => _i683.GetAllCharacters(gh<_i734.AllCharactersRepository>()));
    gh.factory<_i34.AllCharactersBloc>(
        () => _i34.AllCharactersBloc(gh<_i683.GetAllCharacters>()));
    return this;
  }
}
