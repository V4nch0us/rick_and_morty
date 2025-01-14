import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/character.dart';
import '../repositories/single_character_repository.dart';

@injectable
class GetCharacter {
  final SingleCharacterRepository singleCharacterRepository;

  GetCharacter(this.singleCharacterRepository);

  Future<Either<Failure, Character>> call(int id) async {
    return await singleCharacterRepository.getCharacter(id);
  }
}
