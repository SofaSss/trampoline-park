part of 'client_home_part.dart';

@RoutePage()
class ClientHomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
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
                ..add(ClientHomeEvent.getVideoWarmUp()),
      child: this,
    );
  }
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientHomeBloc, ClientHomeState>(
      builder: (context, state) {
        switch (state.status) {
          case (Status.loaded):
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Row(
                          spacing: 10,
                          children: [
                            BaseProfilePicture(imageUrl: state.profilePicture),
                            Expanded(
                              child: Column(
                                spacing: 5,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.localization.hiHome,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge
                                        ?.copyWith(color: AppColors.blue),
                                  ),
                                  Text(
                                    context.localization.homeDescription,
                                    style:
                                        Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      HeaderSectionWidget(
                        title: context.localization.services,
                        description: context.localization.servicesDescription,
                      ),
                      SizedBox(
                        height: AppConstants.bigCardHeight,
                        child: ListView.separated(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.workouts.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: BaseBigCard(
                                imageUrl: state.workouts[index].workoutPicture,
                                name: state.workouts[index].name,
                                shortDescription:
                                    state.workouts[index].description,
                              ),
                              onTap:
                                  () => (context.router.push(
                                    ServiceDetailRoute(
                                      id: state.workouts[index].id,
                                    ),
                                  )),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 30,
                              height: AppConstants.bigCardHeight,
                            );
                          },
                        ),
                      ),

                      HeaderSectionWidget(
                        title: context.localization.coaches,
                        description: context.localization.coachesDescription,
                      ),
                      SizedBox(
                        height: AppConstants.mediumCardHeight,
                        child: ListView.separated(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.coaches.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: BaseMediumCard(
                                imageUrl: state.coaches[index].profilePicture,
                                name: state.coaches[index].firstName,
                                lastName: state.coaches[index].lastName,
                              ),
                              onTap:
                                  () => (context.router.push(
                                    CoachDetailRoute(
                                      id: state.coaches[index].id,
                                    ),
                                  )),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 15,
                              height: AppConstants.mediumCardHeight,
                            );
                          },
                        ),
                      ),

                      HeaderSectionWidget(
                        title: context.localization.excursion,
                        description: context.localization.excursionDescription,
                      ),
                      VideoPlayerWidget(
                        videoPath: state.videoExcursionUrl,
                        isVerticalVideo: true,
                      ),

                      HeaderSectionWidget(
                        title: context.localization.video,
                        description: context.localization.videoDescription,
                      ),
                      VideoPlayerWidget(videoPath: state.videoUrl),

                      HeaderSectionWidget(
                        title: context.localization.happyBirthday,
                        description:
                            context.localization.happyBirthdayDescription,
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 250,
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            spacing: 7,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  'assets/on_boarding_pictures/event.jpg',
                                  fit: BoxFit.cover,
                                  width: 300,
                                  height: 250,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform:
                                        Matrix4.identity()
                                          ..scale(-1.0, 1.0, 1.0),
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: AppColors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      HeaderSectionWidget(
                        title: context.localization.map,
                        description: context.localization.address,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: YandexMapWidget(),
                      ),

                      Center(
                        child: SizedBox(
                          height: 80,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            itemCount: state.communications.length,
                            itemBuilder: (context, index) {
                              return LinkIconWidget(
                                icon: state.communications[index].icon,
                                connectUrl: state.communications[index].link,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          case (Status.loading):
            return BaseProgressIndicator();
          case (Status.failure):
            return FailureWidget();
          default:
            return Container();
        }
      },
    );
  }
}
