part of 'coach_workouts_part.dart';

@RoutePage()
class CoachWorkoutsScreen extends StatefulWidget {
  const CoachWorkoutsScreen({super.key});

  @override
  State<CoachWorkoutsScreen> createState() => _CoachWorkoutsScreenState();
}

DateTime _selectedDate = DateTime.now();
List<DateTime> _daysInMonth(DateTime date) {
  int lastDay = DateTime(date.year, date.month + 1, 0).day;
  return List.generate(
    lastDay,
    (index) => DateTime(date.year, date.month, index + 1),
  );
}

class _CoachWorkoutsScreenState extends State<CoachWorkoutsScreen> {
  List<DateTime> days = _daysInMonth(DateTime.now()).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithCalendar(
        context: context,
        title: 'Тренировки',
        back: () => (context.router.push(CoachHomeRoute())),
        days: days,
        onTapDate: (day) {
          setState(() {
            _selectedDate = day;
          });
        },
        selectedDate: _selectedDate,
        isDrawer: true
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: BaseWorkoutCard(
              time: DateTime.now(),
              duration: '1',
              freeSpace: '8',
              workoutType: 'Тип трени',
              coachPicture:
                  'https://avatars.mds.yandex.net/i?id=dee1618aed588626b4bd61a2df1ad27bf76c0752e152419c-12635967-images-thumbs&n=13',
              coachFirstName: 'Ivan',
              coachLastName: "Иванов",
              price: "1000",
              onSignUpWorkout: () => (),
              isClientSignUpWorkout: false,
              isCoach: true,
            ),
          );
        },
      ),
    );
  }
}
