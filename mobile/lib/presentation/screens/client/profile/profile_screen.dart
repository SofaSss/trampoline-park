part of 'profile_part.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({super.key});

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Профиль клиента',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}