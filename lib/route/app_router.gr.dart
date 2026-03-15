// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:em_poverty/customer_screen.dart' as _i1;
import 'package:em_poverty/home_screen.dart' as _i2;
import 'package:em_poverty/service_provider_screen.dart' as _i3;
import 'package:em_poverty/splash_screen.dart' as _i4;
import 'package:flutter/material.dart' as _i6;

/// generated route for
/// [_i1.CustomerScreen]
class CustomerRoute extends _i5.PageRouteInfo<CustomerRouteArgs> {
  CustomerRoute({_i6.Key? key, List<_i5.PageRouteInfo>? children})
    : super(
        CustomerRoute.name,
        args: CustomerRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'CustomerRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomerRouteArgs>(
        orElse: () => const CustomerRouteArgs(),
      );
      return _i1.CustomerScreen(key: args.key);
    },
  );
}

class CustomerRouteArgs {
  const CustomerRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'CustomerRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CustomerRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.ServiceProviderScreen]
class ServiceProviderRoute extends _i5.PageRouteInfo<void> {
  const ServiceProviderRoute({List<_i5.PageRouteInfo>? children})
    : super(ServiceProviderRoute.name, initialChildren: children);

  static const String name = 'ServiceProviderRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.ServiceProviderScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashRoute]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashRoute();
    },
  );
}
