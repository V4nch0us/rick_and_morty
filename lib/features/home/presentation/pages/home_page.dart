import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injectable.dart';
import '../bloc/all_characters_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
          bloc: serviceLocator<AllCharactersBloc>(),
          builder: (context, state) {
            return state.when(
              loading: () => const CircularProgressIndicator(),
              loaded: (data) => Text('Character list length: ${data.results.length}'),
              error: (error) => Text('ERROR: $error'),
            );
          },
        ),
      ),
    );
  }
}
