part of 'widgets_part.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
      child: SvgPicture.asset(
        width: 50,
        height: 50,
        AppIcons.back,
        color: AppColors.lightYellow,
      ),
    );
  }
}
