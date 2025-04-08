part of 'service_detail_part.dart';

@RoutePage()
class ServiceDetailScreen extends StatefulWidget implements AutoRouteWrapper {
  const ServiceDetailScreen({super.key, required this.id});
  final int id;

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              (ServiceDetailBloc(workoutUseCases: injection())
                ..add(ServiceDetailEvent.loadData(id: id))),
      child: this,
    );
  }
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceDetailBloc, ServiceDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: baseAppBar(
            context: context,
            title: state.serviceName,
            back: () => (context.router.maybePop()),
          ),
          body: switch (state.status) {
            Status.loaded => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  BaseImageNetworkWidget(
                    url: state.serviceImage,
                    width: MediaQuery.of(context).size.width - 20,
                    height: 320,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          state.serviceName,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      Text(
                        state.serviceDuration,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        context.localization.hour,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      state.serviceDescription,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => (),
                    child: Text(context.localization.enter),
                  ),
                ],
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
