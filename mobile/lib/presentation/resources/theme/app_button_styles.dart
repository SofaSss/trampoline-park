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
}
