part of '../widgets_part.dart';

class LoadMoreDataIndicator extends StatelessWidget {
  const LoadMoreDataIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const CircularProgressIndicator(
        strokeWidth: 3,
        color: AppColors.blue,
      ),
    );
  }
}
