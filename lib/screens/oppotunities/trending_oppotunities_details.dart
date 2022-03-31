import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:grotree/screens/explore/explore_tab.dart';
import 'package:grotree/screens/explore/utils/dimensions.dart';
import 'package:grotree/screens/explore/widgets/app_column.dart';
import 'package:grotree/screens/explore/widgets/app_icon.dart';
import 'package:grotree/screens/explore/widgets/expandable_text_widget.dart';
import 'package:grotree/screens/explore/widgets/large_text.dart';

class TrendingProductsDetail extends StatelessWidget {
  const TrendingProductsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.trendingProductsImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/chevening.jpg"
                  )
                )
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 GestureDetector(
                   onTap:(){
                   Get.to(()=>ExploreTab());
                   },

                     child:
                 AppIcon(icon: Icons.arrow_back_ios)),
               ],
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.trendingProductsImgSize-20,
            child: Container(

              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20)
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "",),
                  SizedBox(height: Dimensions.height20,),
                  LargeText(text: "Description"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: " "))
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
         decoration: BoxDecoration(
           color: Color(0xB0D8DCE7),
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(Dimensions.radius20*2),
             topRight: Radius.circular(Dimensions.radius20*2),
           )
         ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: Colors.blueGrey,)
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              child: LargeText(text: ""),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.deepPurpleAccent
              ),
            ),
          ],
        ),
      ),
    );
  }
}
