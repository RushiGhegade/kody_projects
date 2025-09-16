
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_methods_curd/framework/repository/homerepository/repository/apis_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../repository/homerepository/module/fetchdata_model.dart';



/// make the provider to perform the operation on api
/// get , delete , update this operation is perform through this controller
final apisOperationProvider = ChangeNotifierProvider((ref){
  return ApisOperationAsyncNotifier();
});

class ApisOperationAsyncNotifier extends ChangeNotifier{

  // store the data that come form api
  FetchData? fetchData ;

  // it help you to identify the loading status of the api
  bool isLoading = false;

  // when help you to manage the search status
  bool isSearch =  false;

  //when error is come the error is present here
  String? error;

  // for pagination
  bool hasMoreData = true;
  int page =1;
  final int limit = 10;


  // this update the loader and isSearch value
  void updateLoader(bool val,[bool val1=false]){
    isSearch = val1;
    isLoading = val;
    print(isSearch);
    notifyListeners();
  }

  // get operation
  Future<void> getAllResponseApi(bool pageFlag)async{

    if(pageFlag){
      fetchData!.data = [];
      hasMoreData =true;
      page=1;
    }

    if(isLoading || !hasMoreData){
      return;
    }

    error=null;

    if(page==1){
      updateLoader(true);
    }

    try{

      Response response = await ApiImplements().getAllBrand(page,limit);
      print(response.data.runtimeType);
      // print("--------------- ${response.data}");

      if(fetchData==null){
        print("add first time data page = $page");
        page=1;
        fetchData = fetchDataFromJson(jsonEncode(response.data));
        if(fetchData!.data!.length < limit){
          hasMoreData = false;
        }
        page++;
      }else{
        print("add Second time data page = $page");
        FetchData fetch = fetchDataFromJson(jsonEncode(response.data));

        if(fetch.data!.length < limit){
          hasMoreData = false;
        }

        if(fetch.data!.isEmpty){

          hasMoreData = false;

        }else{

          fetchData!.data!.addAll(fetch.data!);
          page++;
        }


      }



      print(" -----------------  $fetchData");
    }catch (e){
      error = e.toString();
      print(e);
    }finally{
      updateLoader(false);
      notifyListeners();
    }
  }

  // get by id operation
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

  // post the user on the server
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

  //  delete the user on the server
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

  // it help to update the data
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

  //  post the user on the server
  Future<FetchData> postImageOnServer(int id,PlatformFile file,WidgetRef ref)async{

    error=null;

    updateLoader(true,true);
    try{

      Response response = await ApiImplements().imageChange(id, file,ref);

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