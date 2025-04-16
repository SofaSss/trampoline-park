part of 'sign_up_workout_part.dart';

@RoutePage()
class SignUpWorkoutScreen extends StatefulWidget {
  const SignUpWorkoutScreen({super.key, this.coachId, this.workoutTypeId});
  final int? coachId;
  final int? workoutTypeId;

  @override
  State<SignUpWorkoutScreen> createState() => _SignUpWorkoutScreenState();
}

DateTime _selectedDate = DateTime.now();
List<DateTime> _daysInMonth(DateTime date) {
  int lastDay = DateTime(date.year, date.month + 1, 0).day;
  return List.generate(
    lastDay,
    (index) => DateTime(date.year, date.month, index + 1),
  );
}

class _SignUpWorkoutScreenState extends State<SignUpWorkoutScreen> {
  DateTime today = DateTime.now();
  List<DateTime> days =
      _daysInMonth(
        DateTime.now(),
      ).where((day) => !day.isBefore(DateTime.now())).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithCalendar(
        context: context,
        title: 'Расписание',
        back: () => (context.router.push(ClientHomeRoute())),
        days: days,
        onTapDate: (day) {
          setState(() {
            _selectedDate = day;
          });
        },
        selectedDate: _selectedDate,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              child: BaseWorkoutCard(
                time: '10:00',
                duration: '1',
                freeSpace: '1',
                workoutType: 'Персональная тренировка',
                coachPicture:
                    'https://avatars.mds.yandex.net/i?id=f50af55a565357c56455f2fddb178d9b43935b26-5232815-images-thumbs&n=13',
                coachFirstName: 'Иван',
                coachLastName: 'Иванов',
                price: '2000',
              ),
            );
          },
        ),
      ),
    );
  }
}
