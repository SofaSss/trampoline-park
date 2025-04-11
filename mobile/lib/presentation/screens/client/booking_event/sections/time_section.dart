part of '../booking_event_part.dart';

class TimeSection extends StatefulWidget {
  const TimeSection({super.key, this.startController, this.endController});
  final TextEditingController? startController;
  final TextEditingController? endController;

  @override
  State<TimeSection> createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10, bottom: 10),
          child: Text(
            'Выбери время',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: TextField(
                  controller: widget.startController,
                  decoration: InputDecoration(hintText: 'Начало'),
                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: RegExpConstants.startTimeMask,
                      filter: {"#": RegExp(r'[0-9]')},
                      type: MaskAutoCompletionType.lazy,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextField(
                  controller: widget.endController,
                  decoration: InputDecoration(hintText: 'Конец'),
                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: RegExpConstants.endTimeMask,
                      filter: {"#": RegExp(r'[0-9]')},
                      type: MaskAutoCompletionType.lazy,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
