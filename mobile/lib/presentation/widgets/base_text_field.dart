part of 'widgets_part.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    super.key,
    this.controller,
    required this.textInputType,
    this.isLargeText = false,
    this.isObscureText = false,
    this.onSubmitted,
    this.errorText,
    required this.hintText,
    required this.icon,
    this.enabled = true,
    this.onTap,
    this.inputFormatters,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool isLargeText;
  final bool isObscureText;
  final ValueChanged<String>? onSubmitted;
  final String? errorText;
  final String hintText;
  final String icon;
  final bool enabled;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 21),
      child: TextField(
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        controller: widget.controller,
        onTap: widget.onTap,
        cursorColor: AppColors.blue,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.textInputType,
        maxLines: widget.isLargeText ? 3 : 1,
        obscureText: widget.isObscureText,
        onSubmitted: widget.onSubmitted,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'SofiaSans',
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorMaxLines: 3,

          suffixIcon: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              widget.icon,
              fit: BoxFit.fitHeight,
              width: 14,
              height: 14,
              colorFilter:
                  widget.errorText != null
                      ? ColorFilter.mode(AppColors.red, BlendMode.srcIn)
                      : ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
