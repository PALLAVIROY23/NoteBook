import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_note_controller.dart';
import '../../home/model/note.dart';

class AddNoteScreen extends GetView<AddNoteController> {
  AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: controller.contentController,
              decoration: InputDecoration(labelText: 'Content'),
            ),
            SizedBox(height: 20),
            Obx(() {
              return ElevatedButton(
                onPressed: controller.canAddNote ? controller.addNote : null,
                child: Text('Add Note'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
