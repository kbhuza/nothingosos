
import 'package:get/get.dart';
import 'package:grotree/screens/oppotunities/trending_oppotunities_details.dart';

import '../explore_tab.dart';

class RoutesHelper{
  static const String initial="/";
  static const String trendingProducts="/trending-Products";

  static String getTrendingProducts()=> '$trendingProducts';


  static List<GetPage> routes=[
    GetPage(name: "/", page: ()=>ExploreTab()),
    GetPage(name:trendingProducts, page:(){
      return TrendingProductsDetail();
    },

      transition: Transition.leftToRightWithFade

    ),
  ];
}