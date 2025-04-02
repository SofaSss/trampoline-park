part of '../widgets_part.dart';

class ProfileSwitched extends StatefulWidget {
  const ProfileSwitched({super.key, required this.value, this.onChange});

  final bool value;
  final void Function(bool)? onChange;

  @override
  State<ProfileSwitched> createState() => _ProfileSwitchedState();
}

class _ProfileSwitchedState extends State<ProfileSwitched> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 21),
          child: BaseSwitchedWidget(
            value: widget.value,
            onChange: widget.onChange,
          ),
        ),
        Text(
          context.localization.isHealthy,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
