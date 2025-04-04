// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:mobile_trampoline_park/presentation/screens/auth/activation/activation_part.dart'
    as _i1;
import 'package:mobile_trampoline_park/presentation/screens/auth/on_boarding/on_boarding_part.dart'
    as _i11;
import 'package:mobile_trampoline_park/presentation/screens/auth/reset_password/reset_password_part.dart'
    as _i12;
import 'package:mobile_trampoline_park/presentation/screens/auth/sign_in/sign_in_part.dart'
    as _i13;
import 'package:mobile_trampoline_park/presentation/screens/auth/sign_up/sign_up_part.dart'
    as _i14;
import 'package:mobile_trampoline_park/presentation/screens/client/home/client_home_part.dart'
    as _i2;
import 'package:mobile_trampoline_park/presentation/screens/client/main/client_main_part.dart'
    as _i3;
import 'package:mobile_trampoline_park/presentation/screens/client/profile/client_profile_part.dart'
    as _i4;
import 'package:mobile_trampoline_park/presentation/screens/client/workouts/client_workouts_part.dart'
    as _i5;
import 'package:mobile_trampoline_park/presentation/screens/coach/home/coach_home_part.dart'
    as _i6;
import 'package:mobile_trampoline_park/presentation/screens/coach/main/coach_main_part.dart'
    as _i7;
import 'package:mobile_trampoline_park/presentation/screens/coach/profile/coach_profile_part.dart'
    as _i8;
import 'package:mobile_trampoline_park/presentation/screens/coach/workouts/coach_workouts_part.dart'
    as _i9;
import 'package:mobile_trampoline_park/presentation/screens/initial/initial_part.dart'
    as _i10;

/// generated route for
/// [_i1.ActivationScreen]
class ActivationRoute extends _i15.PageRouteInfo<ActivationRouteArgs> {
  ActivationRoute({
    _i16.Key? key,
    required String uid,
    required String token,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ActivationRoute.name,
         args: ActivationRouteArgs(key: key, uid: uid, token: token),
         initialChildren: children,
       );

  static const String name = 'ActivationRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivationRouteArgs>();
      return _i15.WrappedRoute(
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

  final _i16.Key? key;

  final String uid;

  final String token;

  @override
  String toString() {
    return 'ActivationRouteArgs{key: $key, uid: $uid, token: $token}';
  }
}

/// generated route for
/// [_i2.ClientHomeScreen]
class ClientHomeRoute extends _i15.PageRouteInfo<void> {
  const ClientHomeRoute({List<_i15.PageRouteInfo>? children})
    : super(ClientHomeRoute.name, initialChildren: children);

  static const String name = 'ClientHomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.ClientHomeScreen();
    },
  );
}

/// generated route for
/// [_i3.ClientMainScreen]
class ClientMainRoute extends _i15.PageRouteInfo<void> {
  const ClientMainRoute({List<_i15.PageRouteInfo>? children})
    : super(ClientMainRoute.name, initialChildren: children);

  static const String name = 'ClientMainRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.ClientMainScreen();
    },
  );
}

/// generated route for
/// [_i4.ClientProfileScreen]
class ClientProfileRoute extends _i15.PageRouteInfo<void> {
  const ClientProfileRoute({List<_i15.PageRouteInfo>? children})
    : super(ClientProfileRoute.name, initialChildren: children);

  static const String name = 'ClientProfileRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i4.ClientProfileScreen());
    },
  );
}

/// generated route for
/// [_i5.ClientWorkoutsScreen]
class ClientWorkoutsRoute extends _i15.PageRouteInfo<void> {
  const ClientWorkoutsRoute({List<_i15.PageRouteInfo>? children})
    : super(ClientWorkoutsRoute.name, initialChildren: children);

  static const String name = 'ClientWorkoutsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i5.ClientWorkoutsScreen();
    },
  );
}

/// generated route for
/// [_i6.CoachHomeScreen]
class CoachHomeRoute extends _i15.PageRouteInfo<void> {
  const CoachHomeRoute({List<_i15.PageRouteInfo>? children})
    : super(CoachHomeRoute.name, initialChildren: children);

  static const String name = 'CoachHomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.CoachHomeScreen();
    },
  );
}

/// generated route for
/// [_i7.CoachMainScreen]
class CoachMainRoute extends _i15.PageRouteInfo<void> {
  const CoachMainRoute({List<_i15.PageRouteInfo>? children})
    : super(CoachMainRoute.name, initialChildren: children);

  static const String name = 'CoachMainRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.CoachMainScreen();
    },
  );
}

/// generated route for
/// [_i8.CoachProfileScreen]
class CoachProfileRoute extends _i15.PageRouteInfo<void> {
  const CoachProfileRoute({List<_i15.PageRouteInfo>? children})
    : super(CoachProfileRoute.name, initialChildren: children);

  static const String name = 'CoachProfileRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.CoachProfileScreen();
    },
  );
}

/// generated route for
/// [_i9.CoachWorkoutsScreen]
class CoachWorkoutsRoute extends _i15.PageRouteInfo<void> {
  const CoachWorkoutsRoute({List<_i15.PageRouteInfo>? children})
    : super(CoachWorkoutsRoute.name, initialChildren: children);

  static const String name = 'CoachWorkoutsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.CoachWorkoutsScreen();
    },
  );
}

/// generated route for
/// [_i10.InitialScreen]
class InitialRoute extends _i15.PageRouteInfo<void> {
  const InitialRoute({List<_i15.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i10.InitialScreen());
    },
  );
}

/// generated route for
/// [_i11.OnBoardingScreen]
class OnBoardingRoute extends _i15.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i15.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i11.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i12.ResetPasswordScreen]
class ResetPasswordRoute extends _i15.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i16.Key? key,
    required String uid,
    required String token,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(key: key, uid: uid, token: token),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i15.WrappedRoute(
        child: _i12.ResetPasswordScreen(
          key: args.key,
          uid: args.uid,
          token: args.token,
        ),
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.uid,
    required this.token,
  });

  final _i16.Key? key;

  final String uid;

  final String token;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, uid: $uid, token: $token}';
  }
}

/// generated route for
/// [_i13.SignInScreen]
class SignInRoute extends _i15.PageRouteInfo<void> {
  const SignInRoute({List<_i15.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i13.SignInScreen());
    },
  );
}

/// generated route for
/// [_i14.SignUpScreen]
class SignUpRoute extends _i15.PageRouteInfo<void> {
  const SignUpRoute({List<_i15.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i14.SignUpScreen());
    },
  );
}
