part of 'widgets_part.dart';

class BaseSwitchedWidget extends StatefulWidget {
  const BaseSwitchedWidget({super.key, required this.value, this.onChange});
  final bool value;
  final void Function(bool)? onChange;

  @override
  State<BaseSwitchedWidget> createState() => _BaseSwitchedWidgetState();
}

class _BaseSwitchedWidgetState extends State<BaseSwitchedWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.value,
      onChanged: widget.onChange,
      activeColor: AppColors.blue,
      inactiveTrackColor: AppColors.lightRed,
      inactiveThumbColor: AppColors.red,
      trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
    );
  }
}
