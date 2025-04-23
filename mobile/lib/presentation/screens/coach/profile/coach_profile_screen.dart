part of 'coach_profile_part.dart';

@RoutePage()
class CoachProfileScreen extends StatefulWidget {
  const CoachProfileScreen({super.key});

  @override
  State<CoachProfileScreen> createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {
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
    return Scaffold(
      appBar: baseAppBar(
        context: context,
        title: 'Профиль',
        back: () => (context.router.push(CoachHomeRoute())),
        onSignOut: () => (),
        actions: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              onTapProfilePicture: _pickImage,
              pickImage: _image,
              imageUrl: ' ',
              firstName: 'Иван',
              lastName: 'Иванов',
            ),
            ClientDataSection(
              birthController: birthController,
              emailController: emailController,
              phoneController: phoneController,
              isClientDataSection: false,
              onPressedChangeData: () => (),
            ),
            ListActionWidget(
              sectionName: 'Образование',
              actionsList: ['sjjsjjs', 'assjjsjsjs', 'jsjsjsjsjs'],
              isAchievement: false,
              onTapPlusIcon: () => (),
            ),
            ListActionWidget(
              sectionName: 'Достижения',
              actionsList: ['sjjsjjs', 'assjjsjsjs', 'jsjsjsjsjs'],
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
