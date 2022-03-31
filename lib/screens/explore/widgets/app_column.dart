import 'package:flutter/material.dart';
import 'package:grotree/screens/explore/utils/dimensions.dart';
import 'package:grotree/screens/explore/widgets/large_text.dart';
import 'package:grotree/screens/explore/widgets/small_text.dart';

import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LargeText(text: text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
      SmallText(text: "Find new intersting oppotunities from a variety of fields.")
  ]
    );
  }
}
