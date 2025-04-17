part of 'helpers_part.dart';

class AuthPicturesHelper extends StatelessWidget {
  const AuthPicturesHelper({super.key, required this.picture});
  final String picture;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      picture,
      colorFilter: ColorFilter.mode(AppColors.lightBlue, BlendMode.srcIn),
    );
  }
}
