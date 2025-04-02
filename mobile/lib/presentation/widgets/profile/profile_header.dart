part of '../widgets_part.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    super.key,
    this.onTapProfilePicture,
    this.imageUrl,
    this.pickImage,
    this.firstName,
    this.lastName,
  });

  final void Function()? onTapProfilePicture;
  final String? imageUrl;
  final File? pickImage;
  final String? firstName;
  final String? lastName;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onTapProfilePicture,
            child: BaseProfilePicture(
              imageUrl: widget.imageUrl,
              pickImage: widget.pickImage,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.firstName ?? context.localization.hi,
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(color: AppColors.lightBlue),
              ),
              Text(
                widget.lastName ?? context.localization.batuter,
                style: Theme.of(
                  context,
                ).textTheme.displayLarge?.copyWith(color: AppColors.lightBlue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
