import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PicImages {
  static Future<XFile?> pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    return await imagePicker.pickImage(source: ImageSource.gallery);
  }
}
