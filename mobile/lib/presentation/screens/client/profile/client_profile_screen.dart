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
                    ProfileDataSection(
                      birthController: birthController,
                      emailController: emailController,
                      phoneController: phoneController,
                      isHealthySwitched: isHealthySwitched,
                      onChangeHealthySwitched:
                          (value) => setState(() => isHealthySwitched = value),
                      onPressedChangeData:
                          () => (context.read<ClientProfileBloc>().add(
                            ClientProfileEvent.updateClient(
                              profilePicture: _image,
                              phoneNumber: phoneController.text.trim(),
                              isHealthy: isHealthySwitched,
                            ),
                          )),
                    ),
                    ProfileChangePasswordSection(
                      oldPasswordController: oldPasswordController,
                      newPasswordController: newPasswordController,
                      confirmNewPasswordController:
                          confirmNewPasswordController,
                      oldPasswordErrorText:
                          state.errors[InputErrorTypeEnum.textField]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['current_password'],
                      newPasswordErrorText:
                          state.errors[InputErrorTypeEnum.password]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['new_password'],
                      confirmNewPasswordErrorText:
                          state.errors[InputErrorTypeEnum.password]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['re_new_password'],
                      onPressedChangePassword:
                          () => (context.read<ClientProfileBloc>().add(
                            ClientProfileEvent.setPassword(
                              oldPassword: oldPasswordController.text.trim(),
                              newPassword: newPasswordController.text.trim(),
                              reNewPassword:
                                  confirmNewPasswordController.text.trim(),
                            ),
                          )),
                    ),
                    ClientDeleteAccountSection(
                      passwordController: deleteAccountPasswordController,
                      passwordErrorText:
                          state.errors[InputErrorTypeEnum.textField]?.localize(
                            context.localization,
                          ) ??
                          state.apiErrors['current_password'],
                      onSureDeleteAccount: () {
                        context.read<ClientProfileBloc>().add(
                          ClientProfileEvent.deleteAccount(
                            password:
                                deleteAccountPasswordController.text.trim(),
                          ),
                        );
                      },
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

  @override
  void dispose() {
    birthController.dispose();
    emailController.dispose();
    phoneController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    deleteAccountPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }
}
