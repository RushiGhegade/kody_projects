
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:https_methods_implements/framework/repository/homerepository/module/api_error.dart';
import 'package:https_methods_implements/framework/repository/homerepository/module/fetchdata_model.dart';
import 'package:https_methods_implements/framework/repository/homerepository/repository/apis_repository.dart';
import 'package:riverpod/riverpod.dart';

final apisOperationProvider = AsyncNotifierProvider<ApisOperationAsyncNotifier,List<FetchData>>(() {

  return ApisOperationAsyncNotifier();

} );



class ApisOperationAsyncNotifier extends AsyncNotifier<List<FetchData>>{

  @override
  List<FetchData> build() {
    // TODO: implement build
    return [];
  }

  void getAllResponseApi()async{

    state = AsyncLoading();

    String response = await ApiImplements().getAll();

    List<FetchData> data = fetchDataFromJson(response);

    state =  AsyncValue.data(data);

  }

  void getUserById(int id)async{

    state = AsyncLoading();

    String response = await ApiImplements().getSingleObjectById(id);

    if(response.contains("error")){

      FetchData fetchData = FetchData(apiError: ApiError(error:json.decode(response)['error']));

      state = AsyncValue.data([fetchData]);

    }else{

      List<FetchData> data = fetchDataFromJson(response);

      state =  AsyncValue.data(data);

    }

  }


  Future<bool> postUserOnServer()async{

     http.Response response = await ApiImplements().postData();

    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }

  }



  Future<bool> deleteUserOnServer(int id)async{

    http.Response response = await ApiImplements().deleteData(id);

    if(response.statusCode==200){

      return true;
    }else{
      return false;
    }

  }




}