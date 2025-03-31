part of 'client_home_part.dart';

@RoutePage()
class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'Главная страница клиента',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}