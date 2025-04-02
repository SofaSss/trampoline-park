part of 'widgets_part.dart';

AppBar baseAppBar({
  required BuildContext context,
  required String title,
  required void Function()? back,
  void Function()? onSignOut,
  bool actions = false,
}) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: GestureDetector(
        onTap: back,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(AppIcons.back, color: AppColors.lightYellow),
        ),
      ),
    ),
    leadingWidth: 50,
    title: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.displayLarge?.copyWith(color: AppColors.white),
    ),
    centerTitle: true,
    backgroundColor: AppColors.blue,
    actions:
        actions
            ? [
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return confirmAlertDialog(
                        context: context,
                        onSure: onSignOut,
                        content: context.localization.sureToSignOut,
                        sureText: context.localization.signOut,
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context.localization.signOut,
                      style: TextStyle(color: AppColors.red),
                    ),
                  ),
                ),
              ),
            ]
            : null,
    toolbarHeight: 70,
  );
}
