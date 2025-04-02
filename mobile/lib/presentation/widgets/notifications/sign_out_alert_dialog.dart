part of '../widgets_part.dart';

AlertDialog signOutAlertDialog({
  required BuildContext context,
  required void Function()? onSignOut,
}) {
  return AlertDialog(
    title: Text(context.localization.confirmation),
    content: Text(
      context.localization.sureToSignOut,
      style: Theme.of(context).textTheme.displayMedium,
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(context.localization.cancel),
      ),
      TextButton(
        onPressed: onSignOut,
        child: Text(context.localization.signOut),
      ),
    ],
  );
}
