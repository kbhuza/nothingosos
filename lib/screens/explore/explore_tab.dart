import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'explore_tab_body.dart';
import 'utils/dimensions.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
      Container(
        margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
        padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Container(
            width: Dimensions.height45,
          height: Dimensions.height45,
          child: Icon(Icons.menu, color: Colors.white, size: Dimensions.iconSize24,),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              color: Colors.blue
          ),
      ),
        ),
      Column(
        children: [
          Text(
            "Grotree",
            style: TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: Dimensions.font20,
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.w900
            ),
          ),
        ],
      )
      ],
    )
    ),
          Expanded(child: SingleChildScrollView(
            child: ExploreTabBody()
          )),
        ],
      ),
    );



  }
}
