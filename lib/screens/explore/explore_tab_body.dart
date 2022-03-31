import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:grotree/screens/explore/explore_tab.dart';
import 'package:grotree/screens/explore/widgets/large_text.dart';
import 'package:grotree/screens/explore/widgets/routes_helper.dart';
import 'package:grotree/screens/explore/widgets/small_text.dart';

import 'utils/dimensions.dart';
import 'widgets/app_column.dart';
import 'widgets/icon_text_widget.dart';

class ExploreTabBody extends StatefulWidget {
  const ExploreTabBody({Key? key}) : super(key: key);

  @override
  _ExploreTabBodyState createState() => _ExploreTabBodyState();
}

class _ExploreTabBodyState extends State<ExploreTabBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {

    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

       Container(
      height: Dimensions.pageViewContainer,
      child: GestureDetector(
        onTap: (){
          Get.toNamed(RoutesHelper.getTrendingProducts());
        },
        child: PageView.builder(
            controller: pageController,
            itemCount: 1,
            itemBuilder: (context, position){
              return _buildPageItem(position);
            }),
      ),
    ),

        SizedBox(height: Dimensions.height30),
          Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LargeText(text: "Check Out These "),
                SizedBox(width: Dimensions.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: LargeText(text: ".", color: Colors.black26,)
                ),
                SizedBox(width: Dimensions.width10),
                Container(
                  child: SmallText(text: "Ongoing-later"),
                )
              ]
            )
          ),
         ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20, bottom: Dimensions.height10),
              child: Row(
                children: [
                  //img
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/exploreimg.png"
                        )
                      )
                    )
                  ),
                  //text
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20)
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: Dimensions.height10,),
                            LargeText(text: "World Bank Internship"),
                            SmallText(text: "An offer to be part of a multi national wonder."),
                            SizedBox(height: Dimensions.height10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(icon: Icons.access_time_sharp,
                                    text: "30 March",
                                    iconColor: Colors.deepOrangeAccent),
                                IconAndTextWidget(icon: Icons.location_on,
                                    text: "All nationalities",
                                    iconColor: Colors.lightGreen),
                              ],
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                ]
              ),
            );
          }),
      ],
    );
  }
  Widget _buildPageItem(int index){
   Matrix4 matrix = new Matrix4.identity();
   if(index==_currPageValue.floor()){
     var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

   }else if(index ==_currPageValue.floor()+1){
     var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1);
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

   }else if(index ==_currPageValue.floor()-1){
     var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
     var currTrans = _height*(1-currScale)/2;
     matrix = Matrix4.diagonal3Values(1, currScale, 1);
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

   }else{
     var currScale=0.8;
     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
   }


   return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageView,
             margin: EdgeInsets.only(left:Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Colors.redAccent : Colors.greenAccent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(
                    "assets/images/exploreimg.png"
                  )
                )
            )
      ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left:Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5)
                    )
                  ]
          ),
              child: Container(
                padding: EdgeInsets.only( left: Dimensions.width15, right: Dimensions.width15),
                child: AppColumn(
                  text: "Explore Oppotunities",
                ),
              ),
      ),
          ),
        ],
          ),
    );
  }
}

