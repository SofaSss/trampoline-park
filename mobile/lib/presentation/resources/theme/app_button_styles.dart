part of 'theme_part.dart';

class AppButtonStyles {
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            const TextStyle(
              fontFamily: 'SofiaSans',
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(AppColors.blue),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          ),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(58)),
          ),
        ),
      );

  static final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        const TextStyle(
          fontFamily: 'SofiaSans',
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
    ),
  );

  static final OutlinedButtonThemeData outlinedButtonTheme =
      OutlinedButtonThemeData(
        style: ButtonStyle(
          side: WidgetStateProperty.all(
            const BorderSide(color: AppColors.blue),
          ),
          textStyle: WidgetStatePropertyAll(
            const TextStyle(
              fontFamily: 'SofiaSans',
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: AppColors.blue,
            ),
          ),
          fixedSize: WidgetStateProperty.all(Size(170, 40)),
        ),
      );
}
