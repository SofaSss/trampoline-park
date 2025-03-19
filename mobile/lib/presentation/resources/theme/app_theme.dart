part of 'theme_part.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      onPrimary: AppColors.blue,
      secondary: AppColors.yellow,
      onSecondary: AppColors.black,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'SofiaSans',
    textTheme: AppTextStyles.appTextTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blue,
      selectedItemColor: AppColors.yellow,
      unselectedItemColor: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.blue,
      elevation: 4,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(color: AppColors.white, fontSize: 22),
    ),
    inputDecorationTheme: AppInputStyles.inputDecorationTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppButtonStyles.elevatedButtonTheme.style,
    ),
    textButtonTheme: TextButtonThemeData(
      style: AppButtonStyles.textButtonTheme.style,
    ),
  );
}
