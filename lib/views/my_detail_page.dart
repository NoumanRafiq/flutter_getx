import 'dart:convert';
import 'dart:developer';
import 'package:flutter_getx/controllers/data_controller.dart';
import 'package:flutter_getx/controllers/fav_controller.dart';
import 'package:flutter_getx/models/detail_data_model.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'content_page.dart';
import 'my_home_page.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);
final DataController controller = Get.find<DataController>();
final FavController favController = Get.put(FavController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;

    final String? id = Get.parameters['id'];

    if(id==null || id.isEmpty || int.tryParse(id)==null){
      return Material(
        child: Center(child: Text('id is null')),
      );
    }

    final index = int.parse(id!);
    final dataModel = controller.detailDataList[index];
    // final DetailsDataModel dataModel = Get.arguments as DetailsDataModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFc5e5f3),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Container(
        color: Color(0xFFc5e5f3),
        child: Stack(
          children: [
            // Positioned(
            //   top: 50,
            //   left: 10,
            //   child: IconButton(
            //     onPressed: () => null,
            //     icon: Icon(Icons.arrow_back_ios),
            //   ),
            // ),
            Positioned(
              top: 15,
              left: 0,
              height: 100,
              width: width,
              child: Container(
                width: width,
                height: 100,
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFebf8fd),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("${dataModel.img}"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${dataModel.name}",
                            style: TextStyle(
                              color: Color(0xFF3b3f42),
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Top Level",
                            style: TextStyle(
                              // color: Color(0xFFfdebb2),
                              color: Colors.amber,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      // Expanded(child: Container()),
                      Spacer(),
                      Container(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                        margin: EdgeInsetsGeometry.symmetric(vertical: 10),
                        // width: 70,
                        // height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFf3fafc),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFF69c5df),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              width: width,
              height: height,
              child: Container(
                width: 80,
                height: 80,
                color: Color(0xFFf9fbfc),
                // color: Colors.red,
              ),
            ),
            Positioned(
              top: 170,
              left: 0,
              width: width,
              height: 230,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: width,
                height: 250,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFfcfffe),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: Offset(0, 10),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "${dataModel.title}",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: width,
                        child: Text(
                          "${dataModel.text}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFb8b8b8),
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Divider(thickness: 1.0),
                      SizedBox(height: 7),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.watch_later, color: Color(0xFF69c5df)),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "name",
                                    style: TextStyle(
                                      // fontSize: 18,
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Deadline",
                                    style: TextStyle(
                                      // fontSize: 18,
                                      color: Color(0xFFacacac),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.monetization_on,
                                color: Color(0xFFfb8483),
                              ),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "499",
                                    style: TextStyle(
                                      // fontSize: 18,
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Prize",
                                    style: TextStyle(
                                      // fontSize: 18,
                                      color: Color(0xFFacacac),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Color(0xFFfbc33e)),
                              SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Top Level",
                                    style: TextStyle(
                                      // fontSize: 18,
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Entry",
                                    style: TextStyle(
                                      // fontSize: 18,
                                      color: Color(0xFFacacac),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 450,
              left: 25,
              height: 50,

              child: Container(
                child: RichText(
                  text: TextSpan(
                    text: "Total Participants ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "(${controller.detailDataList.length})",
                        style: TextStyle(color: Color(0xFFfbc33e)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // //images
            Stack(
              children: [
                for (int i = 0; i < controller.tempDataList.length; i++)
                  Positioned(
                    top: 500,
                    left: (20 + i * 35).toDouble(),
                    width: 50,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage("${controller.tempDataList[i].img}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // //favourite
            Positioned(
              top: 600,
              left: 25,
              child: Obx(()=> GestureDetector(
                onTap: (){
                  favController.setIsFav = !favController.isFav;
                  log('isFav value: ${favController.isFav}');
                },
                child: Container(
                  padding:.symmetric(horizontal: 6, vertical: 6) ,
                  // width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: favController.isFav? Colors.red.shade100:Colors.transparent),
                    borderRadius: .circular(22)
                  ),
                  child: Row(
                      children: [
                         Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: favController.isFav ? Colors.red.shade400: Color(0xFFfbc33e),
                            ),
                            child: Icon(Icons.favorite_border, color: Colors.white),
                          ),

                        SizedBox(width: 10),
                        Text(
                          "Add to favorite",
                          style: TextStyle(color: favController.isFav?Colors.red:Color(0xFFfbc33e), fontSize: 18),
                        ),
                      ],
                    ),
                ),
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
