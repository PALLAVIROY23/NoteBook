import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../home/model/note.dart';
import '../../home/controllers/home_controller.dart';

class AddNoteController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  // Reactive variables to track text field inputs
  var isTitleValid = false.obs;
  var isContentValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen for changes in the text fields
    titleController.addListener(_validateTitle);
    contentController.addListener(_validateContent);
  }

  void _validateTitle() {
    isTitleValid.value = titleController.text.isNotEmpty;
  }

  void _validateContent() {
    isContentValid.value = contentController.text.isNotEmpty;
  }

  bool get canAddNote => isTitleValid.value && isContentValid.value;

  void addNote() {
    if (canAddNote) {
      final note = Note(
        id: DateTime.now().millisecondsSinceEpoch,
        title: titleController.text,
        content: contentController.text,
      );
      final homeController = Get.find<HomeController>();
      homeController.addNote(note);
      EasyLoading.showSuccess("Note added successfully");
      Get.back();
    } else {
      EasyLoading.showError("Please fill out both fields");
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }
}
