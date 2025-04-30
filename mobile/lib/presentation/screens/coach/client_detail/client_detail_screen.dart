part of 'client_detail_part.dart';

@RoutePage()
class ClientDetailScreen extends StatefulWidget {
  const ClientDetailScreen({super.key, required this.clientId});
  final int clientId;

  @override
  State<ClientDetailScreen> createState() => _ClientDetailScreenState();
}

class _ClientDetailScreenState extends State<ClientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Stack(
                  children: [
                    BaseImageNetworkWidget(
                      url:
                          'https://avatars.mds.yandex.net/i?id=f50af55a565357c56455f2fddb178d9b43935b26-5232815-images-thumbs&n=13',
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
                        firstName: 'state.firstName',
                        lastName: 'state.lastName',
                        isClientInformation: true,
                        isHealthy: false,
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
                                '🎂 8 лет',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                '❤️ Здоров',
                                style: Theme.of(context).textTheme.headlineMedium,
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
    );
  }
}
