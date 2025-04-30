part of 'client_detail_part.dart';

@RoutePage()
class ClientDetailScreen extends StatefulWidget implements AutoRouteWrapper {
  const ClientDetailScreen({super.key, required this.clientId});
  final int clientId;

  @override
  State<ClientDetailScreen> createState() => _ClientDetailScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              (ClientDetailBloc(clientUseCases: injection()))
                ..add(ClientDetailEvent.loadData(clientId: clientId)),
      child: this,
    );
  }
}

class _ClientDetailScreenState extends State<ClientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientDetailBloc, ClientDetailState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state.status) {
            Status.loaded => SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Stack(
                        children: [
                          BaseImageNetworkWidget(
                            url: state.profilePicture ?? AppConstants.empty,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1 / 2,
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
                            bottom: MediaQuery.of(context).size.height * 0.20,
                            child: UserBasicInformationWidget(
                              experience: AppConstants.empty,
                              firstName: state.firstName,
                              lastName: state.lastName,
                              isClientInformation: true,
                              isHealthy: state.isHealthy!,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.green,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      2 <= state.age % 10 && state.age % 10 < 5
                                          ? '🎂 ${state.age} ${context.localization.yearA}'
                                          : state.age % 10 == 1
                                          ? '🎂 ${state.age} ${context.localization.year}'
                                          : '🎂 ${state.age} ${context.localization.summerYears}',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.headlineMedium,
                                    ),
                                    Text(
                                      state.isHealthy!
                                          ? '❤️ ${context.localization.healthy}'
                                          : '❤️ ${context.localization.notHealthy}',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
