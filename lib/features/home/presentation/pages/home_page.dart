import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injectable.dart';
import '../../../../core/ui/app_colors.dart.dart';
import '../bloc/all_characters_bloc.dart';
import '../widgets/character_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double _verticalGap = 10;
  static const double _horizontalGap = 20;
  static const double _horizontalPadding = 20;
  static const double _cardAspectRatio = 160 / 215;
  static const double _maxCrossAxisExtent = 255;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteSmoke,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
          bloc: serviceLocator<AllCharactersBloc>(),
          builder: (context, state) {
            return state.when(
              loading: () => const CircularProgressIndicator(),
              loaded: (data) => Padding(
                padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
                child: CustomScrollView(
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => CharacterCard(
                          character: data.results[index],
                        ),
                        childCount: data.results.length,
                      ),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: _maxCrossAxisExtent,
                        mainAxisSpacing: _verticalGap,
                        crossAxisSpacing: _horizontalGap,
                        childAspectRatio: _cardAspectRatio,
                      ),
                    ),
                  ],
                ),
              ),
              error: (error) => Text('ERROR: $error'),
            );
          },
        ),
      ),
    );
  }
}
