part of '../booking_event_part.dart';

class OptionalServiceSection extends StatefulWidget {
  const OptionalServiceSection({
    super.key,
    required this.optionalServiceList,
    this.selectedIndex,
    required this.onSelected,
    required this.optionalServiceType,
  });
  final String optionalServiceType;
  final List<OptionalServiceModel> optionalServiceList;
  final int? selectedIndex;
  final ValueChanged<int?> onSelected;

  @override
  State<OptionalServiceSection> createState() => _OptionalServiceSectionState();
}

class _OptionalServiceSectionState extends State<OptionalServiceSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
          child: Text(
            widget.optionalServiceType,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        SizedBox(
          height: AppConstants.chooseMediumCardHeight,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            itemCount: widget.optionalServiceList.length,
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
                      children: [BaseMediumCard(
                        imageUrl:
                            widget
                                .optionalServiceList[index]
                                .optionalServicePicture,
                        description: widget.optionalServiceList[index].name,
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
                                '${widget.optionalServiceList[index].price.toString()} ${context.localization.rub}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                      ]
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
