part of 'helpers_part.dart';

class CurvedPentagonBorder extends ShapeBorder {
  final BorderRadius borderRadius;
  final double topCurveHeight;

  const CurvedPentagonBorder({
    this.borderRadius = BorderRadius.zero,
    this.topCurveHeight = 30,
  });

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();

    double midX = rect.left + (rect.width / 2);

    path.moveTo(rect.left, rect.top);
    path.lineTo(midX, rect.top - topCurveHeight);
    path.lineTo(rect.right, rect.top);

    path.lineTo(rect.right, rect.bottom - borderRadius.bottomRight.y);

    path.quadraticBezierTo(
      rect.right,
      rect.bottom,
      rect.right - borderRadius.bottomRight.x,
      rect.bottom,
    );

    path.lineTo(rect.left + borderRadius.bottomLeft.x, rect.bottom);

    path.quadraticBezierTo(
      rect.left,
      rect.bottom,
      rect.left,
      rect.bottom - borderRadius.bottomLeft.y,
    );

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
  ShapeBorder scale(double t) => CurvedPentagonBorder(
    borderRadius: borderRadius * t,
    topCurveHeight: topCurveHeight * t,
  );

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }
}
