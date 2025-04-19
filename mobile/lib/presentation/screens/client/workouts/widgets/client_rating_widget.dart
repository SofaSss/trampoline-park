part of '../client_workouts_part.dart';

class ClientRatingWidget extends StatefulWidget {
  const ClientRatingWidget({
    super.key,
    required this.isFirstRating,
    required this.isSecondRating,
    required this.isThirdRating,
    required this.stayedWorkout,
  });
  final bool isFirstRating;
  final bool isSecondRating;
  final bool isThirdRating;
  final int stayedWorkout;

  @override
  State<ClientRatingWidget> createState() => _ClientRatingWidgetState();
}

class _ClientRatingWidgetState extends State<ClientRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.lightBlue.withValues(alpha: 0.01),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, bottom: 10),
            child: Text(
              'Приходи на тренировки и зарабатывай крутые статусы!',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(color: AppColors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 5,
              children: [
                if (widget.isFirstRating) ...[
                  Text(
                    'Прыг-скокер',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(color: AppColors.yellow),
                  ),
                ],
                if (widget.isSecondRating) ...[
                  Text(
                    'Батутный Босс',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(color: AppColors.green),
                  ),
                ],
                if (widget.isThirdRating) ...[
                  Text(
                    'Король Прыжков',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(color: AppColors.red),
                  ),
                ],
              ],
            ),
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.blue),
              color: AppColors.lightGray,
            ),
            child: Stack(
              children: [
                if (widget.isThirdRating) ...[
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SvgPicture.asset(AppIcons.logo),
                        ),
                      ],
                    ),
                  ),
                  
                ],
                if (widget.isSecondRating) ...[
                  Container(
                    height: 35,
                    width: (MediaQuery.of(context).size.width - 30) * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.green,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SvgPicture.asset(AppIcons.logo),
                        ),
                      ],
                    ),
                  ),
                ],
                if (widget.isFirstRating) ...[
                  Container(
                    height: 35,
                    width: (MediaQuery.of(context).size.width - 30) * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.yellow,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: SvgPicture.asset(AppIcons.logo),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              textAlign: TextAlign.center,
              widget.isFirstRating
                  ? '🔥 Осталось ${widget.stayedWorkout} тренировок до статуса Батутный Босс'
                  : widget.isSecondRating
                  ? '🔥 Осталось ${widget.stayedWorkout} тренировок до статуса Король прыжков'
                  : '👑 Ты уже Король прыжков — продолжай править батутом!',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
