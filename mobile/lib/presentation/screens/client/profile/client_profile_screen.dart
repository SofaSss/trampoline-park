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
          (_) => ClientProfileBloc(
            clientUseCases: injection(),
            tokenUseCases: injection(),
            authUserUseCases: injection(),
          )..add(ClientProfileEvent.getCurrentClient()),
      child: this,
    );
  }
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  bool isHealthySwitched = true;
  final TextEditingController birthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController deleteAccountPasswordController =
      TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientProfileBloc, ClientProfileState>(
      listener: (context, state) {
        if (state.status == StatusProfile.loaded) {
          birthController.text = DateFormat(
            'dd-MM-yyyy',
          ).format(state.birthday!);
          emailController.text = state.email ?? AppConstants.empty;
          phoneController.text = state.phone ?? AppConstants.empty;
          isHealthySwitched = state.isHealthy!;
        } else if (state.status == StatusProfile.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            baseSnackBar(
              context: context,
              message: context.localization.updateProfileIsSuccess,
            ),
          );
          oldPasswordController.clear();
          newPasswordController.clear();
          confirmNewPasswordController.clear();
        } else if (state.status == StatusProfile.successDeleteAccount ||
            state.status == StatusProfile.successSignOut) {
          context.router.replaceAll([OnBoardingRoute()]);
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case StatusProfile.loaded:
            return Scaffold(
              appBar: baseAppBar(
                context: context,
                title: context.localization.profile,
                actions: true,
                back: () => (context.router.push(ClientHomeRoute()),),
                onSignOut: () {
                  context.read<ClientProfileBloc>().add(
                    ClientProfileEvent.signOut(),
                  );
                },
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileHeader(
                      onTapProfilePicture: _pickImage,
                      pickImage: _image,
                      imageUrl: state.profilePicture,
                      firstName: state.name,
                      lastName: state.lastName,
                    ),
                    BaseTextField(
                      controller: birthController,
                      textInputType: TextInputType.text,
                      hintText: context.localization.dateOfBirth,
                      readOnly: true,
                      icon: AppIcons.calendar,
                    ),
                    BaseTextField(
                      readOnly: true,
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
                    ProfileSwitched(
                      value: isHealthySwitched,
                      onChange:
                          (value) => setState(() => isHealthySwitched = value),
                    ),
                    ElevatedButton(
                      onPressed:
                          () => (context.read<ClientProfileBloc>().add(
                            ClientProfileEvent.updateClient(
                              profilePicture: _image,
                              phoneNumber: phoneController.text.trim(),
                              isHealthy: isHealthySwitched,
                            ),
                          )),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.blue,
                        ),
                      ),
                      child: Text(context.localization.update),
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
                      controller: oldPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.oldPassword,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                      errorText:
                          state.errors[InputErrorTypeEnum.textField]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['current_password'],
                    ),
                    BaseTextField(
                      controller: newPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.newPassword,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                      errorText:
                          state.errors[InputErrorTypeEnum.password]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['new_password'],
                    ),
                    BaseTextField(
                      controller: confirmNewPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      hintText: context.localization.rePassword,
                      icon: AppIcons.eyeOff,
                      isObscureText: true,
                      errorText:
                          state.errors[InputErrorTypeEnum.password]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['re_new_password'],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed:
                            () => (context.read<ClientProfileBloc>().add(
                              ClientProfileEvent.setPassword(
                                oldPassword: oldPasswordController.text.trim(),
                                newPassword: newPasswordController.text.trim(),
                                reNewPassword:
                                    confirmNewPasswordController.text.trim(),
                              ),
                            )),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            AppColors.blue,
                          ),
                        ),
                        child: Text(context.localization.changePassword),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final clientProfileBloc =
                            context.read<ClientProfileBloc>();
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
                                        controller:
                                            deleteAccountPasswordController,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        hintText: context.localization.password,
                                        icon: AppIcons.eyeOff,
                                        isObscureText: true,
                                        errorText:
                                            state
                                                .errors[InputErrorTypeEnum
                                                    .textField]
                                                ?.localize(
                                                  context.localization,
                                                ) ??
                                            state.apiErrors['current_password'],
                                      ),
                                      sureText: context.localization.delete,
                                      onSure: () {
                                        clientProfileBloc.add(
                                          ClientProfileEvent.deleteAccount(
                                            password:
                                                deleteAccountPasswordController
                                                    .text
                                                    .trim(),
                                          ),
                                        );
                                      },
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
                    ),
                  ],
                ),
              ),
            );
          case StatusProfile.loading:
            return BaseProgressIndicator();
          case StatusProfile.failure:
            return FailureWidget();
          default:
            return Container();
        }
      },
    );
  }
}
