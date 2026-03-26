// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:em_poverty/customer_screen.dart' as _i1;
import 'package:em_poverty/home_screen.dart' as _i2;
import 'package:em_poverty/pick_location.dart' as _i3;
import 'package:em_poverty/service_provider_screen.dart' as _i4;
import 'package:em_poverty/splash_screen.dart' as _i5;

/// generated route for
/// [_i1.CustomerScreen]
class CustomerRoute extends _i6.PageRouteInfo<void> {
  const CustomerRoute({List<_i6.PageRouteInfo>? children})
    : super(CustomerRoute.name, initialChildren: children);

  static const String name = 'CustomerRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.CustomerScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.PickLocation]
class PickLocation extends _i6.PageRouteInfo<void> {
  const PickLocation({List<_i6.PageRouteInfo>? children})
    : super(PickLocation.name, initialChildren: children);

  static const String name = 'PickLocation';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.PickLocation();
    },
  );
}

/// generated route for
/// [_i4.ServiceProviderScreen]
class ServiceProviderRoute extends _i6.PageRouteInfo<void> {
  const ServiceProviderRoute({List<_i6.PageRouteInfo>? children})
    : super(ServiceProviderRoute.name, initialChildren: children);

  static const String name = 'ServiceProviderRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ServiceProviderScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashRoute]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashRoute();
    },
  );
}
