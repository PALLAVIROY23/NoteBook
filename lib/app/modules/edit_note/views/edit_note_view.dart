import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/model/note.dart';
import '../controllers/edit_note_controller.dart';

class NoteDetailScreen extends GetView<EditNoteController> {
  const NoteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized
    final note = controller.args;

    if (note == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
          child: Text('No note available'),
        ),
      );
    }

    // Set the initial values of the controllers
    controller.titleController.text = note.title;
    controller.contentController.text = note.content;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final updatedNote = Note(
                id: note.id,
                title: controller.titleController.text,
                content: controller.contentController.text,
              );
              controller.updateNote(updatedNote);
              Get.back();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(labelText: 'Title'),
              maxLines: 1,
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: null, // Allow for multiple lines
            ),
          ],
        ),
      ),
    );
  }
}
