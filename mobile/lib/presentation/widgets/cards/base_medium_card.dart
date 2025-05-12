part of '../widgets_part.dart';

class BaseMediumCard extends StatefulWidget {
  const BaseMediumCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastName,
    this.description,
    this.isCoach = false,
    this.isClientHealthy = true,
  });

  final String? description;
  final String? imageUrl;
  final String name;
  final String lastName;
  final bool isCoach;
  final bool isClientHealthy;

  @override
  State<BaseMediumCard> createState() => _BaseMediumCardState();
}

class _BaseMediumCardState extends State<BaseMediumCard> {
  Color? backgroundColor;
  @override
  void initState() {
    super.initState();
    backgroundColor = getRandomColor();
  }

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
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child:
                    widget.imageUrl != null
                        ? Image.network(
                          widget.imageUrl!,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return BaseAnimatedBuilder(
                                height: AppConstants.mediumCardHeight - 20,
                                width: AppConstants.mediumCardWidth,
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Stack(
                              children: [
                                BaseAnimatedBuilder(
                                  height: AppConstants.mediumCardHeight - 20,
                                  width: AppConstants.mediumCardWidth,
                                ),
                                Positioned(
                                  top: 20,
                                  left: 40,
                                  child: SvgPicture.asset(
                                    AppIcons.logo,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.lightGray,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                        : Stack(
                          children: [
                            BaseAnimatedBuilder(
                              height: AppConstants.mediumCardHeight - 20,
                              width: AppConstants.mediumCardWidth,
                            ),
                            SizedBox(
                              height:
                                  (AppConstants.mediumCardHeight - 20) * 0.7,
                              width: AppConstants.mediumCardWidth,
                              child: Center(
                                child: SvgPicture.asset(AppIcons.logo),
                              ),
                            ),
                          ],
                        ),
              ),
            ),
          ),
          widget.isCoach
              ? Positioned(
                right: 5,
                top: 5,
                child: SvgPicture.asset(
                  AppIcons.isHealthy,
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    widget.isClientHealthy ? AppColors.green : AppColors.red,
                    BlendMode.srcIn,
                  ),
                ),
              )
              : SizedBox(),
          Positioned(
            bottom: 0,
            child: Container(
              height: AppConstants.mediumCardHeight / 3,
              width: AppConstants.mediumCardWidth,
              decoration: ShapeDecoration(
                color: backgroundColor,
                shape: CurvedPentagonBorder(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  topCurveHeight: 25,
                ),
              ),
              child:
                  widget.description != null
                      ? Center(
                        child: Text(
                          widget.description!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      )
                      : Column(
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
