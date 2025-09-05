import 'package:image_picker/image_picker.dart';

// these class get the images form native device
class PicImages {
  static Future<XFile?> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    return await imagePicker.pickImage(source: ImageSource.gallery);
  }
}
