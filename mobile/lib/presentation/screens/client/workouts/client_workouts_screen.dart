part of 'client_workouts_part.dart';

@RoutePage()
class ClientWorkoutsScreen extends StatefulWidget implements AutoRouteWrapper {
  const ClientWorkoutsScreen({super.key});

  @override
  State<ClientWorkoutsScreen> createState() => _ClientWorkoutsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              (ClientWorkoutsBloc(workoutUseCases: injection())
                  ..add(ClientWorkoutsEvent.loadData(date: _selectedDate)))
                ..add(ClientWorkoutsEvent.loadRatingData()),
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

class _ClientWorkoutsScreenState extends State<ClientWorkoutsScreen> {
  List<DateTime> days = _daysInMonth(DateTime.now()).toList();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientWorkoutsBloc, ClientWorkoutsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBarWithCalendar(
            context: context,
            title: 'Мои тренировки',
            back: () => (context.router.push(ClientHomeRoute())),
            days: days,
            onTapDate: (day) {
              setState(() {
                _selectedDate = day;
              });
              context.read<ClientWorkoutsBloc>().add(
                ClientWorkoutsEvent.loadData(date: _selectedDate),
              );
            },
            selectedDate: _selectedDate,
          ),
          body: switch (state.status) {
            WorkoutStatus.loaded => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClientRatingWidget(
                    isFirstRating: state.isFirstRating,
                    isSecondRating: state.isSecondRating,
                    isThirdRating: state.isThirdRating,
                    stayedWorkout: state.stayedWorkout,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18.0,
                      horizontal: 18,
                    ),
                    child: Text(
                      'Тренировки на ${DateFormat('dd.MM').format(_selectedDate)}:',
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(color: AppColors.blue),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child:
                          state.workoutList.isNotEmpty
                              ? ListView.builder(
                                itemCount: state.workoutList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: BaseWorkoutCard(
                                      time: state.workoutList[index].dateTime,
                                      duration:
                                          state
                                              .workoutList[index]
                                              .workoutType
                                              .duration
                                              .toString(),
                                      freeSpace: AppConstants.empty,
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
                                          state
                                              .workoutList[index]
                                              .coach
                                              .lastName,
                                      price:
                                          state
                                              .workoutList[index]
                                              .workoutType
                                              .price
                                              .toString(),
                                      onSignUpWorkout: () => (),
                                      isClientSignUpWorkout: true,
                                    ),
                                  );
                                },
                              )
                              : Column(
                                spacing: 20,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.logo,
                                    height: 150,
                                    width: 150,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.gray,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  Text(
                                    'На выбранную дату не найдено тренировок',
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.displayMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  ElevatedButton(
                                    onPressed:
                                        () => (context.router.push(
                                          SignUpWorkoutRoute(),
                                        )),
                                    child: Text(context.localization.enter),
                                  ),
                                ],
                              ),
                    ),
                  ),
                ],
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
