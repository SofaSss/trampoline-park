part of 'coach_main_part.dart';

@RoutePage()
class CoachMainScreen extends StatefulWidget {
  const CoachMainScreen({super.key});

  @override
  State<CoachMainScreen> createState() => _CoachMainScreenState();
}

class _CoachMainScreenState extends State<CoachMainScreen> {
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
            CoachHomeScreen(),

            CoachWorkoutsScreen(),

            CoachProfileScreen(),
          ][currentPageIndex],
    );
  }
}
