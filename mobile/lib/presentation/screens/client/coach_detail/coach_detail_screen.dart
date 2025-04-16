part of 'coach_detail_part.dart';

@RoutePage()
class CoachDetailScreen extends StatefulWidget implements AutoRouteWrapper {
  const CoachDetailScreen({super.key, required this.id});
  final int id;

  @override
  State<CoachDetailScreen> createState() => _CoachDetailScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              (CoachDetailBloc(coachUseCases: injection())
                ..add(CoachDetailEvent.loadData(id: id))),
      child: this,
    );
  }
}

class _CoachDetailScreenState extends State<CoachDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachDetailBloc, CoachDetailState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.loaded:
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 1 / 2 + 20,
                        child: Stack(
                          children: [
                            BaseImageNetworkWidget(
                              url: state.coachPicture,
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 1 / 2,
                            ),
                            Positioned(
                              top: 5,
                              left: 5,
                              child: GestureDetector(
                                onTap: () => (context.router.maybePop()),
                                child: BackIcon(),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: CoachBasicInformationWidget(
                                experience: state.experience,
                                firstName: state.firstName,
                                lastName: state.lastName,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: QuoteWidget(quote: state.quote),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 10),
                        child: Text(
                          context.localization.specialization,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      ...List.generate(
                        state.specialties.length,
                        (index) => ElementListWidget(
                          element: state.specialties[index],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 10),
                        child: Text(
                          context.localization.achievements,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      ...List.generate(
                        state.achievements.length,
                        (index) => ElementListWidget(
                          element: state.achievements[index],
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed:
                                () => (context.router.push(
                                  SignUpWorkoutRoute(coachId: widget.id),
                                )),
                            child: Text(context.localization.enterToWorkout),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case Status.loading:
            return BaseProgressIndicator();
          case Status.failure:
            return FailureWidget();
          default:
            return FailureWidget();
        }
      },
    );
  }
}
