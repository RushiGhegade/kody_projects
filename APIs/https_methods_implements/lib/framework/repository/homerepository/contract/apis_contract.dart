
import 'package:http/http.dart'  as http;
import 'package:https_methods_implements/framework/repository/homerepository/module/fetchdata_model.dart';

abstract class Api{

  //  make these method to call get all data api
  Future<String> getAll();

  // make these method to get data by id
  void getListByIds(List<int> id);

  // make these method to get single object by id
  void getSingleObjectById(int id);

  // make these Method for add data on server
  Future<http.Response> postData(FetchData fetchData);

  // make these method for change the single entity
  void patchData();

  // make these for delete the data base on id
  void deleteData(int id);

}