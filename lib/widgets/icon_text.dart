import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double iconSize;
  final String text;
  final TextStyle? textStyle;

  const IconText(
      {Key? key,
      required this.icon,
      required this.color,
      required this.iconSize,
      required this.text,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontScaling = MediaQuery.of(context).textScaleFactor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          icon,
          color: color,
          size: iconSize,
        ),
        Text(
          fontScaling > 1.30 && text.length > 4
              ? "${text.substring(0, 4)}..."
              : text,
          style: textStyle,
        )
      ],
    );
  }
}
