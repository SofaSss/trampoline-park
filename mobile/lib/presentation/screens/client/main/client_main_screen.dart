part of 'client_main_part.dart';

@RoutePage()
class ClientMainScreen extends StatefulWidget {
  const ClientMainScreen({super.key});

  @override
  State<ClientMainScreen> createState() => _ClientMainScreenState();
}

class _ClientMainScreenState extends State<ClientMainScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: baseNavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
      ),
      body:
          <Widget>[
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

            ClientWorkoutsScreen(),

            BlocProvider(
              create:
                  (_) => ClientProfileBloc(
                    clientUseCases: injection(),
                    tokenUseCases: injection(),
                    authUserUseCases: injection(),
                  )..add(ClientProfileEvent.getCurrentClient()),
              child: ClientProfileScreen(),
            ),
          ][currentPageIndex],
    );
  }
}
