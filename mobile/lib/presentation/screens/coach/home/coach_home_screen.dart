part of 'coach_home_part.dart';

@RoutePage()
class CoachHomeScreen extends StatefulWidget {
  const CoachHomeScreen({super.key});

  @override
  State<CoachHomeScreen> createState() => _CoachHomeScreenState();
}

class _CoachHomeScreenState extends State<CoachHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                profilePicture:
                    'https://avatars.mds.yandex.net/i?id=f50af55a565357c56455f2fddb178d9b43935b26-5232815-images-thumbs&n=13',
                isCoach: true,
                coachName: 'Иван',
              ),
              SectionHeader(title: 'Тренировки на сегодня'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                height: AppConstants.mediumCardHeight + 10,
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: BaseWorkoutCard(
                          time: DateTime.now(),
                          duration: '3',
                          freeSpace: AppConstants.empty,
                          workoutType: 'тип',
                          coachPicture: AppConstants.empty,
                          coachFirstName: 'иван',
                          coachLastName: 'иванов',
                          price: AppConstants.empty,
                          onSignUpWorkout: null,
                          isClientSignUpWorkout: false,
                          isCoach: true,
                          clientsList: [],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SectionHeader(title: 'Ваш прогресс в цифрах:'),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProgressInNumbersWidget(
                      icon: '✅',
                      title: 'Отработано часов:',
                      number: '20',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: ProgressInNumbersWidget(
                        icon: '💪',
                        title: 'Проведено тренеровок:',
                        number: '15',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: ProgressInNumbersWidget(
                        icon: '🔥',
                        title: 'Проведено мероприятий:',
                        number: '30',
                      ),
                    ),
                    Text(
                      'Это на ХХ% больше, чем в прошлом месяце. Чем больше тренировок – тем выше ваш результат!',
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SectionHeader(title: 'Ученики:'),
              SizedBox(
                height: AppConstants.mediumCardHeight,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: BaseMediumCard(
                          imageUrl:
                              'https://avatars.mds.yandex.net/i?id=f50af55a565357c56455f2fddb178d9b43935b26-5232815-images-thumbs&n=13',
                          name: 'иван',
                          lastName: 'иванов',
                          isCoach: true,
                          isClientHealthy: false,
                        ),
                      ),
                      onTap: () => (),
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
            ],
          ),
        ),
      ),
    );
  }
}
