// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:mobile_trampoline_park/presentation/screens/auth/activation/activation_part.dart'
    as _i1;
import 'package:mobile_trampoline_park/presentation/screens/auth/on_boarding/on_boarding_part.dart'
    as _i5;
import 'package:mobile_trampoline_park/presentation/screens/auth/sign_in/sign_in_part.dart'
    as _i6;
import 'package:mobile_trampoline_park/presentation/screens/auth/sign_up/sign_up_part.dart'
    as _i7;
import 'package:mobile_trampoline_park/presentation/screens/client/main/client_main_part.dart'
    as _i2;
import 'package:mobile_trampoline_park/presentation/screens/coach/main/coach_main_part.dart'
    as _i3;
import 'package:mobile_trampoline_park/presentation/screens/initial/initial_part.dart'
    as _i4;

/// generated route for
/// [_i1.ActivationScreen]
class ActivationRoute extends _i8.PageRouteInfo<ActivationRouteArgs> {
  ActivationRoute({
    _i9.Key? key,
    required String uid,
    required String token,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ActivationRoute.name,
         args: ActivationRouteArgs(key: key, uid: uid, token: token),
         initialChildren: children,
       );

  static const String name = 'ActivationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivationRouteArgs>();
      return _i8.WrappedRoute(
        child: _i1.ActivationScreen(
          key: args.key,
          uid: args.uid,
          token: args.token,
        ),
      );
    },
  );
}

class ActivationRouteArgs {
  const ActivationRouteArgs({this.key, required this.uid, required this.token});

  final _i9.Key? key;

  final String uid;

  final String token;

  @override
  String toString() {
    return 'ActivationRouteArgs{key: $key, uid: $uid, token: $token}';
  }
}

/// generated route for
/// [_i2.ClientMainScreen]
class ClientMainRoute extends _i8.PageRouteInfo<void> {
  const ClientMainRoute({List<_i8.PageRouteInfo>? children})
    : super(ClientMainRoute.name, initialChildren: children);

  static const String name = 'ClientMainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.ClientMainScreen();
    },
  );
}

/// generated route for
/// [_i3.CoachMainScreen]
class CoachMainRoute extends _i8.PageRouteInfo<void> {
  const CoachMainRoute({List<_i8.PageRouteInfo>? children})
    : super(CoachMainRoute.name, initialChildren: children);

  static const String name = 'CoachMainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.CoachMainScreen();
    },
  );
}

/// generated route for
/// [_i4.InitialScreen]
class InitialRoute extends _i8.PageRouteInfo<void> {
  const InitialRoute({List<_i8.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i4.InitialScreen());
    },
  );
}

/// generated route for
/// [_i5.OnBoardingScreen]
class OnBoardingRoute extends _i8.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i8.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i6.SignInScreen]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i6.SignInScreen());
    },
  );
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute({List<_i8.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i7.SignUpScreen());
    },
  );
}
