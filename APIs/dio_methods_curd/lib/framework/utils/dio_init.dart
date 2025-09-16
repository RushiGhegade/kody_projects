


import 'package:dio/dio.dart';

class DioClient{

  Dio? _dio;

  DioClient(){

    /// make a dio instance
    /// and initialize the baseurl and time out conditions and headers
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.1.113:3000",
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        contentType: 'application/json',
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // this will add the interceptors in dio
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option,handler){
          print("Request Send");
          print("${option.onSendProgress}");
          print("${option.headers}");

          return handler.next(option);

        },
        onResponse: (response,handler){

          print(" Reciver ' ${response.headers} '");

          if(response.statusCode==401){



          }

          return handler.next(response);

        },
        onError:
            (
            DioException dioException,
            ErrorInterceptorHandler errorInterceptorHandler,
            ) async{
          print("Hello form");
          if(dioException.response?.statusCode==404){
            print("Hello form 404");
            return errorInterceptorHandler.reject(dioException);
          }

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

  Dio getDio(){
    return _dio!;
  }

}