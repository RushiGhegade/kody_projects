import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_explore/widgets/AlignWidget.dart';
import 'package:flutter_widget_explore/widgets/Buttonwidget.dart';
import 'package:flutter_widget_explore/widgets/GridViewWidget.dart';
import 'package:flutter_widget_explore/widgets/ImageWidget.dart';
import 'package:flutter_widget_explore/widgets/ListTileWidget.dart';
import 'package:flutter_widget_explore/widgets/ListViewwidget.dart';
import 'package:flutter_widget_explore/widgets/SliderWidget.dart';
import 'package:flutter_widget_explore/widgets/StackWidget.dart';
import 'package:flutter_widget_explore/widgets/TextFieldWidget.dart';
import 'package:flutter_widget_explore/widgets/columnWidget.dart';
import 'package:flutter_widget_explore/widgets/containerWidget.dart';
import 'package:flutter_widget_explore/widgets/pageview.dart';
import 'package:flutter_widget_explore/widgets/refreshing_widget.dart';
import 'package:flutter_widget_explore/widgets/searcchlist.dart';
import 'package:flutter_widget_explore/widgets/textWidget.dart';
import 'package:flutter_widget_explore/widgets/wrap_widget.dart';

void main() {
  //import 'package:flutter/services.dart';
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.pink, // Makes the status bar transparent
    statusBarIconBrightness: Brightness.dark,// Adjust icon brightness as needed
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchList());
  }
}


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Map<String,dynamic>> list = [
    {
      "name":"Text",
      "getClass":Textwidget()
    },
    {
      "name":"Row And Column",
      "getClass":ColumnWidget()
    },
    {
      "name":"Container",
      "getClass":ContainerWidget()
    },
    {
      "name":"Image",
      "getClass":ImageWidget()
    },
    {
      "name":"Wrap",
      "getClass":WrapWidget()
    },
    {
      "name":"Stack",
      "getClass":StackWidget()
    },
    {
      "name":"TextField",
      "getClass":TextFieldWidget()
    },
    {
      "name":"Grid View",
      "getClass":GridViewWidget()
    },
    {
      "name":"Align Widget",
      "getClass":Alignwidget()
    },
    {
      "name":"Button Widget",
      "getClass":Buttonwidget()
    },
    {
      "name":"ListView Widget",
      "getClass":ListViewwidget()
    },
    {
      "name":"Slider Widget",
      "getClass":SliderWidget()
    },
    {
      "name":"ListTile Widget",
      "getClass":ListTileWidget()
    },
    {
      "name":"ListTile Widget",
      "getClass":MyPageView()
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Flutter Widgets")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: list.length,
            // padding: EdgeInsets.only(bottom: 20),
            itemBuilder:(context,index){
             return GestureDetector(
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return list[index]['getClass'];
                  }));
                 },
                 child: Container(
                   height: 40,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color:Color.fromARGB(191, 182, 177, 182), // Colors.grey,
                          blurRadius: 1,
                          offset: Offset(1, 1)
                        )
                      ]
                    ),
                     margin: EdgeInsets.only(bottom: 10),
                     child: Text(list[index]['name'])));
        }),
      ),
    );
  }
}




