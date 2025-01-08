import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/home/presentation/widgets/character_card.dart';
import '../../../../core/di/injectable.dart';
import '../../../../core/ui/app_colors.dart.dart';
import '../bloc/all_characters_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteSmoke,
      body: Center(
        child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
          bloc: serviceLocator<AllCharactersBloc>(),
          builder: (context, state) {
            return state.when(
              loading: () => const CircularProgressIndicator(),
              loaded: (data) => CharacterCard(character: data.results.first),
              error: (error) => Text('ERROR: $error'),
            );
          },
        ),
      ),
    );
  }
}
