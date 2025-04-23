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
          (_) =>
              (CoachProfileBloc(coachUseCases: injection())
                ..add(CoachProfileEvent.loadData())),
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
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: baseAppBar(
            context: context,
            title: 'Профиль',
            back: () => (context.router.push(CoachHomeRoute())),
            onSignOut: () => (),
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
                    onPressedChangeData: () => (),
                  ),
                  ListActionWidget(
                    sectionName: context.localization.specialization,
                    actionsList: state.specialties,
                    isAchievement: false,
                    onTapPlusIcon: () => (),
                  ),
                  ListActionWidget(
                    sectionName: context.localization.achievements,
                    actionsList: state.achievements,
                    isAchievement: true,
                    onTapPlusIcon: () => (),
                  ),

                  ProfileChangePasswordSection(
                    oldPasswordController: oldPasswordController,
                    newPasswordController: newPasswordController,
                    confirmNewPasswordController: confirmNewPasswordController,
                    onPressedChangePassword: () => (),
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
