part of '../widgets_part.dart';

class ProfileChangePasswordSection extends StatefulWidget {
  const ProfileChangePasswordSection({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmNewPasswordController,
    this.oldPasswordErrorText,
    this.newPasswordErrorText,
    this.confirmNewPasswordErrorText,
    required this.onPressedChangePassword,
  });

  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPasswordController;
  final String? oldPasswordErrorText;
  final String? newPasswordErrorText;
  final String? confirmNewPasswordErrorText;
  final void Function() onPressedChangePassword;

  @override
  State<ProfileChangePasswordSection> createState() =>
      _ProfileChangePasswordSectionState();
}

class _ProfileChangePasswordSectionState
    extends State<ProfileChangePasswordSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 21.0, top: 20),
            child: Text(
              context.localization.changePassword,
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(color: AppColors.blue),
            ),
          ),
        ),
        BaseTextField(
          controller: widget.oldPasswordController,
          textInputType: TextInputType.visiblePassword,
          hintText: context.localization.oldPassword,
          icon: AppIcons.eyeOff,
          isObscureText: true,
          errorText: widget.oldPasswordErrorText,
        ),
        BaseTextField(
          controller: widget.newPasswordController,
          textInputType: TextInputType.visiblePassword,
          hintText: context.localization.newPassword,
          icon: AppIcons.eyeOff,
          isObscureText: true,
          errorText: widget.newPasswordErrorText,
        ),
        BaseTextField(
          controller: widget.confirmNewPasswordController,
          textInputType: TextInputType.visiblePassword,
          hintText: context.localization.rePassword,
          icon: AppIcons.eyeOff,
          isObscureText: true,
          errorText: widget.confirmNewPasswordErrorText,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton(
            onPressed: widget.onPressedChangePassword,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.blue),
            ),
            child: Text(context.localization.changePassword),
          ),
        ),
      ],
    );
  }
}
