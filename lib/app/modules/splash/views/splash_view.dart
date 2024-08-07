import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.count;
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
        child: Image(image: AssetImage("assets/images/noteBook.jpg"))
      ),
    );
  }
}
