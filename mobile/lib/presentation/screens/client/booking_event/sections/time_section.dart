part of '../booking_event_part.dart';

class TimeSection extends StatefulWidget {
  const TimeSection({
    super.key,
    required this.startController,
    required this.endController,
    this.startErrorText,
    this.endErrorText,
  });

  final TextEditingController startController;
  final TextEditingController endController;
  final String? startErrorText;
  final String? endErrorText;

  @override
  State<TimeSection> createState() => _TimeSectionState();
}

class _TimeSectionState extends State<TimeSection> {
  Future<void> _pickTime(TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      cancelText: context.localization.cancel,
      confirmText: context.localization.ok,
      minuteLabelText: context.localization.minutes,
      hourLabelText: context.localization.hours,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: TimePickerThemeData(
                backgroundColor: AppColors.white,
                hourMinuteTextColor: AppColors.white,
                hourMinuteColor: AppColors.lightBlue,
                dialHandColor: AppColors.blue,
                dayPeriodTextColor: AppColors.black,
                dayPeriodColor: AppColors.gray,
                hourMinuteTextStyle: Theme.of(context).textTheme.displayLarge,
                entryModeIconColor: AppColors.blue,
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (picked != null) {
      final String hour = picked.hour.toString().padLeft(2, '0');
      final String minute = picked.minute.toString().padLeft(2, '0');

      setState(() {
        controller.text = '$hour:$minute';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10, bottom: 10),
          child: Text(
            context.localization.chooseTime,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => _pickTime(widget.startController),
                  child: IgnorePointer(
                    child: TextField(
                      controller: widget.startController,
                      decoration: InputDecoration(
                        hintText: context.localization.start,
                        suffixIcon: Icon(
                          Icons.access_time,
                          color: AppColors.blue,
                        ),
                        errorText: widget.startErrorText,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () => _pickTime(widget.endController),
                  child: IgnorePointer(
                    child: TextField(
                      controller: widget.endController,
                      decoration: InputDecoration(
                        hintText: context.localization.end,
                        suffixIcon: Icon(
                          Icons.access_time,
                          color: AppColors.blue,
                        ),
                        errorText: widget.endErrorText,
                        errorStyle: TextStyle(overflow: TextOverflow.visible),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
