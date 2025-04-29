part of '../widgets_part.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
    this.profilePicture,
    this.coachName,
    this.isCoach = false,
  });
  final String? profilePicture;
  final String? coachName;
  final bool isCoach;

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0, right: 5),
      child: Row(
        spacing: 10,
        children: [
          BaseProfilePicture(imageUrl: widget.profilePicture),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isCoach
                      ? 'Здравствуйте, \n${widget.coachName}!'
                      : context.localization.hiHome,
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(color: AppColors.blue),
                ),
                Text(
                  widget.isCoach
                      ? 'Вдохновляйте, обучайте, ведите к победам!'
                      : context.localization.homeDescription,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
