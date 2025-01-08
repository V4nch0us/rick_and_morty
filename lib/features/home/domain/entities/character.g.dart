// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: $enumDecode(_$CharacterStatusEnumMap, json['status']),
      species:
          const CharacterSpeciesConverter().fromJson(json['species'] as String),
      type: json['type'] as String,
      gender: $enumDecode(_$CharacterGenderEnumMap, json['gender']),
      origin: Origin.fromJson(json['origin'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$CharacterStatusEnumMap[instance.status]!,
      'species': const CharacterSpeciesConverter().toJson(instance.species),
      'type': instance.type,
      'gender': _$CharacterGenderEnumMap[instance.gender]!,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created.toIso8601String(),
    };

const _$CharacterStatusEnumMap = {
  CharacterStatus.alive: 'Alive',
  CharacterStatus.dead: 'Dead',
  CharacterStatus.unknown: 'Unknown',
};

const _$CharacterGenderEnumMap = {
  CharacterGender.male: 'Male',
  CharacterGender.female: 'Female',
  CharacterGender.genderless: 'Genderless',
  CharacterGender.unknown: 'Unknown',
};

_$OriginImpl _$$OriginImplFromJson(Map<String, dynamic> json) => _$OriginImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$OriginImplToJson(_$OriginImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
