import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/navigation/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: DetailsRoute.page),
      ];
}
