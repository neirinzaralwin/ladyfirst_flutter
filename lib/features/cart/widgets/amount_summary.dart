import 'package:flutter/material.dart';
import 'package:lady_first_flutter/core/extensions/app_font.dart';

class AmountSummary extends StatelessWidget {
  const AmountSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Subtotal').bodyLarge.greyColor.bold,
            Container(
                constraints: BoxConstraints(minWidth: 80),
                child: const Text(
                  '\$ 100.0',
                  textAlign: TextAlign.start,
                ).bodyLarge.bold.greyColor),
          ],
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Shipping').bodyLarge.greyColor.bold,
            Container(
                constraints: BoxConstraints(minWidth: 80),
                child: const Text('\$ 15.0').bodyLarge.bold.greyColor),
          ],
        ),
        SizedBox(height: 15.0),
        const DashedDivider(),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total').bodyLarge.greyColor.bold,
            Container(
                constraints: BoxConstraints(minWidth: 80),
                child: const Text('\$ 115.0').bodyLarge.bold.orangeColor),
          ],
        ),
      ],
    );
  }
}

class DashedDivider extends StatelessWidget {
  const DashedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 1),
      painter: _DashedLinePainter(),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 3;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
