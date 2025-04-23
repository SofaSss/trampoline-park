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
    return AutoTabsRouter(
      routes: const [
        CoachHomeRoute(),
        CoachWorkoutsRoute(),
        CoachProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (_) =>
                      CoachProfileBloc(coachUseCases: injection())
                        ..add(CoachProfileEvent.loadData()),
              child: CoachProfileScreen(),
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
