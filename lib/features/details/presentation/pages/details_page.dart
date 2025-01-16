import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injectable.dart';
import '../../../../core/ui/loading_widget.dart';
import '../bloc/single_character_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/details_tile.dart';

@RoutePage()
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
    return Scaffold(
      body: SafeArea(
        top: false,
        child: BlocBuilder<SingleCharacterBloc, SingleCharacterState>(
          bloc: _bloc,
          builder: (context, state) {
            return state.when(
              loading: () => const LoadingWidget(),
              loaded: (character) => CustomScrollView(
                slivers: [
                  SliverAppBar(
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
                            onTap: () => AutoRouter.of(context).maybePop(),
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
                  SliverPadding(
                    padding: EdgeInsets.all(10),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          DetailsTile(
                            character: character,
                            label: AppLocalizations.of(context)!.detailsLabelName,
                          ),
                          DetailsTile(
                            character: character,
                            label: AppLocalizations.of(context)!.detailsLabelStatus,
                          ),
                          DetailsTile(
                            character: character,
                            label: AppLocalizations.of(context)!.detailsLabelSpecies,
                          ),
                          DetailsTile(
                            character: character,
                            label: AppLocalizations.of(context)!.detailsLabelGender,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              error: (error) => Text('ERROR: $error'),
            );
          },
        ),
      ),
    );
  }
}
