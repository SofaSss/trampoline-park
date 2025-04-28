part of '../widgets_part.dart';

class NoWorkoutsWidget extends StatelessWidget {
  const NoWorkoutsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        spacing: 25,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.logo,
            width: 200,
            height: 200,
            colorFilter: ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
          ),
          Text(
            context.localization.noWorkoutsOnTheseFilters,
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: AppColors.blue),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
