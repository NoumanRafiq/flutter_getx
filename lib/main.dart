import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/routes/app_routes.dart';
import 'package:get/get.dart';
import 'views/content_page.dart';
import 'firebase_options.dart';
import 'views/my_detail_page.dart';
import 'views/my_home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log('App routes : ${AppRoutes.routes}');
    return GetMaterialApp(
      title: 'Flutter Demo',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home: Container(color: Colors.white,),
      // home: MyHomePage(),
      initialRoute: '/',
      getPages: AppRoutes.routes,
    );
  }
}
