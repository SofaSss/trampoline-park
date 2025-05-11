part of 'reset_password_part.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget implements AutoRouteWrapper {
  const ResetPasswordScreen({
    super.key,
    required this.uid,
    required this.token,
  });

  final String uid;
  final String token;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordBloc(authUserUseCases: injection()),
      child: this,
    );
  }
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
                baseSnackBar(
                  context: context,
                  message: context.localization.successResetPassword,
                ),
              )
              .closed
              .then((_) {
                context.router.replaceAll([SignInRoute()]);
              });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: switch (state.status) {
            Status.loaded => SingleChildScrollView(
              child: Column(
                children: [
                  BaseAuthHeader(
                    name: context.localization.resetPasswordTitle,
                    description: context.localization.resetPasswordDescription,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 10),
                    child: BaseTextField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.newPassword,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                      enableVisibilityToggle: true,
                      errorText: state.errors[InputErrorTypeEnum.password]
                          ?.localize(context.localization),
                    ),
                  ),
                  BaseTextField(
                    controller: confirmPasswordController,
                    textInputType: TextInputType.visiblePassword,
                    hintText: context.localization.rePassword,
                    icon: AppIcons.eyeOff,
                    isObscureText: true,
                    enableVisibilityToggle: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        context.read<ResetPasswordBloc>().add(
                          ResetPasswordEvent.resetPassword(
                            uid: widget.uid,
                            token: widget.token,
                            password: passwordController.text.trim(),
                            rePassword: confirmPasswordController.text.trim(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.blue,
                        ),
                      ),
                      child: Text(context.localization.resetPassword),
                    ),
                  ),
                ],
              ),
            ),
            Status.loading => BaseProgressIndicator(),
            Status.failure => FailureWidget(),
            _ => BaseProgressIndicator(),
          },
        );
      },
    );
  }
}
