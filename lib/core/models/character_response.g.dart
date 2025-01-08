// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterResponseImpl _$$CharacterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CharacterResponseImplToJson(
        _$CharacterResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
