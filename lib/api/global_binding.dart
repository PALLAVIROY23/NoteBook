
import 'package:get/get.dart';

import 'api.controller.dart';



class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiController>(() => ApiController());

  }
}