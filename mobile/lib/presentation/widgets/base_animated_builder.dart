part of 'widgets_part.dart';

class BaseAnimatedBuilder extends StatefulWidget {
  const BaseAnimatedBuilder({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  State<BaseAnimatedBuilder> createState() => _BaseAnimatedBuilderState();
}

class _BaseAnimatedBuilderState extends State<BaseAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment(-2, -2),
              end: Alignment(2, 2),
              colors: [
                AppColors.lightBlue,
                AppColors.blue.withAlpha((0.6 * 255).toInt()),
                AppColors.lightBlue,
              ],
              stops: [
                (_animationController.value - 0.3).clamp(0.0, 1.0),
                _animationController.value.clamp(0.0, 1.0),
                (_animationController.value + 0.3).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
