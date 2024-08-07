import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../home/model/note.dart';
import '../../home/controllers/home_controller.dart';

class EditNoteController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  late final Note args;

  @override
  void onInit() {
    super.onInit();
    args = Get.arguments as Note;
  }

  void updateNote(Note updatedNote) {
    final homeController = Get.find<HomeController>();
    homeController.updateNote(updatedNote);
    EasyLoading.showSuccess(" note edit successfully");
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}
