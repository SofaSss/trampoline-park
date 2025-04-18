part of '../client_workouts_part.dart';

class ClientRatingWidget extends StatefulWidget {
  const ClientRatingWidget({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
                'Прыг-скокер',
                style: Theme.of(
                  context,
                ).textTheme.displayMedium?.copyWith(color: AppColors.yellow),
              ),
              Text(
                'Батутный Босс',
                style: Theme.of(
                  context,
                ).textTheme.displayMedium?.copyWith(color: AppColors.green),
              ),
              Text(
                'Король Прыжков',
                style: Theme.of(
                  context,
                ).textTheme.displayMedium?.copyWith(color: AppColors.red),
              ),
            ],
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.blue),
            ),
            child: Stack(
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.red,
                  ),
                ),
                Container(
                  height: 35,
                  width: (MediaQuery.of(context).size.width - 30) * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.green,
                  ),
                ),
                Container(
                  height: 35,
                  width: (MediaQuery.of(context).size.width - 30) * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.yellow,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width - 30,
            child: Stack(
              children: [
                Positioned(
                  left: (MediaQuery.of(context).size.width - 30) * 0.2,
                  child: SvgPicture.asset(
                    AppIcons.logo,
                    colorFilter: ColorFilter.mode(
                      AppColors.yellow,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 30) * 0.5,
                  child: SvgPicture.asset(
                    AppIcons.logo,
                    colorFilter: ColorFilter.mode(
                      AppColors.green,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: SvgPicture.asset(
                    AppIcons.logo,
                    colorFilter: ColorFilter.mode(
                      AppColors.red,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '🔥 Осталось 5 тренировок до статуса Король прыжков',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
