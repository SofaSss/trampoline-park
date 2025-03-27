part of 'widgets_part.dart';

class BaseProgressIndicator extends StatelessWidget {
  const BaseProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            CircularProgressIndicator(strokeWidth: 3),
            Text(
              context.localization.progressText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
