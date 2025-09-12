
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_methods_curd/framework/repository/homerepository/repository/apis_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repository/homerepository/module/fetchdata_model.dart';


final apisOperationProvider = ChangeNotifierProvider((ref){
  return ApisOperationAsyncNotifier();
});



class ApisOperationAsyncNotifier extends ChangeNotifier{

  FetchData? fetchData ;
  bool isLoading = false;
  bool isSearch =  false;
  String? error;


  void updateSearch(bool val){
    isSearch = val;
    notifyListeners();
  }

  void updateLoader(bool val,[bool val1=false]){

    isSearch = val1;
    isLoading = val;
    print(isSearch);
    notifyListeners();
  }
  Future<void> getAllResponseApi()async{

    error=null;

    updateLoader(true);
    try{

      Response response = await ApiImplements().getAllBrand();
      print(response.data.runtimeType);
      // print("--------------- ${response.data}");

      fetchData = fetchDataFromJson(jsonEncode(response.data));

      print(" -----------------  $fetchData");
    }catch (e){
      error = e.toString();
      print(e);
    }finally{
      updateLoader(false);
      notifyListeners();
    }
  }

  Future<void> getBrandById(int id)async{
    error=null;
    // updateSearch(true);
    updateLoader(true,true);
    try{

      Response response = await ApiImplements().getBrandById(id);

      print(response.data.runtimeType);

      if(response.statusCode==200){
        print("I am Here 1");
        print(fetchDataFromJsonSingle(jsonEncode(response.data)));
        fetchData = fetchDataFromJsonSingle(jsonEncode(response.data));
      }else{
        print("I am Here 2");
        error = response.data['message'];
      }
      print(" -----------------  $fetchData");
    }catch (e){
      print("image ");
      error = "Id Not Found";
      print(e);
    }finally{
      // updateSearch(false);
      updateLoader(false,false);
      notifyListeners();
    }

  }

  Future<String> patchUserData(int id,FetchData fetchData)async{
   return "";
  }

  Future<FetchData> postUserOnServer(Datum data)async{

    error=null;

    updateLoader(true,true);
    try{

      Response response = await ApiImplements().postData(data);

      print(response.data.runtimeType);
      print(response.data);
      if(response.statusCode==201){
        print("I am Here 1");
        print(fetchDataFromJsonSingle(jsonEncode(response.data)));
        return fetchDataFromJsonSingle(jsonEncode(response.data));
      }else{
        print("I am Here 2");

        return FetchData(
          message: "Brand Not Post",
        );
      }
    }catch (e){

      return FetchData(
        message: "Brand name already exists",
      );
    }finally{
      updateLoader(false,false);
      notifyListeners();
    }
  }

  Future<FetchData> deleteUserOnServer(int id)async{

    error=null;

    updateLoader(true,true);
    try{

      Response response = await ApiImplements().deleteData(id);

      print(response.data.runtimeType);
      print(response.data);
      if(response.statusCode==200){
        print("I am Here 1");
        return fetchDataFromJsonSingle(jsonEncode(response.data));
      }else{
        print("I am Here 2");

        return FetchData(
          message: "Brand not found",
        );
      }
    }catch (e){

      return FetchData(
        message:"Brand not found",
      );
    }finally{
      updateLoader(false,false);
      notifyListeners();
    }

  }


  Future<FetchData> updateData(int id,Datum data)async{
    error=null;

    updateLoader(true,true);
    try{

      Response response = await ApiImplements().patchData(id,data);

      print(response.data.runtimeType);
      print(response.data);
      print(response.statusCode);
      if(response.statusCode==200){
        print("I am Here 1");
        print(fetchDataFromJsonSingle(jsonEncode(response.data)));
        return fetchDataFromJsonSingle(jsonEncode(response.data));
      }else{
        print("I am Here 2");

        return FetchData(
          message: "Brand Not Found",
        );
      }
    }catch (e){

      return FetchData(
        message: "Brand Not Found",
      );
    }finally{
      updateLoader(false,false);
      notifyListeners();
    }
  }



  Future<FetchData> postImageOnServer(int id,PlatformFile file)async{

    error=null;

    updateLoader(true,true);
    try{

      Response response = await ApiImplements().imageChange(id, file);

      print(response.data.runtimeType);
      print(response.data);
      print(response.statusCode);
      if(response.statusCode==200){
        return FetchData(
          message: "Image Uploaded Successfully"
        );
      }else{
        print("I am Here 2");

        return FetchData(
          message:  "Image Not Uploaded ",
        );
      }
    }catch (e){
      print(e);
      return FetchData(
        message:  "Image Not Uploaded Successfully",
      );
    }finally{
      updateLoader(false,false);
      notifyListeners();
    }
  }

}