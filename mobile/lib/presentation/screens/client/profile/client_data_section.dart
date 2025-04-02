part of 'client_profile_part.dart';

class ClientDataSection extends StatefulWidget {
  const ClientDataSection({
    super.key,
    required this.birthController,
    required this.emailController,
    required this.phoneController,
    required this.isHealthySwitched,
    required this.onChangeHealthySwitched,
    required this.onPressedChangeData,
  });

  final TextEditingController birthController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final bool isHealthySwitched;
  final void Function(bool) onChangeHealthySwitched;
  final void Function() onPressedChangeData;

  @override
  State<ClientDataSection> createState() => _ClientDataSectionState();
}

class _ClientDataSectionState extends State<ClientDataSection> {
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
              mask: RegExpConstants.mask,
              filter: {"#": RegExp(r'[0-9]')},
              type: MaskAutoCompletionType.lazy,
            ),
          ],
        ),
        ProfileSwitched(
          value: widget.isHealthySwitched,
          onChange: widget.onChangeHealthySwitched,
        ),
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
