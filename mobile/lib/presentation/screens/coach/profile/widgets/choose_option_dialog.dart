part of '../coach_profile_part.dart';

AlertDialog chooseOptionDialog({
  required BuildContext context,
  required String title,
  required List options,
}) {
  return AlertDialog(
    title: Text(title),
    content: SingleChildScrollView(
      child: ListActionWidget(
        sectionName: 'Достижения',
        actionsList: options,
        isAchievement: true,
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(context.localization.close),
      ),
    ],
  );
}
