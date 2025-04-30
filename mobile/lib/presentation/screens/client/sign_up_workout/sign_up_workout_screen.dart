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
  List<DateTime> days = _daysInMonth(DateTime.now()).toList();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    selectedCoachId = widget.coachId;
    selectedWorkoutTypeId = widget.workoutTypeId;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
          key: scaffoldKey,
          appBar: appBarWithCalendar(
            context: context,
            title: context.localization.schedule,
            back: () => (context.router.push(ClientHomeRoute())),
            onPressedDrawerIcon: () => scaffoldKey.currentState?.openDrawer(),
            isDrawer: true,
            days: days,
            onTapDate: (day) {
              setState(() {
                _selectedDate = day;
                selectedCoachId = null;
                selectedWorkoutTypeId = null;
              });

              context.read<SignUpWorkoutBloc>().add(
                SignUpWorkoutEvent.loadData(date: _selectedDate, reset: true),
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
                  reset: true,
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
                  reset: true,
                ),
              );
            },
            coachList: state.coachList,
            workoutTypeList: state.workoutTypeList,
          ),
          body: switch (state.status) {
            WorkoutStatus.loaded || WorkoutStatus.loadingMore =>
              state.workoutList.isNotEmpty
                  ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          if (state.status == WorkoutStatus.loaded ||
                              state.status == WorkoutStatus.loadingMore) ...[
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.workoutList.length,
                              itemBuilder: (context, index) {
                                if (index == state.workoutList.length - 1 &&
                                    !state.hasReachedEnd &&
                                    state.status != WorkoutStatus.loadingMore) {
                                  context.read<SignUpWorkoutBloc>().add(
                                    SignUpWorkoutEvent.loadData(
                                      coachId: selectedCoachId,
                                      workoutTypeId: selectedWorkoutTypeId,
                                      date: _selectedDate,
                                    ),
                                  );
                                }

                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 10,
                                  ),
                                  child: BaseWorkoutCard(
                                    isClientSignUpWorkout: state
                                        .workoutList[index]
                                        .clients
                                        .contains(state.clientId),
                                    time: state.workoutList[index].dateTime,
                                    duration:
                                        state
                                            .workoutList[index]
                                            .workoutType
                                            .duration
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
                                        state
                                            .workoutList[index]
                                            .workoutType
                                            .name,
                                    coachPicture:
                                        state
                                            .workoutList[index]
                                            .coach
                                            .profilePicture,
                                    coachFirstName:
                                        state
                                            .workoutList[index]
                                            .coach
                                            .firstName,
                                    coachLastName:
                                        state.workoutList[index].coach.lastName,
                                    price:
                                        state
                                            .workoutList[index]
                                            .workoutType
                                            .price
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
                                                !state
                                                    .workoutList[index]
                                                    .clients
                                                    .contains(state.clientId)
                                            ? () {
                                              context.read<SignUpWorkoutBloc>().add(
                                                SignUpWorkoutEvent.clientSignUpWorkout(
                                                  workoutId:
                                                      state
                                                          .workoutList[index]
                                                          .id,
                                                ),
                                              );
                                            }
                                            : null,
                                  ),
                                );
                              },
                            ),
                          ],

                          if (!state.hasReachedEnd) ...[
                            const LoadMoreDataIndicator(),
                          ],
                        ],
                      ),
                    ),
                  )
                  : NoWorkoutsWidget(),

            WorkoutStatus.loading => BaseProgressIndicator(),
            WorkoutStatus.failure => FailureWidget(),
            _ => BaseProgressIndicator(),
          },
        );
      },
    );
  }
}
