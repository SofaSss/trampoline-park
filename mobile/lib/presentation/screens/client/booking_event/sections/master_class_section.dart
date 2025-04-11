part of '../booking_event_part.dart';

class MasterClassSection extends StatefulWidget {
  const MasterClassSection({
    super.key,
    this.animators,
    this.selectedIndex,
    required this.onSelected,
  });
  final List? animators;
  final int? selectedIndex;
  final ValueChanged<int?> onSelected;

  @override
  State<MasterClassSection> createState() => _MasterClassSectionState();
}

class _MasterClassSectionState extends State<MasterClassSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            'Мастер-классы:',
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
                          'https://avatars.mds.yandex.net/i?id=16d516b90cee9a8476db0c7735908c1fcc7563bf-5906571-images-thumbs&n=13',
                      description: 'Роспись футболок',
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
