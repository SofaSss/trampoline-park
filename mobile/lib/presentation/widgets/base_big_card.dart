part of 'widgets_part.dart';

class BaseBigCard extends StatefulWidget {
  const BaseBigCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.shortDescription,
  });

  final String imageUrl;
  final String name;
  final String shortDescription;

  @override
  State<BaseBigCard> createState() => _BaseBigCardState();
}

class _BaseBigCardState extends State<BaseBigCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.bigCardHeight,
      width: AppConstants.bigCardWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            child: SizedBox(
              width: AppConstants.bigCardWidth - 130,
              height: AppConstants.bigCardHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(widget.imageUrl, fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            left: AppConstants.bigCardWidth / 3,
            child: Container(
              width: AppConstants.bigCardWidth - 80,
              height: AppConstants.bigCardHeight,
              decoration: ShapeDecoration(
                color: getRandomColor(),
                shape: SlantedRoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
                        widget.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      widget.shortDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
