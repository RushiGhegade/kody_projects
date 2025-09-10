
import 'dart:convert';

import 'package:https_methods_implements/framework/repository/homerepository/contract/apis_contract.dart';

import 'package:http/http.dart'  as http;

/// here implements all method declare inside the api
class ApiImplements  extends Api {

  @override
  Future<String> getAll() async{

    // these url provided by backend developer
    String url = "https://dummyjson.com/c/a30f-eb84-43aa-83b1";

    // convert these url into valid uri object
    Uri uri = Uri.parse(url);

    // fetch the data from server using get method
    http.Response response = await http.get(uri);

    if(response.statusCode==200){
      // here return the response
      print(response.body);
      return response.body;
    }else{
      print("Error");
      throw Exception("Error to fetch data");
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

    if(response.statusCode==200){
      // here return the response
      print(response.body);
      return response.body;
    }else if (response.statusCode==405){
      print("Error");
      return response.body;
    }else{
      throw Exception("Error to fetch data");
    }
  }

  @override
  void getListByIds(List<int> id) {
  }

  @override
  Future<http.Response> postData() async{

    // these url provided by backend developer
    String url = "https://dummyjson.com/c/d5f1-8b58-4ba1-9182";

    // convert these url into valid uri object
    Uri uri = Uri.parse(url);

    // fetch the data from server using get method
    http.Response response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
      "name": "Apple MacBook Pro 16",
      "data": {
        "year": 2019,
        "price": 1849.99,
        "CPU model": "Intel Core i9",
        "Hard disk size": "1 TB"
      }
    }));

    if(response.statusCode==200){
      // here return the response
      print(response.body);
      return response;
    }else{
      print("Error");
      throw Exception("Error to fetch data");
    }

  }

  @override
  void patchData() {
    // TODO: implement patchData
  }

  @override
  Future<http.Response> deleteData(int id) async{

    // these url provided by backend developer
    String url = "https://dummyjson.com/c/35bb-ce97-43e1-b6de";

    // convert these url into valid uri object
    Uri uri = Uri.parse(url);

    // fetch the data from server using get method
    http.Response response = await http.delete(uri);

    if(response.statusCode==200){
      // here return the response
      print(response.body);
      return response;
    }else{
      print("Error");
      throw Exception("Error to fetch data");
    }
  }
}