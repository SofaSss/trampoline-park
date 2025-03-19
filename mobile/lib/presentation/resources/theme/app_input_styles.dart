part of 'theme_part.dart';

class AppInputStyles {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color:  AppColors.blue),
      borderRadius: BorderRadius.circular(15),
    ),
      enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.blue), 
      borderRadius: BorderRadius.circular(15),
    ),

    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.blue), 
      borderRadius: BorderRadius.circular(10),
    ),

    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.red), 
      borderRadius: BorderRadius.circular(10),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: AppColors.red), 
      borderRadius: BorderRadius.circular(10),
    ),

    hintStyle: TextStyle(
      color: AppColors.blue,
      fontFamily: 'SofiaSans',
      fontWeight: FontWeight.w400,
      fontSize: 18,
      ),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
  );

}