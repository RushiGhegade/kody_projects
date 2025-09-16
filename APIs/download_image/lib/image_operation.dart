
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ImageDownload{

  Future<void> download()async{

    String imageUrl = "https://media.istockphoto.com/id/483724081/photo/yosemite-valley-landscape-and-river-california.jpg?s=1024x1024&w=is&k=20&c=gRisD5IKwAUmG7Akt3lQU93lMs9NJrIQTARNdU5ihOQ=";

    try {
      Uri url = Uri.parse(imageUrl);

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        print("Image get");


        print(response.bodyBytes);



        final directory =await getDownloadsDirectory();

        File file = File("${directory!.path}/i3.png");

        await file.writeAsBytes(response.bodyBytes);

        print(file.path);

      } else {
        print("Image Not Get");
      }
    }catch(e){
      print(e);
    }

  }

}