part of 'helpers_part.dart';

class SlantedRoundedRectangleBorder extends ShapeBorder {
  final BorderRadius borderRadius;
  final double slantWidth;

  const SlantedRoundedRectangleBorder({
    this.borderRadius = BorderRadius.zero,
    this.slantWidth = 45,
  });

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();

    path.moveTo(rect.left + slantWidth, rect.top);

    path.lineTo(rect.right - borderRadius.topRight.x, rect.top);
    path.quadraticBezierTo(
      rect.right,
      rect.top,
      rect.right,
      rect.top + borderRadius.topRight.y,
    );

    path.lineTo(rect.right, rect.bottom - borderRadius.bottomRight.y);

    path.quadraticBezierTo(
      rect.right,
      rect.bottom,
      rect.right - borderRadius.bottomRight.x,
      rect.bottom,
    );

    path.lineTo(rect.left + slantWidth, rect.bottom);

    path.lineTo(rect.left, rect.top);

    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint =
        Paint()
          ..color = Colors.transparent
          ..style = PaintingStyle.stroke;
    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder scale(double t) => SlantedRoundedRectangleBorder(
    borderRadius: borderRadius * t,
    slantWidth: slantWidth * t,
  );

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }
}
