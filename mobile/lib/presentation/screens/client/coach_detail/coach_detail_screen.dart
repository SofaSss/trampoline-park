part of 'coach_detail_part.dart';

@RoutePage()
class CoachDetailScreen extends StatefulWidget {
  const CoachDetailScreen({super.key, required this.id});
  final int id;

  @override
  State<CoachDetailScreen> createState() => _CoachDetailScreenState();
}

class _CoachDetailScreenState extends State<CoachDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
                      url:
                          'https://avatars.mds.yandex.net/i?id=4fde34493bcb1405f1bba49cc17177ea66ae6b62-8497418-images-thumbs&n=13',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1 / 2,
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: GestureDetector(
                        onTap: () => (context.router.maybePop()),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            width: 50,
                            height: 50,
                            AppIcons.back,
                            color: AppColors.lightYellow,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.lightBlue,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 5,
                                  children: [
                                    Text('Стаж'),
                                    Text('4'),
                                    Text('год(а)'),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Тренер',
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(color: AppColors.white),
                                ),
                                Text(
                                  'Иван',
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(color: AppColors.white),
                                ),
                                Text(
                                  'Иванов',
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.format_quote,
                              size: 40,
                              color: Colors.white70,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Победа любит упорство.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
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
                4,
                (index) => ElementListWidget(element: 'Macтер спорта 2012'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 10),
                child: Text(
                  context.localization.achievements,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              ...List.generate(
                4,
                (index) => ElementListWidget(element: 'Супер спотсмен 2004'),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () => (),
                    child: Text(context.localization.enterToWorkout),
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
