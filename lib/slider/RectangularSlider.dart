import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RectangularSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final double value;

  const RectangularSliderThumbShape({
    required this.thumbRadius,
    required this.value,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: center,
        width: thumbRadius * 4,
        height: thumbRadius * 3,
      ),
      Radius.circular(10),
    );

    canvas.drawRRect(rect, paint);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: value.toInt().toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
    );
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }
}
