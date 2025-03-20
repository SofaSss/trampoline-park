part of 'helpers_part.dart';

Color getRandomColor() {
  List<Color> colors = [AppColors.red, AppColors.blue, AppColors.green];

  Random random = Random();
  return colors[random.nextInt(colors.length)];
}
