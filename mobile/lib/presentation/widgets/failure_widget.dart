part of 'widgets_part.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            SvgPicture.asset(
              AppIcons.logo,
              width: 100,
              height: 100,
              colorFilter: ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
            ),
            Text(
              context.localization.failure,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
