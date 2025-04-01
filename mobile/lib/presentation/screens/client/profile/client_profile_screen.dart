part of 'client_profile_part.dart';

@RoutePage()
class ClientProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const ClientProfileScreen({super.key});

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              ClientProfileBloc(clientUseCases: injection())
                ..add(ClientProfileEvent.getCurrentClient()),
      child: this,
    );
  }
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  bool isHealthySwitched = true;
  final TextEditingController birthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientProfileBloc, ClientProfileState>(
      listener: (context, state) {
        if (state.status == Status.loaded) {
          birthController.text = DateFormat(
            'dd-MM-yyyy',
          ).format(state.birthday!);
          emailController.text = state.email ?? AppConstants.empty;
          phoneController.text = state.phone ?? AppConstants.empty;
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case Status.loaded:
            return Scaffold(
              appBar: baseAppBar(
                context: context,
                title: context.localization.profile,
                actions: true,
                back: () => (context.router.push(ClientHomeRoute()),),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BaseProfilePicture(imageUrl: state.profilePicture),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.name ?? context.localization.hi,
                                style: Theme.of(context).textTheme.displayLarge
                                    ?.copyWith(color: AppColors.lightBlue),
                              ),
                              Text(
                                state.lastName ?? context.localization.batuter,
                                style: Theme.of(context).textTheme.displayLarge
                                    ?.copyWith(color: AppColors.lightBlue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    BaseTextField(
                      controller: birthController,
                      textInputType: TextInputType.text,
                      hintText: context.localization.dateOfBirth,
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      icon: AppIcons.calendar,
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
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: RegExpConstants.mask,
                          filter: {"#": RegExp(r'[0-9]')},
                          type: MaskAutoCompletionType.lazy,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 21),
                          child: BaseSwitchedWidget(
                            value: state.isHealthy ?? isHealthySwitched,
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 21.0, top: 20),
                        child: Text(
                          context.localization.changePassword,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    BaseTextField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.oldPassword,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                    ),
                    BaseTextField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.newPassword,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: () => (),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            AppColors.blue,
                          ),
                        ),
                        child: Text(context.localization.update),
                      ),
                    ),

                    TextButton(
                      onPressed: () => (),
                      child: Text(
                        context.localization.deleteAccount,
                        style: TextStyle(color: AppColors.red),
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
