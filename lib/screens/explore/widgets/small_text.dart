import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;

  SmallText({Key? key,
    this.color = const Color(0xff746161),
    required this.text,
    this.size=16,
    this.height=1.8,
    this.overFlow=TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
          fontFamily: 'RobotoMono',
          height: height,
          color: color,
          fontWeight: FontWeight.w600,
        fontSize: 9
      ),
    );
  }
}
