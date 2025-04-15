part of '../booking_event_part.dart';

class TextSelectedOptions extends StatefulWidget {
  const TextSelectedOptions({
    super.key,
    required this.optionName,
    required this.optionSelectText,
  });
  final String optionName;
  final String optionSelectText;

  @override
  State<TextSelectedOptions> createState() => _TextSelectedOptionsState();
}

class _TextSelectedOptionsState extends State<TextSelectedOptions> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Text(
        '${widget.optionName} ${widget.optionSelectText}',
        style: Theme.of(context).textTheme.bodyLarge,
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
