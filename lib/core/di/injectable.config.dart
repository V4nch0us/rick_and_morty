// dart format width=80
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
import 'package:rick_and_morty/core/di/module_injection.dart' as _i956;
import 'package:rick_and_morty/features/details/data/datasources/single_character_remote_data_source.dart'
    as _i144;
import 'package:rick_and_morty/features/details/data/repositories/single_character_repository_impl.dart'
    as _i756;
import 'package:rick_and_morty/features/details/domain/repositories/single_character_repository.dart'
    as _i878;
import 'package:rick_and_morty/features/details/domain/usecases/get_character.dart'
    as _i657;
import 'package:rick_and_morty/features/details/presentation/bloc/single_character_bloc.dart'
    as _i1031;
import 'package:rick_and_morty/features/home/data/datasources/all_characters_remote_data_source.dart'
    as _i729;
import 'package:rick_and_morty/features/home/data/repositories/all_characters_repository_impl.dart'
    as _i895;
import 'package:rick_and_morty/features/home/domain/repositories/all_characters_repository.dart'
    as _i790;
import 'package:rick_and_morty/features/home/domain/usecases/get_all_characters.dart'
    as _i353;
import 'package:rick_and_morty/features/home/presentation/bloc/all_characters_bloc.dart'
    as _i784;

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i144.SingleCharacterRemoteDataSource>(
        () => _i144.SingleCharacterRemoteDataSourceImpl());
    gh.lazySingleton<_i729.AllCharactersRemoteDataSource>(
        () => _i729.AllCharactersRemoteDataSourceImpl());
    gh.lazySingleton<_i790.AllCharactersRepository>(() =>
        _i895.AllCharactersRepositoryImpl(
            gh<_i729.AllCharactersRemoteDataSource>()));
    gh.lazySingleton<_i878.SingleCharacterRepository>(() =>
        _i756.SingleCharacterRepositoryImpl(
            gh<_i144.SingleCharacterRemoteDataSource>()));
    gh.factory<_i657.GetCharacter>(
        () => _i657.GetCharacter(gh<_i878.SingleCharacterRepository>()));
    gh.factory<_i1031.SingleCharacterBloc>(
        () => _i1031.SingleCharacterBloc(gh<_i657.GetCharacter>()));
    gh.factory<_i353.GetAllCharacters>(
        () => _i353.GetAllCharacters(gh<_i790.AllCharactersRepository>()));
    gh.factory<_i784.AllCharactersBloc>(
        () => _i784.AllCharactersBloc(gh<_i353.GetAllCharacters>()));
    return this;
  }
}

class _$RegisterModule extends _i956.RegisterModule {}
