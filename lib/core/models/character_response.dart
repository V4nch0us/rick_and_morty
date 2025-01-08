import 'package:freezed_annotation/freezed_annotation.dart';

import 'character.dart';

part 'character_response.freezed.dart';
part 'character_response.g.dart';

@freezed
class CharacterResponse with _$CharacterResponse {
  const factory CharacterResponse({
    required List<Character> results,
  }) = _CharacterResponse;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) => _$CharacterResponseFromJson(json);
}
