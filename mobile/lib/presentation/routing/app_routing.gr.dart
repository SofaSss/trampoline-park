// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:mobile_trampoline_park/presentation/screens/auth/activation/activation_part.dart'
    as _i1;
import 'package:mobile_trampoline_park/presentation/screens/auth/on_boarding/on_boarding_part.dart'
    as _i13;
import 'package:mobile_trampoline_park/presentation/screens/auth/reset_password/reset_password_part.dart'
    as _i14;
import 'package:mobile_trampoline_park/presentation/screens/auth/sign_in/sign_in_part.dart'
    as _i16;
import 'package:mobile_trampoline_park/presentation/screens/auth/sign_up/sign_up_part.dart'
    as _i17;
import 'package:mobile_trampoline_park/presentation/screens/client/booking_event/booking_event_part.dart'
    as _i2;
import 'package:mobile_trampoline_park/presentation/screens/client/coach_detail/coach_detail_part.dart'
    as _i7;
import 'package:mobile_trampoline_park/presentation/screens/client/home/client_home_part.dart'
    as _i3;
import 'package:mobile_trampoline_park/presentation/screens/client/main/client_main_part.dart'
    as _i4;
import 'package:mobile_trampoline_park/presentation/screens/client/profile/client_profile_part.dart'
    as _i5;
import 'package:mobile_trampoline_park/presentation/screens/client/service_detail/service_detail_part.dart'
    as _i15;
import 'package:mobile_trampoline_park/presentation/screens/client/sign_up_workout/sign_up_workout_part.dart'
    as _i18;
import 'package:mobile_trampoline_park/presentation/screens/client/workouts/client_workouts_part.dart'
    as _i6;
import 'package:mobile_trampoline_park/presentation/screens/coach/home/coach_home_part.dart'
    as _i8;
import 'package:mobile_trampoline_park/presentation/screens/coach/main/coach_main_part.dart'
    as _i9;
import 'package:mobile_trampoline_park/presentation/screens/coach/profile/coach_profile_part.dart'
    as _i10;
import 'package:mobile_trampoline_park/presentation/screens/coach/workouts/coach_workouts_part.dart'
    as _i11;
import 'package:mobile_trampoline_park/presentation/screens/initial/initial_part.dart'
    as _i12;

/// generated route for
/// [_i1.ActivationScreen]
class ActivationRoute extends _i19.PageRouteInfo<ActivationRouteArgs> {
  ActivationRoute({
    _i20.Key? key,
    required String uid,
    required String token,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ActivationRoute.name,
         args: ActivationRouteArgs(key: key, uid: uid, token: token),
         initialChildren: children,
       );

  static const String name = 'ActivationRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivationRouteArgs>();
      return _i19.WrappedRoute(
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

  final _i20.Key? key;

  final String uid;

  final String token;

  @override
  String toString() {
    return 'ActivationRouteArgs{key: $key, uid: $uid, token: $token}';
  }
}

/// generated route for
/// [_i2.BookingEventScreen]
class BookingEventRoute extends _i19.PageRouteInfo<void> {
  const BookingEventRoute({List<_i19.PageRouteInfo>? children})
    : super(BookingEventRoute.name, initialChildren: children);

  static const String name = 'BookingEventRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i2.BookingEventScreen());
    },
  );
}

/// generated route for
/// [_i3.ClientHomeScreen]
class ClientHomeRoute extends _i19.PageRouteInfo<void> {
  const ClientHomeRoute({List<_i19.PageRouteInfo>? children})
    : super(ClientHomeRoute.name, initialChildren: children);

  static const String name = 'ClientHomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i3.ClientHomeScreen());
    },
  );
}

/// generated route for
/// [_i4.ClientMainScreen]
class ClientMainRoute extends _i19.PageRouteInfo<void> {
  const ClientMainRoute({List<_i19.PageRouteInfo>? children})
    : super(ClientMainRoute.name, initialChildren: children);

  static const String name = 'ClientMainRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i4.ClientMainScreen();
    },
  );
}

/// generated route for
/// [_i5.ClientProfileScreen]
class ClientProfileRoute extends _i19.PageRouteInfo<void> {
  const ClientProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(ClientProfileRoute.name, initialChildren: children);

  static const String name = 'ClientProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i5.ClientProfileScreen());
    },
  );
}

/// generated route for
/// [_i6.ClientWorkoutsScreen]
class ClientWorkoutsRoute extends _i19.PageRouteInfo<void> {
  const ClientWorkoutsRoute({List<_i19.PageRouteInfo>? children})
    : super(ClientWorkoutsRoute.name, initialChildren: children);

  static const String name = 'ClientWorkoutsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i6.ClientWorkoutsScreen();
    },
  );
}

/// generated route for
/// [_i7.CoachDetailScreen]
class CoachDetailRoute extends _i19.PageRouteInfo<CoachDetailRouteArgs> {
  CoachDetailRoute({
    _i20.Key? key,
    required int id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         CoachDetailRoute.name,
         args: CoachDetailRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'CoachDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CoachDetailRouteArgs>();
      return _i19.WrappedRoute(
        child: _i7.CoachDetailScreen(key: args.key, id: args.id),
      );
    },
  );
}

class CoachDetailRouteArgs {
  const CoachDetailRouteArgs({this.key, required this.id});

  final _i20.Key? key;

  final int id;

  @override
  String toString() {
    return 'CoachDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i8.CoachHomeScreen]
class CoachHomeRoute extends _i19.PageRouteInfo<void> {
  const CoachHomeRoute({List<_i19.PageRouteInfo>? children})
    : super(CoachHomeRoute.name, initialChildren: children);

  static const String name = 'CoachHomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.CoachHomeScreen();
    },
  );
}

/// generated route for
/// [_i9.CoachMainScreen]
class CoachMainRoute extends _i19.PageRouteInfo<void> {
  const CoachMainRoute({List<_i19.PageRouteInfo>? children})
    : super(CoachMainRoute.name, initialChildren: children);

  static const String name = 'CoachMainRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.CoachMainScreen();
    },
  );
}

/// generated route for
/// [_i10.CoachProfileScreen]
class CoachProfileRoute extends _i19.PageRouteInfo<void> {
  const CoachProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(CoachProfileRoute.name, initialChildren: children);

  static const String name = 'CoachProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i10.CoachProfileScreen();
    },
  );
}

/// generated route for
/// [_i11.CoachWorkoutsScreen]
class CoachWorkoutsRoute extends _i19.PageRouteInfo<void> {
  const CoachWorkoutsRoute({List<_i19.PageRouteInfo>? children})
    : super(CoachWorkoutsRoute.name, initialChildren: children);

  static const String name = 'CoachWorkoutsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i11.CoachWorkoutsScreen();
    },
  );
}

/// generated route for
/// [_i12.InitialScreen]
class InitialRoute extends _i19.PageRouteInfo<void> {
  const InitialRoute({List<_i19.PageRouteInfo>? children})
    : super(InitialRoute.name, initialChildren: children);

  static const String name = 'InitialRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i12.InitialScreen());
    },
  );
}

/// generated route for
/// [_i13.OnBoardingScreen]
class OnBoardingRoute extends _i19.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i19.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i13.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i14.ResetPasswordScreen]
class ResetPasswordRoute extends _i19.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i20.Key? key,
    required String uid,
    required String token,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(key: key, uid: uid, token: token),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i19.WrappedRoute(
        child: _i14.ResetPasswordScreen(
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

  final _i20.Key? key;

  final String uid;

  final String token;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, uid: $uid, token: $token}';
  }
}

/// generated route for
/// [_i15.ServiceDetailScreen]
class ServiceDetailRoute extends _i19.PageRouteInfo<ServiceDetailRouteArgs> {
  ServiceDetailRoute({
    _i20.Key? key,
    required int id,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ServiceDetailRoute.name,
         args: ServiceDetailRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'ServiceDetailRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ServiceDetailRouteArgs>();
      return _i19.WrappedRoute(
        child: _i15.ServiceDetailScreen(key: args.key, id: args.id),
      );
    },
  );
}

class ServiceDetailRouteArgs {
  const ServiceDetailRouteArgs({this.key, required this.id});

  final _i20.Key? key;

  final int id;

  @override
  String toString() {
    return 'ServiceDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i16.SignInScreen]
class SignInRoute extends _i19.PageRouteInfo<void> {
  const SignInRoute({List<_i19.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i16.SignInScreen());
    },
  );
}

/// generated route for
/// [_i17.SignUpScreen]
class SignUpRoute extends _i19.PageRouteInfo<void> {
  const SignUpRoute({List<_i19.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.WrappedRoute(child: const _i17.SignUpScreen());
    },
  );
}

/// generated route for
/// [_i18.SignUpWorkoutScreen]
class SignUpWorkoutRoute extends _i19.PageRouteInfo<SignUpWorkoutRouteArgs> {
  SignUpWorkoutRoute({
    _i20.Key? key,
    int? coachId,
    int? workoutTypeId,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         SignUpWorkoutRoute.name,
         args: SignUpWorkoutRouteArgs(
           key: key,
           coachId: coachId,
           workoutTypeId: workoutTypeId,
         ),
         initialChildren: children,
       );

  static const String name = 'SignUpWorkoutRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpWorkoutRouteArgs>(
        orElse: () => const SignUpWorkoutRouteArgs(),
      );
      return _i19.WrappedRoute(
        child: _i18.SignUpWorkoutScreen(
          key: args.key,
          coachId: args.coachId,
          workoutTypeId: args.workoutTypeId,
        ),
      );
    },
  );
}

class SignUpWorkoutRouteArgs {
  const SignUpWorkoutRouteArgs({this.key, this.coachId, this.workoutTypeId});

  final _i20.Key? key;

  final int? coachId;

  final int? workoutTypeId;

  @override
  String toString() {
    return 'SignUpWorkoutRouteArgs{key: $key, coachId: $coachId, workoutTypeId: $workoutTypeId}';
  }
}

/// generated route for
/// [_i2.SuccessBookingEventScreen]
class SuccessBookingEventRoute extends _i19.PageRouteInfo<void> {
  const SuccessBookingEventRoute({List<_i19.PageRouteInfo>? children})
    : super(SuccessBookingEventRoute.name, initialChildren: children);

  static const String name = 'SuccessBookingEventRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.SuccessBookingEventScreen();
    },
  );
}
