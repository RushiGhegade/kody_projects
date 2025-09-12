
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:https_methods_implements/framework/repository/homerepository/module/api_delete.dart';
import 'package:https_methods_implements/framework/repository/homerepository/module/api_error.dart';
import 'package:https_methods_implements/framework/repository/homerepository/module/fetchdata_model.dart';
import 'package:https_methods_implements/framework/repository/homerepository/repository/apis_repository.dart';


final apisOperationProvider = ChangeNotifierProvider((ref){
  return ApisOperationAsyncNotifier();
});



class ApisOperationAsyncNotifier extends ChangeNotifier{

  List<FetchData> fetchData = [];
  bool isLoading = false;

  updateLoader(bool val){
    isLoading = val;
    notifyListeners();
  }
  void getAllResponseApi()async{

    updateLoader(true);

    String response = await ApiImplements().getAll();

    if(response.contains("error")){
      fetchData = [FetchData(apiError: ApiError(error: jsonDecode(response)['error']))];
    }else{
      fetchData = fetchDataFromJson(response);
    }



    updateLoader(false);
    notifyListeners();

  }

  void getUserById(int id)async{
    updateLoader(true);
    String response = await ApiImplements().getSingleObjectById(id);

    if(response.contains("error")){
      fetchData = [FetchData(apiError: ApiError(error:json.decode(response)['error']))];
    }else{
       fetchData =[ FetchData.fromJson(jsonDecode(response))];
    }
    updateLoader(false);
    notifyListeners();
  }


  Future<String> postUserOnServer(FetchData fetchData)async{

    http.Response response = await ApiImplements().postData(fetchData);

    if(response.statusCode==200){
      return jsonDecode(response.body).toString();
    }else{
      return jsonDecode(response.body)['error'].toString();
    }

  }



  Future<ApiDelete> deleteUserOnServer(int id)async{

    // updateLoader(true);
    http.Response response = await ApiImplements().deleteData(id);

    if(response.statusCode==200){
      print(response.body);
      // updateLoader(false);
      return ApiDelete(massage:jsonDecode(response.body)['message']);
    }else{
      // updateLoader(false);
      return ApiDelete(error:jsonDecode(response.body)['error']);
    }

  }
}