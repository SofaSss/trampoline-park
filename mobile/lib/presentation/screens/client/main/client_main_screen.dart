part of 'client_main_part.dart';

@RoutePage()
class ClientMainScreen extends StatefulWidget {
  const ClientMainScreen({super.key});

  @override
  State<ClientMainScreen> createState() => _ClientMainScreenState();
}

class _ClientMainScreenState extends State<ClientMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.blue,
      child: Center(
        child: Text(
          'Тут будут виджеты для клиента',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
