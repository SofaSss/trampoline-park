part of 'widgets_part.dart';

class BaseAuthHeader extends StatefulWidget {
  const BaseAuthHeader({
    super.key,
    required this.name,
    required this.description,
  });
  final String name;
  final String description;

  @override
  State<BaseAuthHeader> createState() => _BaseAuthHeaderState();
}

class _BaseAuthHeaderState extends State<BaseAuthHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3 / 10,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height * 3 / 10,
              width: MediaQuery.of(context).size.width,
              color: AppColors.blue,
            ),
          ),

          Positioned(
            left: 40,
            top: 40,
            child: AuthPicturesHelper(picture: OnBoardingPictures.heart),
          ),
          Positioned(
            right: 20,
            top: 30,
            child: AuthPicturesHelper(picture: OnBoardingPictures.leaf),
          ),
          Positioned(
            left: 50,
            bottom: 20,
            child: AuthPicturesHelper(picture: OnBoardingPictures.star),
          ),
          Positioned(
            right: 100,
            bottom: 10,
            child: AuthPicturesHelper(picture: OnBoardingPictures.fish),
          ),
          Positioned(
            left: 10,
            top: 40,
            child: GestureDetector(
              onTap: () => (context.router.pop()),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AppIcons.back,
                  colorFilter: ColorFilter.mode(
                    AppColors.lightYellow,
                    BlendMode.srcIn,
                  ),
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 40,
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(AppIcons.logo),
            ),
          ),
          Positioned(
            top: 115,
            left: 10,
            child: Text(
              widget.name,
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(color: AppColors.white),
            ),
          ),
          Positioned(
            top: 155,
            left: 10,
            child: SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width - 70,
              child: Text(
                widget.description,
                style: Theme.of(
                  context,
                ).textTheme.displayMedium?.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
