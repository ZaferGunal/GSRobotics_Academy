import 'dart:math';
import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double width;
  final Color color;
  final double percentage;
  final double textSize;
  final Color textColor;

  ProgressPainter({required this.textSize,
    required this.width,
    required this.color,
    required this.percentage,
    required this.textColor
  });

  Paint getPaint(Color color) {
    return Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = getPaint(Colors.grey.withOpacity(0.3));
    Paint progressPaint = getPaint(color);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - width / 2;

    // Dış çemberi çiz
    canvas.drawCircle(center, radius, backgroundPaint);

    double arcAngle = 2 * pi * (percentage / 100);

    // Progres çemberini çiz
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      progressPaint,
    );

    // Yüzde metnini ekle
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: percentage.toInt() >= 100 && percentage.toInt() <= 105 ? "100%": '${percentage.toInt()}%',
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    Offset textCenter = Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height / 2);
    textPainter.paint(canvas, textCenter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
