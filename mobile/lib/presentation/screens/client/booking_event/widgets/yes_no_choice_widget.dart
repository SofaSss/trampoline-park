part of '../booking_event_part.dart';

class YesNoChoiceWidget extends StatefulWidget {
  const YesNoChoiceWidget({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  final String title;
  final bool? initialValue;
  final void Function(bool) onChanged;

  @override
  State<YesNoChoiceWidget> createState() => _YesNoChoiceWidgetState();
}

class _YesNoChoiceWidgetState extends State<YesNoChoiceWidget> {
  late bool? selected;

  @override
  void initState() {
    selected = widget.initialValue;
    super.initState();
  }

  void _updateSelection(bool value) {
    setState(() => selected = value);
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10, bottom: 10),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            choiceButton(
              label: 'Нужен',
              isSelected: selected == true,
              onTap: () => _updateSelection(true),
              color: AppColors.green,
            ),
            SizedBox(width: 10),
            choiceButton(
              label: 'Не нужен',
              isSelected: selected == false,
              onTap: () => _updateSelection(false),
              color: AppColors.red,
            ),
          ],
        ),
      ],
    );
  }
}
