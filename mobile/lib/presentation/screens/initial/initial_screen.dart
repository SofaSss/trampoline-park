part of 'initial_part.dart';

@RoutePage()
class InitialScreen extends StatefulWidget implements AutoRouteWrapper {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              InitialBloc(tokenUseCases: injection(), userUseCases: injection())
                ..add(InitialEvent.checkToken()),
      child: this,
    );
  }
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialBloc, InitialState>(
      listener: (context, state) {
        if (state.status == InitialStatus.toClientMainScreen) {
          context.router.replaceAll([ClientMainRoute()]);
        } else if (state.status == InitialStatus.toCoachMainScreen) {
          context.router.replaceAll([CoachMainRoute()]);
        } else if (state.status == InitialStatus.toOnBoardingScreen) {
          context.router.replaceAll([OnBoardingRoute()]);
        }
      },
      child: BaseProgressIndicator(),
    );
  }
}
