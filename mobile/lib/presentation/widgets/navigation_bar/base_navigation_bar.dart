part of '../widgets_part.dart';

NavigationBar baseNavigationBar({
  required void Function(int)? onDestinationSelected,
  required int selectedIndex,
}) {
  return NavigationBar(
    onDestinationSelected: onDestinationSelected,
    labelTextStyle: WidgetStatePropertyAll(TextStyle(fontSize: 0)),
    height: 50,
    backgroundColor: AppColors.blue,
    indicatorColor: Colors.transparent,
    selectedIndex: selectedIndex,

    destinations: <Widget>[
      NavigationDestination(
        selectedIcon: navigationBarIcon(icon: AppIcons.home, isSelected: true),
        icon: navigationBarIcon(icon: AppIcons.home),
        label: AppConstants.empty,
      ),
      NavigationDestination(
        selectedIcon: navigationBarIcon(
          icon: AppIcons.workout,
          isSelected: true,
        ),
        icon: navigationBarIcon(icon: AppIcons.workout),
        label: AppConstants.empty,
      ),
      NavigationDestination(
        selectedIcon: navigationBarIcon(icon: AppIcons.user, isSelected: true),
        icon: navigationBarIcon(icon: AppIcons.user),
        label: AppConstants.empty,
      ),
    ],
  );
}
