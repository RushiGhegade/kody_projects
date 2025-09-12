import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../contract/apis_contract.dart';
import '../module/fetchdata_model.dart';

/// here implements all method declare inside the api
class ApiImplements extends Api {

  Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.1.113:3000",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      contentType: 'application/json',
      headers: {'Content-Type': 'application/json'},
    ),
  );



  void addInterceptorInDio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError:
            (
              DioException dioException,
              ErrorInterceptorHandler errorInterceptorHandler,
            ) {
              if (dioException.type == DioExceptionType.connectionTimeout ||
                  dioException.type == DioExceptionType.receiveTimeout) {
                print("Connection Time Out");
              } else if (dioException.type == DioExceptionType.cancel) {
                print("Request Cancel");
              } else if (dioException.type == DioExceptionType.badResponse) {
                print("bad Resonse");
              }
              return errorInterceptorHandler.next(dioException);
            },
      ),
    );
  }

  @override
  Future<Response> getAllBrand() async {
    try{
      Response response = await dio.get("/api/brands");
      return response;
    }on DioException catch (e){
      throw Exception(e);
    }
  }


  @override
  Future<Response> getBrandById(int id) async{
    try{
      Response response = await dio.get("/api/brands/$id");
      return response;
    }on DioException catch (e){
      throw Exception(e);
    }
  }

  @override
  Future<Response> postData(Datum data) async {
    try{
      print(data.name);
      print(data.description);
      Response response = await dio.post(
        "/api/brands",
        data:{
          "name": data.name,
          "description": data.description,
          "website": "https://apple.com",
          "is_active": true
        }
      );
      print(response);
      return response;

    }on DioException catch (e){
      print(e);
      throw Exception(e);
    }
  }


  @override
  Future<Response> patchData(int id ,Datum data) async{

    try{
      print(data.name);
      print(data.description);
      Response response = await dio.put(
          "/api/brands/$id",
          data:{
            "name": data.name,
            "description": data.description,
            "website": "https://apple.com",
            "is_active": true
          }
      );
      print(response);
      return response;

    }on DioException catch (e){
      print(e);
      throw Exception(e);
    }


  }

  @override
  Future<Response> deleteData(int id) async{
    try{
      Response response = await dio.delete("/api/brands/$id");
      return response;
    }on DioException catch (e){
      throw Exception(e);
    }
  }

  @override
  Future<Response> imageChange(int id,PlatformFile file) async{



    try{

      String fileName = file.name;
      print(fileName);
      FormData formData = FormData.fromMap(
          {
            "logo":MultipartFile.fromBytes(
              await File(file.path!).readAsBytes(),
              filename: fileName,
            ),
          }
      );

      Response response = await dio.post(
          "/api/brands/$id/upload-logo",
        data:formData,
        onSendProgress: (int sent, int total) {
          print('Upload progress: ${(sent / total * 100).toStringAsFixed(0)}%');
        },
      );
      return response;
    }on DioException catch (e){
      print(e);
      throw Exception(e);
    }
  }
}
