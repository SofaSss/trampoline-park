part of '../coach_home_part.dart';

class ProgressInNumbersWidget extends StatefulWidget {
  const ProgressInNumbersWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
  });
  final String icon;
  final String title;
  final String number;

  @override
  State<ProgressInNumbersWidget> createState() =>
      _ProgressInNumbersWidgetState();
}

class _ProgressInNumbersWidgetState extends State<ProgressInNumbersWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text(widget.icon, style: TextStyle(fontSize: 40)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              widget.number,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ],
    );
  }
}
