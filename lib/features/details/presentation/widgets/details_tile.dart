import 'package:flutter/material.dart';

import '../../../../core/models/character.dart';
import '../../../../core/ui/app_colors.dart.dart';
import '../../../../core/ui/app_text_styles.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    super.key,
    required this.character,
    required this.label,
  });

  final Character character;
  final String label;

  String _getIconPath(Character character, String label, BuildContext context) {
    switch (label) {
      case 'Name':
        return AppLocalizations.of(context)!.infoIconPath;
      case 'Status':
        switch (character.status) {
          case CharacterStatus.alive:
            return AppLocalizations.of(context)!.statusAliveIconPath;
          case CharacterStatus.dead:
            return AppLocalizations.of(context)!.statusDeadIconPath;
          case CharacterStatus.unknown:
            return AppLocalizations.of(context)!.statusUnknownIconPath;
        }
      case 'Species':
        switch (character.species) {
          case CharacterSpecies.human:
            return AppLocalizations.of(context)!.speciesHumanIconPath;
          case CharacterSpecies.alien:
            return AppLocalizations.of(context)!.speciesAlienIconPath;
          default:
            return AppLocalizations.of(context)!.speciesAlienIconPath;
        }
      case 'Gender':
        switch (character.gender) {
          case CharacterGender.male:
            return AppLocalizations.of(context)!.genderMaleIconPath;
          case CharacterGender.female:
            return AppLocalizations.of(context)!.genderFemaleIconPath;
          default:
            return AppLocalizations.of(context)!.genderUnknownIconPath;
        }
      default:
        return AppLocalizations.of(context)!.infoIconPath;
    }
  }

  String _getValue(Character character, String label, BuildContext context) {
    switch (label) {
      case 'Name':
        return character.name;
      case 'Status':
        return character.status.name;
      case 'Species':
        return character.species.name;
      case 'Gender':
        return character.gender.name;
      default:
        return 'incorrect label';
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconPath = _getIconPath(character, label, context);
    final value = _getValue(character, label, context);

    return ListTile(
      leading: DetailsTileIcon(icon: iconPath),
      title: Text(label, style: AppTextStyles.bodyMedium),
      subtitle: Text(value, style: AppTextStyles.subtitleBold),
    );
  }
}

class DetailsTileIcon extends StatelessWidget {
  const DetailsTileIcon({super.key, required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.irisBlue,
      child: ImageIcon(
        AssetImage(icon),
        color: AppColors.white,
      ),
    );
  }
}
