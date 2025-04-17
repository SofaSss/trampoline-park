part of 'theme_part.dart';

class AppButtonStyles {
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith<TextStyle>((
            Set<WidgetState> states,
          ) {
            return TextStyle(
              fontFamily: 'SofiaSans',
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color:
                  states.contains(WidgetState.disabled)
                      ? AppColors.gray
                      : AppColors.white,
            );
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color>((
            Set<WidgetState> states,
          ) {
            return states.contains(WidgetState.disabled)
                ? AppColors.lightGray.withValues(alpha: 0.6)
                : AppColors.blue;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((
            Set<WidgetState> states,
          ) {
            return states.contains(WidgetState.disabled)
                ? AppColors.gray
                : AppColors.white;
          }),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(58)),
            ),
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
