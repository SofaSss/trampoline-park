part of 'client_workouts_part.dart';

@RoutePage()
class ClientWorkoutsScreen extends StatefulWidget {
  const ClientWorkoutsScreen({super.key});

  @override
  State<ClientWorkoutsScreen> createState() => _ClientWorkoutsScreenState();
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
  List<DateTime> days =
      _daysInMonth(DateTime.now())
          .where(
            (day) =>
                !day.isBefore(
                  DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                ),
          )
          .toList();
  @override
  Widget build(BuildContext context) {
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
        },
        selectedDate: _selectedDate,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClientRatingWidget(),
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
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BaseWorkoutCard(
                        time: DateTime.now(),
                        duration: '8',
                        freeSpace: ' ',
                        workoutType: 'Персональная',
                        coachPicture:
                            'https://avatars.mds.yandex.net/i?id=a94d968b1a293c873f388ed7c64c1c82d05e5f22-5588720-images-thumbs&n=13',
                        coachFirstName: 'Ivan',
                        coachLastName: 'Ivanov',
                        price: '2000',
                        onSignUpWorkout: () => (),
                        isClientSignUpWorkout: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
