part of 'coach_profile_part.dart';

@RoutePage()
class CoachProfileScreen extends StatefulWidget {
  const CoachProfileScreen({super.key});

  @override
  State<CoachProfileScreen> createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Профиль тренера',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );;
  }
}