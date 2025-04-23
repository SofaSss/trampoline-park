part of '../coach_profile_part.dart';

Widget actionWidget({
  required String action,
  required BuildContext context,
  bool isAchievement = false,
}) {
  return ActionChip(
    label: Text(
      action,
      style: Theme.of(
        context,
      ).textTheme.displayMedium?.copyWith(color: AppColors.blue),
    ),
    avatar: Center(
      child: Text(isAchievement ? '🏅' : '💪', style: TextStyle(fontSize: 15)),
    ),
    disabledColor: AppColors.white,
    onPressed: () => (),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: const BorderSide(color: AppColors.blue, width: 2),
    ),
  );
}
