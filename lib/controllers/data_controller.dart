import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_getx/models/detail_data_model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final RxList<DetailsDataModel> _detailDataList = <DetailsDataModel>[].obs;

  List<DetailsDataModel> get detailDataList => _detailDataList;

  final RxBool _isLoading = true.obs;

  bool get isLoading => _isLoading.value;

  set setIsLoading(bool value) => _isLoading.value = value;

  final RxBool _showAppbarTitle = false.obs;

  bool get showAppbarTitle => _showAppbarTitle.value;

  set setAppbarTitle(bool value) => _showAppbarTitle.value = value;

  void loadJsonData() async {
    final String detailData = await rootBundle.loadString('json/detail.json');
    log('detail data response : ${detailData.toString()}');
    final List<dynamic> jsonData = jsonDecode(detailData);

    _detailDataList.value = jsonData.map((e)=>DetailsDataModel.fromJson(json: e)).toList();

  }

  @override
  void onInit() {
    // TODO: implement onInit
    log('Controller initialized');
    loadJsonData();
    super.onInit();
  }

  //
  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   // _isLoading.value = true;
  //   log('Controller closed, ${_isLoading.value}');
  //   super.onClose();
  // }
}
