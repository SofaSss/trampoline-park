// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:mobile_trampoline_park/presentation/screens/auth/on_boarding/on_boarding_part.dart'
    as _i4;
import 'package:mobile_trampoline_park/presentation/screens/auth/sign_in/sign_in_part.dart'
    as _i5;
import 'package:mobile_trampoline_park/presentation/screens/auth/sign_up/sign_up_part.dart'
    as _i6;
import 'package:mobile_trampoline_park/presentation/screens/client/main/client_main_part.dart'
    as _i1;
import 'package:mobile_trampoline_park/presentation/screens/coach/main/coach_main_part.dart'
    as _i2;
import 'package:mobile_trampoline_park/presentation/screens/initial/initial_part.dart'
    as _i3;

/// generated route for
/// [_i1.ClientMainScreen]
class ClientMainRoute extends _i7.PageRouteInfo<void> {
  const ClientMainRoute({List<_i7.PageRouteInfo>? children})
    : super(ClientMainRoute.name, initialChildren: children);

  static const String name = 'ClientMainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.ClientMainScreen();
    },
  );
}

/// generated route for
/// [_i2.CoachMainScreen]
class CoachMainRoute extends _i7.PageRouteInfo<void> {
  const CoachMainRoute({List<_i7.PageRouteInfo>? children})
    : super(CoachMainRoute.name, initialChildren: children);

  static const String name = 'CoachMainRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.CoachMainScreen();
    },
  );
}

/// generated route for
/// [_i3.InitialScreen]
class InitialRoute extends _i7.PageRouteInfo<void> {
  const InitialRoute({List<_i7.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.WrappedRoute(child: const _i3.InitialScreen());
    },
  );
}

/// generated route for
/// [_i4.OnBoardingScreen]
class OnBoardingRoute extends _i7.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i7.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i5.SignInScreen]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.WrappedRoute(child: const _i5.SignInScreen());
    },
  );
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.WrappedRoute(child: const _i6.SignUpScreen());
    },
  );
}
