part of 'coach_profile_part.dart';

@RoutePage()
class CoachProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const CoachProfileScreen({super.key});

  @override
  State<CoachProfileScreen> createState() => _CoachProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create:
          (_) => (CoachProfileBloc(
            coachUseCases: injection(),
            authUserUseCases: injection(),
            tokenUseCases: injection(),
          )..add(CoachProfileEvent.loadData())),

      child: this,
    );
  }
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {
  final TextEditingController birthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController quoteController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
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
    return BlocConsumer<CoachProfileBloc, CoachProfileState>(
      listener: (context, state) {
        if (state.status == StatusProfile.loaded) {
          birthController.text = state.birthday;
          emailController.text = state.email;
          phoneController.text = state.phone;
          quoteController.text = state.quote;
          experienceController.text = state.experience;
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
        } else if (state.status == StatusProfile.successSignOut) {
          context.router.replaceAll([OnBoardingRoute()]);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: baseAppBar(
            context: context,
            title: 'Профиль',
            back: () => (context.router.push(CoachHomeRoute())),
            onSignOut: () {
              context.read<CoachProfileBloc>().add(CoachProfileEvent.signOut());
            },
            actions: true,
          ),
          body: switch (state.status) {
            StatusProfile.loaded => SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeader(
                    onTapProfilePicture: _pickImage,
                    pickImage: _image,
                    imageUrl: state.profilePicture,
                    firstName: state.firstName,
                    lastName: state.lastName,
                  ),
                  ProfileDataSection(
                    birthController: birthController,
                    emailController: emailController,
                    phoneController: phoneController,
                    quoteController: quoteController,
                    experienceController: experienceController,
                    isClientDataSection: false,
                    onPressedChangeData:
                        () => (
                          context.read<CoachProfileBloc>()..add(
                            CoachProfileEvent.updateCoachData(
                              profilePicture: _image,
                              phone: phoneController.text.trim(),
                              quote: quoteController.text.trim(),
                              experience: int.tryParse(
                                experienceController.text.trim(),
                              ),
                            ),
                          ),
                        ),
                  ),
                  ListActionWidget(
                    sectionName: context.localization.specialization,
                    actionsList: state.specialties,
                    isAchievement: false,
                  ),
                  ListActionWidget(
                    sectionName: context.localization.achievements,
                    actionsList: state.achievements,
                    isAchievement: true,
                  ),

                  ProfileChangePasswordSection(
                    oldPasswordController: oldPasswordController,
                    newPasswordController: newPasswordController,
                    confirmNewPasswordController: confirmNewPasswordController,
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
                        () => (context.read<CoachProfileBloc>().add(
                          CoachProfileEvent.setPassword(
                            oldPassword: oldPasswordController.text.trim(),
                            newPassword: newPasswordController.text.trim(),
                            reNewPassword:
                                confirmNewPasswordController.text.trim(),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            StatusProfile.loading => BaseProgressIndicator(),
            StatusProfile.failure => FailureWidget(),
            _ => FailureWidget(),
          },
        );
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
    experienceController.dispose();
    quoteController.dispose();
    super.dispose();
  }
}
