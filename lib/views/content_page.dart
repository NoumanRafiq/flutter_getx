import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/controllers/data_controller.dart';
import 'package:flutter_getx/routes/app_routes.dart';
import 'package:get/get.dart';

import 'my_detail_page.dart';

class ContentPage extends StatelessWidget {
  ContentPage({Key? key}) : super(key: key);
  final DataController _dataController = Get.put(DataController());

  void waitForScreen({
    required DataController dataController,
    required bool loadingVal,
  }) {
    Future.delayed(Duration(seconds: 2), () {
      log('screen switching ...');
      dataController.setIsLoading = loadingVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    log('value of isLoading: ${_dataController.isLoading}');
    waitForScreen(dataController: _dataController, loadingVal: false);
    int _currentIndex = 0;
    return Obx(
      () => _dataController.isLoading
          ? Material(child: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                title: _dataController.showAppbarTitle
                    ? CircularProgressIndicator()
                    : Text("Content Page"),
                actionsPadding: EdgeInsetsGeometry.only(right: 16),
                actions: [
                  Switch(
                    value: _dataController.showAppbarTitle,
                    onChanged: (onChangeValue) {
                      _dataController.setAppbarTitle = onChangeValue;
                    },
                  ),
                ],
                backgroundColor: Color(0xFFc5e5f3),
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.only(top: 10),
                color: Color(0xFFc5e5f3),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //james smith
                      Container(
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
                                backgroundImage: AssetImage(
                                  "img/background.jpg",
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "James Smith",
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
                              Expanded(child: Container()),
                              Container(
                                width: 70,
                                height: 70,
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
                      SizedBox(height: 30),
                      //popular contest
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          children: [
                            Text(
                              "Popular Contest",
                              style: TextStyle(
                                color: Color(0xFF1f2326),
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "Show all",
                              style: TextStyle(
                                color: Color(0xFFcfd5b3),
                                fontSize: 15,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            SizedBox(width: 5),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFfdc33c),
                              ),
                              child: GestureDetector(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      //list
                      Container(
                        height: 220,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.88),
                          itemCount: _dataController.detailDataList.length,
                          itemBuilder: (context, index) {
                            final data = _dataController.detailDataList[index];
                            return GestureDetector(
                              onTap: () {
                                // log('value of index $index');
                                _dataController.updateList(index);
                                Get.toNamed(AppRoutes.getDetailPage(index));
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 20,
                                ),
                                height: 220,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: index.isEven
                                      ? Color(0xFF69c5df)
                                      : Color(0xFF9294cc),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            data.title.toString(),
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsetsGeometry.only(
                                          right: 15,
                                        ),
                                        width: width,
                                        child: Text(
                                          data.text.toString(),
                                          textAlign: .justify,
                                          style: TextStyle(
                                            fontSize: 14,
                                            // color: Color(0xFFb8eefc),
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Divider(
                                      thickness: 1.0,
                                      color: Colors.white38,
                                    ),
                                    Row(
                                      children: [
                                        for (int i = 0; i < 1; i++)
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    data.img.toString(),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      //recent contests
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          children: [
                            Text(
                              "Recent Contests",
                              style: TextStyle(
                                color: Color(0xFF1f2326),
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "Show all",
                              style: TextStyle(
                                color: Color(0xFFcfd5b3),
                                fontSize: 15,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            SizedBox(width: 5),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFfdc33c),
                              ),
                              child: GestureDetector(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 4,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final data = _dataController.detailDataList[index];
                            return GestureDetector(
                              onTap: (){
                                _dataController.updateList(index);
                                Get.toNamed(AppRoutes.getDetailPage(index));
                              },
                              child: Container(
                                width: width,
                                height: 100,
                                margin: const EdgeInsets.only(
                                  left: 25,
                                  right: 25,
                                  bottom: 20,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFebf8fd),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                          // "img/background.jpg",
                                          data.img.toString(),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text(
                                            //   "Status",
                                            //   style: TextStyle(
                                            //     // color: Color(0xFFfdebb2),
                                            //     fontSize: 12,
                                            //     color: Colors.amber,
                                            //     decoration: TextDecoration.none,
                                            //   ),
                                            // ),
                                            // SizedBox(height: 5),
                                            SizedBox(
                                              // width: 170,
                                              child: Text(
                                                data.title.toString(),

                                                style: TextStyle(
                                                  color: Color(0xFF3b3f42),
                                                  fontSize: 18,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Expanded(child: Container()),
                                      Container(
                                        // width: 70,
                                        height: 70,

                                        child: Text(
                                          "${data.time}",
                                          style: TextStyle(
                                            fontSize: 10,
                                            decoration: TextDecoration.none,
                                            color: Color(0xFFb2b8bb),
                                            // color: Colors.red
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
