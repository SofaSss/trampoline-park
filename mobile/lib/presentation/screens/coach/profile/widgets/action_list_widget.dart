part of '../coach_profile_part.dart';

class ListActionWidget extends StatefulWidget {
  const ListActionWidget({
    super.key,
    required this.sectionName,
    required this.actionsList,
    required this.isAchievement,
    this.onTapPlusIcon,
  });
  final String sectionName;
  final List actionsList;
  final bool isAchievement;
  final void Function()? onTapPlusIcon;

  @override
  State<ListActionWidget> createState() => _ListActionWidgetState();
}

class _ListActionWidgetState extends State<ListActionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 18),
                child: Text(
                  widget.sectionName,
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(color: AppColors.blue),
                ),
              ),
              GestureDetector(
                onTap: widget.onTapPlusIcon,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.blue.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.plus),
                  ),
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 8.0,
          children:
              widget.actionsList
                  .map(
                    (action) => actionWidget(
                      action: action,
                      context: context,
                      isAchievement: widget.isAchievement,
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
