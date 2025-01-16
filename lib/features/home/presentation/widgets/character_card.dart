import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/navigation/router.gr.dart';

import '../../../../core/models/character.dart';
import '../../../../core/ui/app_colors.dart.dart';
import '../../../../core/ui/app_text_styles.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  static const double _borderRadius = 20;
  static const double _nameVerticalPadding = 5;
  static const double _nameHorizontalPadding = 10;

  static const double _likeButtonOuterPadding = 5;
  static const double _likeButtonInnerPadding = 5;
  static const double _likeButtonIconSize = 20;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AutoRouter.of(context).push(DetailsRoute(id: character.id)),
      child: Card(
        elevation: 0,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    topRight: Radius.circular(_borderRadius),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: character.image,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _nameVerticalPadding,
                    horizontal: _nameHorizontalPadding,
                  ),
                  child: Text(
                    character.name,
                    style: AppTextStyles.bodyBold,
                  ),
                )
              ],
            ),
            Positioned(
              right: _likeButtonOuterPadding,
              top: _likeButtonOuterPadding,
              child: InkWell(
                onTap: () => (), //TODO: toggle favorite icon
                child: Card(
                  color: AppColors.whiteSmoke,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(_likeButtonInnerPadding),
                    child: Icon(
                      Icons.favorite_border,
                      size: _likeButtonIconSize,
                      color: AppColors.irisBlue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
