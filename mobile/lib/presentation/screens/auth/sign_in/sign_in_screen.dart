part of 'sign_in_part.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BaseAuthHeader(
              name: context.localization.sign_in,
              description: context.localization.signInTitle,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 10),
              child: BaseTextField(
                textInputType: TextInputType.emailAddress,
                hintText: context.localization.email,
                icon: AppIcons.email,
              ),
            ),
            BaseTextField(
              textInputType: TextInputType.text,
              hintText: context.localization.password,
              icon: AppIcons.eyeOff,
              isObscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: ElevatedButton(
                onPressed: () => (),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(AppColors.blue),
                  fixedSize: WidgetStatePropertyAll(Size(160, 10)),
                ),
                child: Text(context.localization.sign_in),
              ),
            ),
            TextButton(
              onPressed: () => (context.router.push(SignUpRoute()),),
              child: Text(
                'Еще нет аккаунта? \n Зарегистрироваться',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
