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
          (_) => (SignUpWorkoutBloc(
            workoutUseCases: injection(),
            coachUseCases: injection(),
            clientUseCases: injection(),
          )..add(
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
  bool isChecked = false;
  int? selectedCoachId;
  int? selectedWorkoutTypeId;
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
  void initState() {
    super.initState();
    selectedCoachId = widget.coachId;
    selectedWorkoutTypeId = widget.workoutTypeId;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocConsumer<SignUpWorkoutBloc, SignUpWorkoutState>(
      listener: (context, state) {
        if (state.status == WorkoutStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            baseSnackBar(
              context: context,
              message: context.localization.successSignUpWorkout,
            ),
          );
          context.router.push(ClientWorkoutsRoute());
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: appBarWithCalendar(
            context: context,
            title: 'Расписание',
            back: () => (context.router.push(ClientHomeRoute())),
            onPressedDrawerIcon: () => _scaffoldKey.currentState?.openDrawer(),
            isDrawer: true,
            days: days,
            onTapDate: (day) {
              setState(() {
                _selectedDate = day;
              });

              context.read<SignUpWorkoutBloc>().add(
                SignUpWorkoutEvent.loadData(date: _selectedDate),
              );
            },
            selectedDate: _selectedDate,
          ),
          drawer: filterDrawer(
            context: context,
            selectedCoachId: selectedCoachId,
            onCoachSelected: (id) {
              setState(() {
                selectedCoachId = id;
              });
              context.read<SignUpWorkoutBloc>().add(
                SignUpWorkoutEvent.loadData(
                  coachId: selectedCoachId,
                  date: _selectedDate,
                ),
              );
            },
            selectedWorkoutTypeId: selectedWorkoutTypeId,
            onWorkoutTypeSelected: (id) {
              setState(() {
                selectedWorkoutTypeId = id;
              });
              context.read<SignUpWorkoutBloc>().add(
                SignUpWorkoutEvent.loadData(
                  workoutTypeId: selectedWorkoutTypeId,
                  date: _selectedDate,
                ),
              );
            },
            coachList: state.coachList,
            workoutTypeList: state.workoutTypeList,
          ),
          body: switch (state.status) {
            WorkoutStatus.loaded => SizedBox(
              height: MediaQuery.of(context).size.height,
              child:
                  state.workoutList.isNotEmpty
                      ? ListView.builder(
                        itemCount: state.workoutList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              right: 10,
                              left: 10,
                            ),
                            child: BaseWorkoutCard(
                              isClientSignUpWorkout: state
                                  .workoutList[index]
                                  .clients
                                  .contains(state.clientId),
                              time: DateFormat(
                                'HH:mm',
                              ).format(state.workoutList[index].dateTime),
                              duration:
                                  state.workoutList[index].workoutType.duration
                                      .toString(),
                              freeSpace:
                                  (state
                                              .workoutList[index]
                                              .workoutType
                                              .maxClients -
                                          state
                                              .workoutList[index]
                                              .clients
                                              .length)
                                      .toString(),
                              workoutType:
                                  state.workoutList[index].workoutType.name,
                              coachPicture:
                                  state.workoutList[index].coach.profilePicture,
                              coachFirstName:
                                  state.workoutList[index].coach.firstName,
                              coachLastName:
                                  state.workoutList[index].coach.lastName,
                              price:
                                  state.workoutList[index].workoutType.price
                                      .toString(),
                              onSignUpWorkout:
                                  state
                                                      .workoutList[index]
                                                      .workoutType
                                                      .maxClients -
                                                  state
                                                      .workoutList[index]
                                                      .clients
                                                      .length >
                                              0 &&
                                          !state.workoutList[index].clients
                                              .contains(state.clientId)
                                      ? () {
                                        context.read<SignUpWorkoutBloc>().add(
                                          SignUpWorkoutEvent.clientSignUpWorkout(
                                            workoutId:
                                                state.workoutList[index].id,
                                          ),
                                        );
                                      }
                                      : null,
                            ),
                          );
                        },
                      )
                      : NoWorkoutsWidget(),
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
