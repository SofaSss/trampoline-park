part of 'coach_workouts_part.dart';

@RoutePage()
class CoachWorkoutsScreen extends StatefulWidget {
  const CoachWorkoutsScreen({super.key});

  @override
  State<CoachWorkoutsScreen> createState() => _CoachWorkoutsScreenState();
}

class _CoachWorkoutsScreenState extends State<CoachWorkoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Тренировки тренера',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );;
  }
}