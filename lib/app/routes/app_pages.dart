import 'package:get/get.dart';

import '../modules/add_note/bindings/add_note_binding.dart';
import '../modules/add_note/controllers/add_note_controller.dart';
import '../modules/add_note/views/add_note_view.dart';
import '../modules/edit_note/bindings/edit_note_binding.dart';
import '../modules/edit_note/controllers/edit_note_controller.dart';
import '../modules/edit_note/views/edit_note_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      transition: Transition.zoom,
      transitionDuration: Duration(seconds: 1),
      binding: SplashBinding(),
    ),

    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      transition: Transition.upToDown,
      transitionDuration: Duration(seconds: 1),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.EDIT_NOTE,
      page: () => NoteDetailScreen(),
      transition: Transition.upToDown,
      transitionDuration: Duration(seconds: 1),
      binding: BindingsBuilder(() {
        Get.lazyPut<EditNoteController>(() => EditNoteController());
      }),
    ),
    GetPage(
      name: Routes.ADD_NOTE,
      page: () => AddNoteScreen(),
      transition: Transition.upToDown,
      transitionDuration: Duration(seconds: 1),
      binding: BindingsBuilder(() {
        Get.lazyPut<AddNoteController>(() => AddNoteController());
      }),
    ),
  ];
}
