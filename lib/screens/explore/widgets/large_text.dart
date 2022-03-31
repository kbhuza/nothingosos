
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grotree/screens/explore/utils/dimensions.dart';

class LargeText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  LargeText({Key? key, this.color = const Color(0xff424247),
    required this.text,
    this.size=0,
    this.overFlow=TextOverflow.ellipsis
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'RobotoMono',
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w600
      ),
    );
  }
}
