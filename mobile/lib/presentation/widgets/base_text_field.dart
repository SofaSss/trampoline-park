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
    this.enableVisibilityToggle = false,
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
  final bool enableVisibilityToggle;
  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late bool _obscureText;
  late String _icon;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText;
    _icon = widget.icon;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
      _icon = _obscureText ? AppIcons.eyeOff : AppIcons.eyeOn;
    });
  }

  ColorFilter _getIconColorFilter() {
    if (widget.errorText != null) {
      return const ColorFilter.mode(AppColors.red, BlendMode.srcIn);
    } else if (widget.readOnly) {
      return const ColorFilter.mode(AppColors.gray, BlendMode.srcIn);
    } else {
      return const ColorFilter.mode(AppColors.blue, BlendMode.srcIn);
    }
  }

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
        obscureText: _obscureText,
        onSubmitted: widget.onSubmitted,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'SofiaSans',
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorMaxLines: 3,
          suffixIcon:
              widget.enableVisibilityToggle
                  ? GestureDetector(
                    onTap: _toggleVisibility,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        _icon,
                        fit: BoxFit.fitHeight,
                        width: 14,
                        height: 14,
                        colorFilter: _getIconColorFilter(),
                      ),
                    ),
                  )
                  : Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                      widget.icon,
                      fit: BoxFit.fitHeight,
                      width: 14,
                      height: 14,
                      colorFilter: _getIconColorFilter(),
                    ),
                  ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: widget.readOnly ? AppColors.gray : AppColors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
