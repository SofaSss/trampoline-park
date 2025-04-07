part of 'client_home_part.dart';

@RoutePage()
class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                    BaseProfilePicture(),
                    Expanded(
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localization.hiHome,
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(color: AppColors.blue),
                          ),
                          Text(
                            context.localization.homeDescription,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 10, left: 30),
                child: Text(
                  context.localization.services,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(
                height: AppConstants.bigCardHeight,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return BaseBigCard(
                      imageUrl:
                          'https://avatars.mds.yandex.net/get-yapic/59871/TmYKC5iHtS65ammQVjJbgt5iiE-1/orig',
                      name: 'Услуга',
                      shortDescription:
                          'Описание описание описание супер описание',
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

              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 10, left: 30),
                child: Text(
                  context.localization.coaches,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              SizedBox(
                height: AppConstants.mediumCardHeight,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 30),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return BaseMediumCard(
                      imageUrl:
                          'https://i.pinimg.com/736x/5e/98/22/5e9822481a29d9acacb886acb0705adc.jpg',
                      name: 'Иван',
                      lastName: 'Иванов',
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

              Container(
                padding: const EdgeInsets.only(top: 18.0, bottom: 10, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.localization.video,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      context.localization.videoDescription,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              VideoPlayerWidget(
                videoPath:
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
              ),

              Container(
                padding: const EdgeInsets.only(top: 18.0, bottom: 10, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.localization.map,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      context.localization.address,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return LinkIconWidget(
                        connectUrl: 'https://pub.dev/packages/url_launcher',
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
  }
}
