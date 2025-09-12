
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class HomeController{

  static TextEditingController searchController = TextEditingController();
  static TextEditingController deleteController = TextEditingController();

  Future<PlatformFile?> getFileFromGallery()async{

    FilePickerResult? filePickerResult =   await FilePicker.platform.pickFiles();

    if(filePickerResult!=null){
      return filePickerResult.files.first;
    }

    return null;
  }
}


