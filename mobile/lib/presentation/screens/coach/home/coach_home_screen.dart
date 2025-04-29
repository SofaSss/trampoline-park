part of 'coach_home_part.dart';

@RoutePage()
class CoachHomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const CoachHomeScreen({super.key});

  @override
  State<CoachHomeScreen> createState() => _CoachHomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) => (CoachHomeBloc(
            workoutUseCases: injection(),
            coachUseCases: injection(),
            eventUseCases: injection(),
          ))..add(CoachHomeEvent.loadData()),
      child: this,
    );
  }
}

class _CoachHomeScreenState extends State<CoachHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachHomeBloc, CoachHomeState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state.status) {
            Status.loaded => SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(
                      profilePicture: state.coachProfilePicture,
                      isCoach: true,
                      coachName: state.coachName,
                    ),
                    SectionHeader(title: context.localization.todayWorkouts),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      height: AppConstants.mediumCardHeight * 1.5,
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: state.todayWorkoutsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 20,
                              ),
                              child: CoachWorkoutCard(
                                time: state.todayWorkoutsList[index].dateTime,
                                duration:
                                    state
                                        .todayWorkoutsList[index]
                                        .workoutType
                                        .duration
                                        .toString(),
                                workoutType:
                                    state
                                        .todayWorkoutsList[index]
                                        .workoutType
                                        .name,
                                clientsList:
                                    state.todayWorkoutsList[index].clients,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SectionHeader(title: context.localization.progressTitle),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProgressInNumbersWidget(
                            icon: '✅',
                            title: context.localization.progressHours,
                            number: state.coachMonthHours,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: ProgressInNumbersWidget(
                              icon: '💪',
                              title: context.localization.progressWorkouts,
                              number: state.coachMonthWorkouts,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 80.0),
                            child: ProgressInNumbersWidget(
                              icon: '🔥',
                              title: context.localization.progressEvents,
                              number: state.coachMonthEvents,
                            ),
                          ),
                          Text(
                            context.localization.progressSentence,
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(color: AppColors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    SectionHeader(title: context.localization.students),
                    SizedBox(height: 10),
                    SizedBox(
                      height: AppConstants.mediumCardHeight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.coachClients.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: BaseMediumCard(
                                imageUrl:
                                    state.coachClients[index].profilePicture,
                                name: state.coachClients[index].firstName,
                                lastName: state.coachClients[index].lastName,
                                isCoach: true,
                                isClientHealthy:
                                    state.coachClients[index].isHealthy ?? true,
                              ),
                            ),

                            onTap: () => (),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Status.loading => BaseProgressIndicator(),
            Status.failure => FailureWidget(),
            _ => FailureWidget(),
          },
        );
      },
    );
  }
}
