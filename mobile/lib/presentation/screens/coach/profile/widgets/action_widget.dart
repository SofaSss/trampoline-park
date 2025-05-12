part of '../coach_profile_part.dart';

Widget actionWidget({
  required String action,
  required BuildContext context,
  bool isAchievement = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.blue, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Text(
              isAchievement ? '🏅' : '💪',
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
            child: Text(
              action,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.blue),
              softWrap: true,
            ),
          ),
        ],
      ),
    ),
  );
}
