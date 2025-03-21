import 'package:auto_route/auto_route.dart';
import 'package:mobile_trampoline_park/presentation/routing/app_routing.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnBoardingRoute.page, path: '/'),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: SignUpRoute.page),
  ];
}
