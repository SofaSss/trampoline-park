part of 'client_profile_part.dart';

@RoutePage()
class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({super.key});

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
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
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppIcons.logo),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Имя',
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(color: AppColors.lightBlue),
                      ),
                      Text(
                        'Фамилия',
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(color: AppColors.lightBlue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BaseTextField(
              controller: nameController,
              textInputType: TextInputType.text,
              hintText: context.localization.name,
              icon: AppIcons.user,
            ),
            BaseTextField(
              controller: lastNameController,
              textInputType: TextInputType.text,
              hintText: context.localization.lastName,
              icon: AppIcons.user,
            ),
            BaseTextField(
              controller: birthController,
              textInputType: TextInputType.text,
              hintText: context.localization.dateOfBirth,
              icon: AppIcons.calendar,
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
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () => (),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.blue),
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
  }
}
