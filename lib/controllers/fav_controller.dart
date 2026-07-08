
import 'package:get/get.dart';

class FavController extends GetxController {
  RxBool _isFav = false.obs;

  bool get isFav => _isFav.value;

  set setIsFav(bool val)=>_isFav.value = val;
}