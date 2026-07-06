
import 'package:flutter_getx/views/content_page.dart';
import 'package:flutter_getx/views/my_detail_page.dart';
import 'package:flutter_getx/views/my_home_page.dart';
import 'package:get/get.dart';

class AppRoutes {

  static const String initial = '/';
  static const String homePage = '/home-page';
  static const String detailPage = '/detail-page';
  static const String contentPage = '/content-page';

  // get the screens by names
  static String getInitial()=>initial;
  static String getHomePage()=>homePage;
  static String getDetailPage()=>detailPage;
  static String getContentPage()=>contentPage;

  static List<GetPage<String>> routes = [
    GetPage(name: initial, page: ()=>MyHomePage()),
    GetPage(name: detailPage, page: ()=>DetailPage()),
    GetPage(name: contentPage, page: ()=>ContentPage()),
  ];
}