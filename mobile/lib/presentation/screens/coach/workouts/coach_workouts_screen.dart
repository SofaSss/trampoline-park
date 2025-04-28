part of 'coach_workouts_part.dart';

@RoutePage()
class CoachWorkoutsScreen extends StatefulWidget implements AutoRouteWrapper {
  const CoachWorkoutsScreen({super.key});

  @override
  State<CoachWorkoutsScreen> createState() => _CoachWorkoutsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              (CoachWorkoutsBloc(workoutUseCases: injection())
                ..add(CoachWorkoutsEvent.loadData(date: _selectedDate))),
      child: this,
    );
  }
}

DateTime _selectedDate = DateTime.now();
List<DateTime> _daysInMonth(DateTime date) {
  int lastDay = DateTime(date.year, date.month + 1, 0).day;
  return List.generate(
    lastDay,
    (index) => DateTime(date.year, date.month, index + 1),
  );
}

class _CoachWorkoutsScreenState extends State<CoachWorkoutsScreen> {
  List<DateTime> days = _daysInMonth(DateTime.now()).toList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachWorkoutsBloc, CoachWorkoutsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWithCalendar(
            context: context,
            title: context.localization.workouts,
            back: () => (context.router.push(CoachHomeRoute())),
            days: days,
            onTapDate: (day) {
              setState(() {
                _selectedDate = day;
              });
              context.read<CoachWorkoutsBloc>().add(
                CoachWorkoutsEvent.loadData(date: _selectedDate),
              );
            },
            selectedDate: _selectedDate,
            isCoach: true,
          ),
          body: switch (state.status) {
            WorkoutStatus.loaded =>
              state.workoutList.isNotEmpty
                  ? ListView.builder(
                    itemCount: state.workoutList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: BaseWorkoutCard(
                          time: state.workoutList[index].dateTime,
                          duration:
                              state.workoutList[index].workoutType.duration
                                  .toString(),
                          freeSpace: AppConstants.empty,
                          workoutType:
                              state.workoutList[index].workoutType.name,
                          coachPicture: AppConstants.empty,
                          coachFirstName:
                              state.workoutList[index].coach.firstName,
                          coachLastName:
                              state.workoutList[index].coach.lastName,
                          price: AppConstants.empty,
                          onSignUpWorkout: null,
                          isClientSignUpWorkout: false,
                          isCoach: true,
                          clientsList: state.workoutList[index].clients,
                        ),
                      );
                    },
                  )
                  : NoWorkoutsWidget(),

            WorkoutStatus.loading => BaseProgressIndicator(),
            WorkoutStatus.failure => FailureWidget(),
            _ => FailureWidget(),
          },
        );
      },
    );
  }
}
