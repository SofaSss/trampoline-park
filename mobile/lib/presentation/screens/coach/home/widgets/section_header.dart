part of '../coach_home_part.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 18),
      child: Text(title, style: Theme.of(context).textTheme.displayLarge),
    );
  }
}
