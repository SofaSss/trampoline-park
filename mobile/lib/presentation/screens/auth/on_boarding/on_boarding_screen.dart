part of 'on_boarding_part.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    color: AppColors.yellow,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 40,
                  child: SvgPicture.asset(OnBoardingPictures.heart),
                ),
                Positioned(
                  right: 30,
                  top: 40,
                  child: SvgPicture.asset(OnBoardingPictures.leaf),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(OnBoardingPictures.logo),
                  ),
                ),
                Positioned(
                  left: 30,
                  bottom: 40,
                  child: SvgPicture.asset(OnBoardingPictures.fish),
                ),
                Positioned(
                  right: 30,
                  bottom: 40,
                  child: SvgPicture.asset(OnBoardingPictures.star),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Text(
              context.localization.on_boarding_hello,
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              context.localization.on_boarding_text,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 10),
            child: ElevatedButton(
              onPressed: () => (context.router.push(const SignInRoute()),),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.blue),
                fixedSize: WidgetStateProperty.all(Size(170, 40)),
              ),
              child: Text(context.localization.sign_in),
            ),
          ),
          OutlinedButton(
            onPressed: () => (context.router.push(const SignUpRoute()),),
            child: Text(context.localization.sign_up),
          ),
        ],
      ),
    );
  }
}
