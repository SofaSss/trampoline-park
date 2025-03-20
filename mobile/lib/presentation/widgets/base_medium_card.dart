part of 'widgets_part.dart';

class BaseMediunCard extends StatefulWidget {
  const BaseMediunCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastName,
  });

  final String imageUrl;
  final String name;
  final String lastName;

  @override
  State<BaseMediunCard> createState() => _BaseMediunCardState();
}

class _BaseMediunCardState extends State<BaseMediunCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.mediumCardWidth,
      height: AppConstants.mediumCardHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: AppConstants.mediumCardWidth,
              height: AppConstants.mediumCardHeight - 20,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: AppConstants.mediumCardHeight / 3,
              width: AppConstants.mediumCardWidth,
              decoration: ShapeDecoration(
                color: getRandomColor(),
                shape: CurvedPentagonBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  topCurveHeight: 25,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    widget.lastName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
