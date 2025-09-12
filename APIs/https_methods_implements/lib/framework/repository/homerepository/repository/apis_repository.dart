
import 'dart:convert';

import 'package:https_methods_implements/framework/repository/homerepository/contract/apis_contract.dart';

import 'package:http/http.dart'  as http;
import 'package:https_methods_implements/framework/repository/homerepository/module/fetchdata_model.dart';

/// here implements all method declare inside the api
class ApiImplements  extends Api {

  @override
  Future<String> getAll() async{

    // these url provided by backend developer
    String url = "https://api.restful-api.dev/objects";

    // convert these url into valid uri object
    Uri uri = Uri.parse(url);

    // fetch the data from server using get method
    http.Response response = await http.get(uri);

    if(response.statusCode==200){
      print(response.body);
      return response.body;
    }else{
      print("Error");
      return response.body;
    }

  }

  @override
  Future<String> getSingleObjectById(int id) async{
    // these url provided by backend developer
    String url = "https://api.restful-api.dev/objects/$id";

    // convert these url into valid uri object
    Uri uri = Uri.parse(url);

    // fetch the data from server using get method
    http.Response response = await http.get(uri);

    return response.body;
  }

  @override
  void getListByIds(List<int> id) {
  }

  @override
  Future<http.Response> postData(FetchData fetchData) async{

    // these url provided by backend developer
    String url = "https://api.restful-api.dev/objects";

    // convert these url into valid uri object
    Uri uri = Uri.parse(url);

    // fetch the data from server using get method
    http.Response response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode(fetchData.toJson())
    );

    // if(response.statusCode==200){
    //   // here return the response
    //   print(response.body);
    //   return response;
    // }else{
    //   print("Error");
    //   throw Exception("Error to fetch data");
    // }
    return response;
  }

  @override
  void patchData() {
    // TODO: implement patchData
  }

  @override
  Future<http.Response> deleteData(int id) async{

    // these url provided by backend developer
    String url = "https://api.restful-api.dev/objects/$id";

    // convert these url into valid uri object
    Uri uri = Uri.parse(url);

    // fetch the data from server using get method
    http.Response response = await http.delete(uri);

    return response;
  }
}