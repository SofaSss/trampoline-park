part of 'sign_up_part.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(authUserUseCases: injection()),
      child: this,
    );
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime? selectedDate;
  bool isSwitchedPDn = false;
  bool isSwitchedPolicy = false;
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
          if (state.errors.containsKey(InputErrorTypeEnum.isConfirmPDn)) {
            ScaffoldMessenger.of(context).showSnackBar(
              baseSnackBar(
                context: context,
                message: state.errors[InputErrorTypeEnum.isConfirmPDn]!
                    .localize(context.localization),
              ),
            );
          } else if (state.errors.containsKey(InputErrorTypeEnum.isPolicy)) {
            ScaffoldMessenger.of(context).showSnackBar(
              baseSnackBar(
                context: context,
                message: state.errors[InputErrorTypeEnum.isPolicy]!.localize(
                  context.localization,
                ),
              ),
            );
          }
          if (state.status == StatusProfile.success) {
            ScaffoldMessenger.of(context)
                .showSnackBar(
                  baseSnackBar(
                    context: context,
                    message: context.localization.activateAccount,
                  ),
                )
                .closed
                .then((_) => context.router.push(SignInRoute()));
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case StatusProfile.loaded:
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
                      errorText: state.errors[InputErrorTypeEnum.textField]
                          ?.localize(context.localization),
                    ),
                    BaseTextField(
                      controller: lastNameController,
                      textInputType: TextInputType.text,
                      hintText: context.localization.lastName,
                      icon: AppIcons.user,
                      errorText: state.errors[InputErrorTypeEnum.textField]
                          ?.localize(context.localization),
                    ),
                    BaseTextField(
                      controller: birthController,
                      textInputType: TextInputType.text,
                      hintText: context.localization.dateOfBirth,
                      icon: AppIcons.calendar,
                      errorText: state.errors[InputErrorTypeEnum.textField]
                          ?.localize(context.localization),
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
                      errorText:
                          state.errors[InputErrorTypeEnum.email]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['email'],
                    ),
                    BaseTextField(
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      hintText: context.localization.phone,
                      icon: AppIcons.phone,
                      errorText:
                          state.errors[InputErrorTypeEnum.phone]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['phone_number'],
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: RegExpConstants.mask,
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy,
                        ),
                      ],
                    ),
                    BaseTextField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.password,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                      errorText: state.errors[InputErrorTypeEnum.password]
                          ?.localize(context.localization),
                    ),
                    BaseTextField(
                      controller: confirmPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.rePassword,
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return baseAlertDialog(
                                  context: context,
                                  title: context.localization.titlePDn,
                                  text: context.localization.textPDn,
                                );
                              },
                            );
                          },
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseSwitchedWidget(
                            value: isSwitchedPolicy,
                            onChange: (bool value) {
                              setState(() {
                                isSwitchedPolicy = value;
                              });
                            },
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              _launchURL(
                                url: Uri.parse(
                                  'https://trampolinepark1.ru/public/privacy_policy.pdf',
                                ),
                                context: context,
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: Text(
                                'Я согласен с политикой конфиденциальности',
                                style: TextStyle(
                                  color: AppColors.blue,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                              confirmPassword:
                                  confirmPasswordController.text.trim(),
                              birth: selectedDate,
                              isHealthy: isHealthySwitched,
                              isConfirmPDn: isSwitchedPDn,
                              isPolicy: isSwitchedPolicy,
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
            case StatusProfile.failure:
              return FailureWidget();

            case StatusProfile.loading:
              return BaseProgressIndicator();

            default:
              return Container();
          }
        },
      ),
    );
  }

  Future<void> _launchURL({
    required Uri url,
    required BuildContext context,
  }) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        baseSnackBar(context: context, message: context.localization.linkError),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    birthController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
