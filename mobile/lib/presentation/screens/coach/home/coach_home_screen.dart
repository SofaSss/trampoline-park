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
    return Center(
      child: Text(
        'Главная страница тренера',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
