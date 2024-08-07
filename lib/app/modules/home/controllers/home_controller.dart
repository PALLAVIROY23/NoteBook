import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../model/note.dart';

class HomeController extends GetxController {
  var notes = <Note>[].obs;

  void addNote(Note note) {
    notes.add(note);
  }

  void updateNote(Note updatedNote) {
    final index = notes.indexWhere((note) => note.id == updatedNote.id);
    if (index != -1) {
      notes[index] = updatedNote;
    }
  }

  void deleteNoteById(int id) {
    notes.removeWhere((note) => note.id == id);
    EasyLoading.showInfo("notes remove");

  }
}
