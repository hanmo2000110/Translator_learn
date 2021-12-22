import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class PictureController extends GetxController {
  PickedFile? _image;

  get image => _image;

  Future getImageFromCam() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    _image = image;
    print(_image!.path);
  }

  Future getImageFromGallery() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    _image = image;
    print(_image!.path);
  }
}
