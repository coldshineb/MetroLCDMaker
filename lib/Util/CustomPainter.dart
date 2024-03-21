import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StationIconPainter extends CustomPainter {
  final Color? lineColor; //线路主颜色
  final Color? lineVariantColor; //线路主颜色变体

  StationIconPainter({required this.lineColor, required this.lineVariantColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = lineColor!
      ..style = PaintingStyle.fill;

    final Paint lineVariantsPaint = Paint()
      ..color = lineVariantColor!
      ..style = PaintingStyle.fill;

    // 外圈圆
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 17, linePaint);

    // 中圈圆
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 12, lineVariantsPaint);

    // 内圈圆
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 8.5, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ShadowIconPainter extends CustomPainter {
  final Color? lineColor; //线路主颜色
  final Color? lineVariantColor; //线路主颜色变体

  ShadowIconPainter(
      {required this.lineColor, required this.lineVariantColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = lineColor!
      ..style = PaintingStyle.fill;

    final Paint lineVariantsPaint = Paint()
      ..color = lineVariantColor!
      ..style = PaintingStyle.fill;

    //边缘阴影
    linePaint.maskFilter = const MaskFilter.blur(BlurStyle.solid, 4);
    // 外圈圆
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 17, linePaint);
    // 中圈圆
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 12, lineVariantsPaint);
    // 内圈圆
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 8.5, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
