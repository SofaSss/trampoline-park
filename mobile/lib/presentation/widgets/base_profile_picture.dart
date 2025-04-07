part of 'widgets_part.dart';

class BaseProfilePicture extends StatefulWidget {
  const BaseProfilePicture({super.key, this.imageUrl, this.pickImage});
  final String? imageUrl;
  final File? pickImage;

  @override
  State<BaseProfilePicture> createState() => _BaseProfilePictureState();
}

class _BaseProfilePictureState extends State<BaseProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: 140,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 20,
            child:
                widget.pickImage != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(180),
                      child: Image.file(
                        widget.pickImage!,
                        fit: BoxFit.cover,
                        height: 95,
                        width: 95,
                      ),
                    )
                    : widget.imageUrl != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(180),
                      child: Image.network(
                        widget.imageUrl!,
                        fit: BoxFit.cover,
                        height: 95,
                        width: 95,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return BaseAnimatedBuilder(height: 95, width: 95);
                          }
                        },
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 95,
                        width: 95,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(AppIcons.logo),
                        ),
                      ),
                    ),
          ),
          Positioned(
            left: 15,
            bottom: 0,
            child: SvgPicture.asset(
              OnBoardingPictures.profilePicture,
              height: 105,
              width: 105,
            ),
          ),
        ],
      ),
    );
  }
}
