import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injectable.dart';
import '../../../../core/ui/loading_widget.dart';
import '../bloc/single_character_bloc.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.id});

  final int id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _bloc = serviceLocator<SingleCharacterBloc>();

  @override
  void initState() {
    _bloc.add(SingleCharacterEvent.getCharacter(widget.id));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleCharacterBloc, SingleCharacterState>(
      bloc: _bloc,
      builder: (context, state) {
        return state.when(
          loading: () => const LoadingWidget(),
          loaded: (character) => Scaffold(
            appBar: AppBar(
              toolbarHeight: 260,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(character.image), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 45,
                    child: InkWell(
                      onTap: () => context.pop(),
                      child: Card(
                        elevation: 0,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_back,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              automaticallyImplyLeading: false,
            ),
          ),
          error: (error) => Text('ERROR: $error'),
        );
      },
    );
  }
}
