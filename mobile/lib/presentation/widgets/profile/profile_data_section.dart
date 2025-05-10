part of '../../screens/client/profile/client_profile_part.dart';

class ProfileDataSection extends StatefulWidget {
  const ProfileDataSection({
    super.key,
    required this.birthController,
    required this.emailController,
    required this.phoneController,
    this.isHealthySwitched,
    this.onChangeHealthySwitched,
    required this.onPressedChangeData,
    this.isClientDataSection = true,
    this.quoteController,
    this.experienceController,
  });

  final TextEditingController birthController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController? quoteController;
  final TextEditingController? experienceController;
  final bool? isHealthySwitched;
  final void Function(bool)? onChangeHealthySwitched;
  final void Function() onPressedChangeData;
  final bool isClientDataSection;

  @override
  State<ProfileDataSection> createState() => _ProfileDataSectionState();
}

class _ProfileDataSectionState extends State<ProfileDataSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseTextField(
          controller: widget.birthController,
          textInputType: TextInputType.text,
          hintText: context.localization.dateOfBirth,
          readOnly: true,
          icon: AppIcons.calendar,
        ),
        BaseTextField(
          readOnly: true,
          controller: widget.emailController,
          textInputType: TextInputType.emailAddress,
          hintText: context.localization.email,
          icon: AppIcons.email,
        ),
        BaseTextField(
          controller: widget.phoneController,
          textInputType: TextInputType.phone,
          hintText: context.localization.phone,
          icon: AppIcons.phone,
          inputFormatters: [
            MaskTextInputFormatter(
              mask: RegExpConstants.phoneMask,
              filter: {"#": RegExp(r'[0-9]')},
              type: MaskAutoCompletionType.lazy,
            ),
          ],
        ),
        if (widget.isClientDataSection) ...[
          ProfileSwitched(
            value: widget.isHealthySwitched!,
            onChange: widget.onChangeHealthySwitched,
          ),
        ],
        if (!widget.isClientDataSection) ...[
          BaseTextField(
            controller: widget.quoteController,
            textInputType: TextInputType.text,
            hintText: context.localization.quote,
            icon: AppIcons.quote,
          ),
          BaseTextField(
            controller: widget.experienceController,
            textInputType: TextInputType.number,
            hintText: context.localization.experience,
            icon: AppIcons.experience,
          ),
        ],
        ElevatedButton(
          onPressed: widget.onPressedChangeData,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.blue),
          ),
          child: Text(context.localization.update),
        ),
      ],
    );
  }
}
