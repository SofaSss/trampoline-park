part of '../booking_event_part.dart';

class ShowSection extends StatefulWidget {
  const ShowSection({
    super.key,
    this.animators,
    this.selectedIndex,
    required this.onSelected,
  });
  final List? animators;
  final int? selectedIndex;
  final ValueChanged<int?> onSelected;

  @override
  State<ShowSection> createState() => _ShowSectionState();
}

class _ShowSectionState extends State<ShowSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
          child: Text(
            'Шоу-программы:',
            style: Theme.of(context).textTheme.displayMedium,
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
                          'https://avatars.mds.yandex.net/i?id=31fabd125b3022df474c9355654ab8b1720e21ec-4390935-images-thumbs&n=13',
                      description: 'Угадай, что в ящике',
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
