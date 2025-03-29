part of 'client_workouts_part.dart';

class ClientWorkoutsScreen extends StatefulWidget {
  const ClientWorkoutsScreen({super.key});

  @override
  State<ClientWorkoutsScreen> createState() => _ClientWorkoutsScreenState();
}

class _ClientWorkoutsScreenState extends State<ClientWorkoutsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Расписание тренировок клиента',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
