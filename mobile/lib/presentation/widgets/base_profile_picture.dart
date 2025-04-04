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
    return Padding(
      padding: const EdgeInsets.only(left: 21.0),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          shape: BoxShape.circle,
        ),
        child:
            widget.pickImage != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(180),
                  child: Image.file(widget.pickImage!, fit: BoxFit.cover),
                )
                : widget.imageUrl != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(180),
                  child: Image.network(widget.imageUrl!, fit: BoxFit.cover),
                )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(AppIcons.logo),
                ),
      ),
    );
  }
}
