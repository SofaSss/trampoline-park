part of '../sign_up_workout_part.dart';

Widget filterDrawer({
  required BuildContext context,
  required int? selectedCoachId,
  required void Function(int?) onCoachSelected,
  required int? selectedWorkoutTypeId,
  required void Function(int?) onWorkoutTypeSelected,
  required List<WorkoutTypeModel> workoutTypeList,
  required List<CoachModel> coachList,
}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: AppColors.blue),
          child: Center(
            child: Text(
              context.localization.chooseFilter,
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(color: AppColors.white),
            ),
          ),
        ),
        ListTile(
          title: Text(
            context.localization.coach,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: AppColors.black),
          ),
          enabled: false,
        ),
        Column(
          children:
              coachList.map((coach) {
                return ListTile(
                  title: Text('${coach.firstName} ${coach.lastName}'),
                  trailing:
                      selectedCoachId == coach.id
                          ? Icon(Icons.check_circle, color: AppColors.green)
                          : Icon(Icons.radio_button_unchecked),
                  onTap: () {
                    if (selectedCoachId == coach.id) {
                      onCoachSelected(null);
                    } else {
                      onCoachSelected(coach.id);
                    }
                  },
                );
              }).toList(),
        ),
        ListTile(
          title: Text(
            context.localization.workoutType,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: AppColors.black),
          ),
          enabled: false,
        ),
        Column(
          children:
              workoutTypeList.map((workoutType) {
                return ListTile(
                  title: Text(workoutType.name),
                  trailing:
                      selectedWorkoutTypeId == workoutType.id
                          ? Icon(Icons.check_circle, color: AppColors.green)
                          : Icon(Icons.radio_button_unchecked),
                  onTap: () {
                    if (selectedWorkoutTypeId == workoutType.id) {
                      onWorkoutTypeSelected(null);
                    } else {
                      onWorkoutTypeSelected(workoutType.id);
                    }
                  },
                );
              }).toList(),
        ),
      ],
    ),
  );
}
