import 'package:get/get.dart';
import 'package:hem_intership/controller/picture_controller.dart';
import 'package:hem_intership/controller/translation_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<TranslationController>(TranslationController(), permanent: true);
    Get.put<PictureController>(PictureController(), permanent: true);
  }
}
