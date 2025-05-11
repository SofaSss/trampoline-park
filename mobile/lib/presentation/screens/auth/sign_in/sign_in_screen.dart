part of 'sign_in_part.dart';

@RoutePage()
class SignInScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInBloc(authUserUseCases: injection()),
      child: this,
    );
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status == SignInStatus.toClientMainScreen) {
          context.router.replaceAll([ClientMainRoute()]);
        } else if (state.status == SignInStatus.toCoachMainScreen) {
          context.router.replaceAll([CoachMainRoute()]);
        } else if (state.status == SignInStatus.successSendResetPassword) {
          ScaffoldMessenger.of(context).showSnackBar(
            baseSnackBar(
              context: context,
              message: context.localization.emailResetPassword,
            ),
          );
        } else if (state.status == SignInStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            baseSnackBar(
              context: context,
              message: context.localization.invalidEmailOrPassword,
            ),
          );
          context.router.push(SignInRoute());
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case SignInStatus.loaded:
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    BaseAuthHeader(
                      name: context.localization.sign_in,
                      description: context.localization.signInTitle,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 80, bottom: 10),
                      child: BaseTextField(
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        hintText: context.localization.email,
                        icon: AppIcons.email,
                        errorText:
                            state.errors[InputErrorTypeEnum.email]?.localize(
                              context.localization,
                            ) ??
                            state.apiErrors['username'],
                      ),
                    ),
                    BaseTextField(
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      hintText: context.localization.password,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                      enableVisibilityToggle: true,
                      errorText:
                          state.errors[InputErrorTypeEnum.password]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['password'],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () async {
                          context.read<SignInBloc>().add(
                            SignInEvent.signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            AppColors.blue,
                          ),
                          fixedSize: WidgetStatePropertyAll(Size(160, 10)),
                        ),
                        child: Text(context.localization.sign_in),
                      ),
                    ),
                    TextButton(
                      onPressed:
                          () => (context.read<SignInBloc>().add(
                            SignInEvent.sendResetPassword(
                              email: emailController.text.trim(),
                            ),
                          )),
                      child: Text(
                        context.localization.forgetPassword,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () => (context.router.push(SignUpRoute()),),
                      child: Text(
                        'Еще нет аккаунта? \n Зарегистрироваться',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );

          case SignInStatus.loading:
            return BaseProgressIndicator();

          default:
            return Container();
        }
      },
    );
  }
}
