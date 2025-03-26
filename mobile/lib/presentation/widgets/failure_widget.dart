part of 'widgets_part.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          SvgPicture.asset(
            AppIcons.logo,
            width: 100,
            height: 100,
            color: AppColors.gray,
          ),
          Text(
            'Что-то пошло не так...',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
