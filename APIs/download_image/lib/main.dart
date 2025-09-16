
import 'package:download_image/image_operation.dart';
import 'package:flutter/material.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  await ImageDownload().download();

  runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}
