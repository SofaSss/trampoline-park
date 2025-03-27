part of 'sign_in_part.dart';

@RoutePage()
class SignInScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => SignInBloc(userUseCases: injection()),
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
        if (state.status == Status.success) {
          context.router.replaceAll([MainRoute()]);
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case Status.loaded:
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
                        errorText: state.errors[InputErrorTypeEnum.email]
                            ?.localize(context.localization),
                      ),
                    ),
                    BaseTextField(
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      hintText: context.localization.password,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                      errorText: state.errors[InputErrorTypeEnum.password]
                          ?.localize(context.localization),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
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

          case Status.loading:
            return BaseProgressIndicator();

          case Status.failure:
            return FailureWidget();

          default:
            return Container();
        }
      },
    );
  }
}
