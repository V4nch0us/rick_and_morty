// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:rick_and_morty/features/details/presentation/pages/details_page.dart'
    as _i1;
import 'package:rick_and_morty/features/home/presentation/pages/home_page.dart'
    as _i2;

/// generated route for
/// [_i1.DetailsPage]
class DetailsRoute extends _i3.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i4.Key? key,
    required int id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         DetailsRoute.name,
         args: DetailsRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'DetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return _i1.DetailsPage(key: args.key, id: args.id);
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({this.key, required this.id});

  final _i4.Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}
