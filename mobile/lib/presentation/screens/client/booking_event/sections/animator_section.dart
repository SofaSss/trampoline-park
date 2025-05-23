part of '../booking_event_part.dart';

class AnimatorSection extends StatefulWidget {
  const AnimatorSection({
    super.key,
    required this.animators,
    this.selectedIndex,
    required this.onSelected,
    this.errorText,
  });
  final List<CoachCostumeModel> animators;
  final int? selectedIndex;
  final ValueChanged<int?> onSelected;
  final String? errorText;

  @override
  State<AnimatorSection> createState() => _AnimatorSectionState();
}

class _AnimatorSectionState extends State<AnimatorSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10, bottom: 10),
          child: Text(
            context.localization.chooseAnimator,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        widget.errorText != null
            ? Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                widget.errorText!,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.red),
              ),
            )
            : SizedBox(),
        SizedBox(
          height: AppConstants.chooseMediumCardHeight,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.onSelected(
                    widget.selectedIndex == index ? null : index,
                  );
                },

                child: Container(
                  width: AppConstants.chooseMediumCardWidth,
                  height: AppConstants.chooseMediumCardHeight,
                  decoration: BoxDecoration(
                    color:
                        widget.selectedIndex == index
                            ? AppColors.black
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        BaseMediumCard(
                          imageUrl: widget.animators[index].picture,
                          description: widget.animators[index].name,
                          name: AppConstants.empty,
                          lastName: AppConstants.empty,
                        ),
                        Positioned(
                          top: 2,
                          right: 5,
                          child: Container(
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.lightBlue.withValues(alpha: 0.6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '${widget.animators[index].price.toString()} ${context.localization.rubH}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 15, height: AppConstants.mediumCardHeight);
            },
          ),
        ),
      ],
    );
  }
}
