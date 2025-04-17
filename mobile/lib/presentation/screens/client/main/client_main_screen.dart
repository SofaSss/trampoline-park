part of 'client_main_part.dart';

@RoutePage()
class ClientMainScreen extends StatelessWidget {
  const ClientMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ClientHomeRoute(),
        ClientWorkoutsRoute(),
        ClientProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (_) =>
                      ClientHomeBloc(
                          clientUseCases: injection(),
                          workoutUseCases: injection(),
                          coachUseCases: injection(),
                        )
                        ..add(ClientHomeEvent.getProfilePicture())
                        ..add(ClientHomeEvent.getWorkoutTypeList())
                        ..add(ClientHomeEvent.getCoachList())
                        ..add(ClientHomeEvent.getVideoWarmUp())
                        ..add(ClientHomeEvent.getCommunicationList()),
              child: ClientHomeScreen(),
            ),

            BlocProvider(
              create:
                  (_) => ClientProfileBloc(
                    clientUseCases: injection(),
                    tokenUseCases: injection(),
                    authUserUseCases: injection(),
                  )..add(ClientProfileEvent.getCurrentClient()),
              child: ClientProfileScreen(),
            ),
          ],
          child: Scaffold(
            body: child,
            bottomNavigationBar: baseNavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: tabsRouter.setActiveIndex,
            ),
          ),
        );
      },
    );
  }
}