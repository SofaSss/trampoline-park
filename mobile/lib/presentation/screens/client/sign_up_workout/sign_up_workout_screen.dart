part of 'sign_up_workout_part.dart';

@RoutePage()
class SignUpWorkoutScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignUpWorkoutScreen({super.key, this.coachId, this.workoutTypeId});
  final int? coachId;
  final int? workoutTypeId;

  @override
  State<SignUpWorkoutScreen> createState() => _SignUpWorkoutScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) => (SignUpWorkoutBloc(workoutUseCases: injection())..add(
            SignUpWorkoutEvent.loadData(
              coachId: coachId,
              workoutTypeId: workoutTypeId,
              date: DateTime.now(),
            ),
          )),
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

class _SignUpWorkoutScreenState extends State<SignUpWorkoutScreen> {
  List<DateTime> days =
      _daysInMonth(DateTime.now())
          .where(
            (day) =>
                !day.isBefore(
                  DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                ),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpWorkoutBloc, SignUpWorkoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWithCalendar(
            context: context,
            title: 'Расписание',
            back: () => (context.router.push(ClientHomeRoute())),
            days: days,
            onTapDate: (day) {
              setState(() {
                _selectedDate = day;
              });

              context.read<SignUpWorkoutBloc>().add(
                SignUpWorkoutEvent.loadData(
                  coachId: widget.coachId,
                  workoutTypeId: widget.workoutTypeId,
                  date: _selectedDate,
                ),
              );
            },
            selectedDate: _selectedDate,
          ),
          body: switch (state.status) {
            WorkoutStatus.loaded => SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: state.workoutList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: BaseWorkoutCard(
                      time: DateFormat(
                        'HH:mm',
                      ).format(state.workoutList[index].dateTime),
                      duration:
                          state.workoutList[index].workoutType.duration
                              .toString(),
                      freeSpace:
                          (state.workoutList[index].workoutType.maxClients -
                                  state.workoutList[index].clients.length)
                              .toString(),
                      workoutType: state.workoutList[index].workoutType.name,
                      coachPicture:
                          state.workoutList[index].coach.profilePicture,
                      coachFirstName: state.workoutList[index].coach.firstName,
                      coachLastName: state.workoutList[index].coach.lastName,
                      price:
                          state.workoutList[index].workoutType.price.toString(),
                    ),
                  );
                },
              ),
            ),

            WorkoutStatus.loading => BaseProgressIndicator(),
            WorkoutStatus.failure => FailureWidget(),
            _ => FailureWidget(),
          },
        );
      },
    );
  }
}
