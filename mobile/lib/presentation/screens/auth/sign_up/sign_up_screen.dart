part of 'sign_up_part.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(userUseCases: injection()),
      child: this,
    );
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime? selectedDate;
  bool isSwitchedPDn = false;
  bool isHealthySwitched = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            context.router.push(SignInRoute());
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case Status.loaded:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    BaseAuthHeader(
                      name: context.localization.sign_up,
                      description: context.localization.signUpDescription,
                    ),
                    SizedBox(height: 20),
                    BaseTextField(
                      controller: nameController,
                      textInputType: TextInputType.text,
                      hintText: context.localization.name,
                      icon: AppIcons.user,
                    ),
                    BaseTextField(
                      controller: lastNameController,
                      textInputType: TextInputType.text,
                      hintText: context.localization.lastname,
                      icon: AppIcons.user,
                    ),
                    BaseTextField(
                      controller: birthController,
                      textInputType: TextInputType.none,
                      hintText: context.localization.dateOfBirth,
                      icon: AppIcons.calendar,
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        final newDate = await DateTimeHelper.selectDate(
                          context,
                          selectedDate: selectedDate,
                        );
                        if (newDate != null) {
                          setState(() {
                            selectedDate = newDate;
                            birthController.text = DateFormat.yMd().format(
                              selectedDate!,
                            );
                          });
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 21),
                          child: BaseSwitchedWidget(
                            value: isHealthySwitched,
                            onChange: (bool value) {
                              setState(() {
                                isHealthySwitched = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          context.localization.isHealthy,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    BaseTextField(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: context.localization.email,
                      icon: AppIcons.email,
                    ),
                    BaseTextField(
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      hintText: context.localization.phone,
                      icon: AppIcons.phone,
                    ),
                    BaseTextField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.password,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                    ),
                    BaseTextField(
                      controller: confirmPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.repassword,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseSwitchedWidget(
                          value: isSwitchedPDn,
                          onChange: (bool value) {
                            setState(() {
                              isSwitchedPDn = value;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () => (),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Я согласен с политикой \nобработки персональных данных',
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 5),
                      child: ElevatedButton(
                        onPressed: () async {
                          context.read<SignUpBloc>().add(
                            SignUpEvent.signUp(
                              name: nameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              email: emailController.text.trim(),
                              phone: phoneController.text.trim(),
                              password: passwordController.text.trim(),
                              birth: selectedDate!,
                              isHealthy: isHealthySwitched,
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            AppColors.blue,
                          ),
                        ),
                        child: Text(context.localization.signUp),
                      ),
                    ),
                    TextButton(
                      onPressed: () => (context.router.push(SignInRoute()),),
                      child: Text(
                        'Уже есть аккаунт? \n Войти',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );

            default:
              return const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                ),
              );
          }
        },
      ),
    );
  }
}
