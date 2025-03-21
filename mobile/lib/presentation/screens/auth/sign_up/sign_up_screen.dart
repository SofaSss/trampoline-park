part of 'sign_up_part.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BaseAuthHeader(
              name: context.localization.sign_up,
              description: context.localization.signUpDescription,
            ),
            SizedBox(height: 20),
            BaseTextField(
              textInputType: TextInputType.text,
              hintText: context.localization.name,
              icon: AppIcons.user,
            ),
            BaseTextField(
              textInputType: TextInputType.text,
              hintText: context.localization.lastname,
              icon: AppIcons.user,
            ),
            BaseTextField(
              textInputType: TextInputType.emailAddress,
              hintText: context.localization.email,
              icon: AppIcons.email,
            ),
            BaseTextField(
              textInputType: TextInputType.phone,
              hintText: context.localization.phone,
              icon: AppIcons.phone,
            ),
            BaseTextField(
              textInputType: TextInputType.visiblePassword,
              hintText: context.localization.password,
              icon: AppIcons.eyeOff,
              isObscureText: true,
            ),
            BaseTextField(
              textInputType: TextInputType.visiblePassword,
              hintText: context.localization.repassword,
              icon: AppIcons.eyeOff,
              isObscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: ElevatedButton(
                onPressed: () => (),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.blue),
                ),
                child: Text(context.localization.signUp),
              ),
            ),
            TextButton(
              onPressed: () => (context.router.push(SignInRoute()),),
              child: Text(
                context.localization.signIn,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: AppColors.blue,
                  inactiveTrackColor: AppColors.red,
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
                    style: TextStyle(color: AppColors.blue, fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
