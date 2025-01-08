import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required CharacterStatus status,
    @CharacterSpeciesConverter() required CharacterSpecies species,
    required String type,
    required CharacterGender gender,
    required Origin origin,
    required Location location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
}

@freezed
class Origin with _$Origin {
  const factory Origin({
    required String name,
    required String url,
  }) = _Origin;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String name,
    required String url,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

enum CharacterGender {
  @JsonValue('Male')
  male,

  @JsonValue('Female')
  female,

  @JsonValue('Genderless')
  genderless,

  @JsonValue('Unknown')
  unknown,
}

enum CharacterStatus {
  @JsonValue('Alive')
  alive,

  @JsonValue('Dead')
  dead,

  @JsonValue('Unknown')
  unknown,
}

enum CharacterSpecies {
  @JsonValue('Human')
  human,

  @JsonValue('Alien')
  alien,

  other,
}

class CharacterSpeciesConverter implements JsonConverter<CharacterSpecies, String> {
  const CharacterSpeciesConverter();

  @override
  CharacterSpecies fromJson(String json) {
    switch (json) {
      case 'Human':
        return CharacterSpecies.human;
      case 'Alien':
        return CharacterSpecies.alien;
      default:
        return CharacterSpecies.other;
    }
  }

  @override
  String toJson(CharacterSpecies object) {
    return object.name;
  }
}
