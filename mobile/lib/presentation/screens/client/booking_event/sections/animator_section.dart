part of '../booking_event_part.dart';

class AnimatorSection extends StatefulWidget {
  const AnimatorSection({
    super.key,
    this.animators,
    this.selectedIndex,
    required this.onSelected,
  });
  final List? animators;
  final int? selectedIndex;
  final ValueChanged<int?> onSelected;

  @override
  State<AnimatorSection> createState() => _AnimatorSectionState();
}

class _AnimatorSectionState extends State<AnimatorSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10, bottom: 10),
          child: Text(
            'Выбери аниматора:',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
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
                            ? Colors.red.withOpacity(0.3)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: BaseMediumCard(
                      imageUrl:
                          'https://avatars.mds.yandex.net/i?id=bbefdcb8bd6f73cd35f54e4b95cc69401067d1e5-12346171-images-thumbs&n=13',
                      description: 'Головоломка',
                      name: AppConstants.empty,
                      lastName: AppConstants.empty,
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
