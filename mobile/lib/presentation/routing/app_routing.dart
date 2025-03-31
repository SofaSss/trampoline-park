import 'package:auto_route/auto_route.dart';
import 'package:mobile_trampoline_park/presentation/routing/app_routing.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: InitialRoute.page),
    AutoRoute(page: OnBoardingRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(
      page: ClientMainRoute.page,
      children: [
        AutoRoute(page: ClientHomeRoute.page),
        AutoRoute(page: ClientWorkoutsRoute.page),
        AutoRoute(page: ClientProfileRoute.page),
      ],
    ),
    AutoRoute(
      page: CoachMainRoute.page,
      children: [
        AutoRoute(page: CoachHomeRoute.page),
        AutoRoute(page: CoachWorkoutsRoute.page),
        AutoRoute(page: CoachProfileRoute.page),
      ],
    ),
    AutoRoute(page: ActivationRoute.page),
  ];
}
