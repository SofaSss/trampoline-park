part of '../widgets_part.dart';

SvgPicture navigationBarIcon({required String icon, bool isSelected = false}) {
  return SvgPicture.asset(
    icon,
    colorFilter: ColorFilter.mode(
      isSelected ? AppColors.yellow : AppColors.white,
      BlendMode.srcATop,
    ),
    width: isSelected ? 30 : 20,
    height: isSelected ? 30 : 20,
  );
}
