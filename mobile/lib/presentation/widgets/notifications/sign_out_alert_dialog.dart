part of '../widgets_part.dart';

AlertDialog confirmAlertDialog({
  required BuildContext context,
  required void Function()? onSure,
  String? content,
  required String sureText,
  Widget? widgetContent,
}) {
  return AlertDialog(
    title: Text(context.localization.confirmation),
    content:
        widgetContent ??
        Text(content!, style: Theme.of(context).textTheme.displayMedium),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(context.localization.cancel),
      ),
      TextButton(onPressed: onSure, child: Text(sureText)),
    ],
  );
}
