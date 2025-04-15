part of 'booking_event_part.dart';

@RoutePage()
class SuccessBookingEventScreen extends StatefulWidget {
  const SuccessBookingEventScreen({super.key});

  @override
  State<SuccessBookingEventScreen> createState() =>
      _SuccessBookingEventScreenState();
}

class _SuccessBookingEventScreenState extends State<SuccessBookingEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(
        context: context,
        title: context.localization.successBooking,
        back: () => (context.router.push(ClientHomeRoute())),
      ),
      body: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            OnBoardingPictures.eventLogo,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Text(
            context.localization.eventSuccessBooking,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: AppColors.blue),
          ),
          Text(
            context.localization.managerEventMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
