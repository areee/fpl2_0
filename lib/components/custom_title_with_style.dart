import 'package:flutter/material.dart';

Widget customTitleWithStyle(BuildContext context, String title) {
  return Text(
    title,
    style: TextStyle(
      background: Paint()
        ..color = Theme.of(context).colorScheme.primary.withOpacity(0.5)
        ..strokeWidth = 17
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke,
    ),
  );
}
