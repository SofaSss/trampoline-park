part of 'theme_part.dart';

class AppTextStyles {
  static TextTheme appTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'SofiaSans',
      fontWeight: FontWeight.w900,
      fontSize: 22,
      color: AppColors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: 'SofiaSans',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'SofiaSans',
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: AppColors.white,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 13,
      color: AppColors.gray,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 13,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: AppColors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: 'SofiaSans',
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: AppColors.blue,
    ),
  );
}
