part of 'widgets_part.dart';

class BaseImageNetworkWidget extends StatefulWidget {
  const BaseImageNetworkWidget({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });
  final String url;
  final double width;
  final double height;

  @override
  State<BaseImageNetworkWidget> createState() => _BaseImageNetworkWidgetState();
}

class _BaseImageNetworkWidgetState extends State<BaseImageNetworkWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          widget.url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return BaseAnimatedBuilder(
                height: widget.height,
                width: widget.width,
              );
            }
          },
          errorBuilder:
              (context, error, stackTrace) => Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.lightBlue,
                ),
                child: SvgPicture.asset(
                  AppIcons.logo,
                  width: 70,
                  height: 70,
                  colorFilter: ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
                ),
              ),
        ),
      ),
    );
  }
}
