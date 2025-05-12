part of 'client_profile_part.dart';

class ClientDeleteAccountSection extends StatefulWidget {
  const ClientDeleteAccountSection({
    super.key,
    required this.passwordController,
    this.passwordErrorText,
    required this.onSureDeleteAccount,
  });

  final TextEditingController passwordController;
  final String? passwordErrorText;
  final void Function() onSureDeleteAccount;

  @override
  State<ClientDeleteAccountSection> createState() =>
      _ClientDeleteAccountSectionState();
}

class _ClientDeleteAccountSectionState
    extends State<ClientDeleteAccountSection> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return confirmAlertDialog(
              context: context,
              onSure: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return confirmAlertDialog(
                      context: context,
                      widgetContent: BaseTextField(
                        controller: widget.passwordController,
                        textInputType: TextInputType.visiblePassword,
                        hintText: context.localization.password,
                        icon: AppIcons.eyeOff,
                        isObscureText: true,
                        enableVisibilityToggle: true,
                        errorText: widget.passwordErrorText,
                      ),
                      sureText: context.localization.delete,
                      onSure: widget.onSureDeleteAccount,
                    );
                  },
                );
              },
              content: context.localization.sureDeleteAccount,
              sureText: context.localization.delete,
            );
          },
        );
      },
      child: Text(
        context.localization.deleteAccount,
        style: TextStyle(color: AppColors.red),
      ),
    );
  }
}
