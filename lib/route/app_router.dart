import 'package:auto_route/auto_route.dart';
import 'package:em_poverty/route/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: CustomerRoute.page,
      path: "/customerscreen"

    ),
    AutoRoute(
        page: ServiceProviderRoute.page,
        path: "/serviceproviderscreen"
    ),
    AutoRoute(
        page: HomeRoute.page,
        path: "/homescreen",
        initial: true
    ),
    AutoRoute(
        page: PickLocation.page,
        path: "/pickLocation"
    ),
    AutoRoute(
        page: SplashRoute.page,
        path: "/splashscreen"
    ),

  ];
}
