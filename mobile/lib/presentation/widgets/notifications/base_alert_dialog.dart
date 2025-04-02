part of '../widgets_part.dart';

AlertDialog baseAlertDialog({
  required BuildContext context,
  required String title,
  required String text,
}) {
  return AlertDialog(
    title: Text(title),
    content: SingleChildScrollView(
      child: Text(text, style: Theme.of(context).textTheme.headlineSmall),
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
