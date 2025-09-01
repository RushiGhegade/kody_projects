import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class Demo extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  AudioPlayer player = AudioPlayer();

  Uint8List? imageMemory ;

  void fun() {
    switch (1) {
      case 1:
        {}
      case 1:
        {}
    }
    // Navigator.push(context, MaterialPageRoute(builder:(context){
    //   return Demo();
    // }));
  }

  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }

  void getImage()async{
    try{
      ImagePicker imagePicker = ImagePicker();
      XFile? file =await  imagePicker.pickImage(source:ImageSource.gallery);
      imageMemory = File(file!.path).readAsBytesSync();
      setState(() {

      });
    }catch(e){
      print(e);
      print("Hello $imageMemory");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          currentIndex: 0,
          iconSize: 31,
          selectedFontSize: 21,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_filled),
              label: "home",

            ),
            BottomNavigationBarItem(

              icon: Icon(Icons.ac_unit_sharp,),
              label: "home",

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_rounded),
              label: "home",


            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_rounded),
              label: "home",

            ),
          ]
          ,
        ),
        drawerEdgeDragWidth:10,
       drawerDragStartBehavior: DragStartBehavior.down,
       appBar: AppBar(
            // leading: Icon(Icons.access_time_filled),
         title: Text("Hello word"),
       ),

        floatingActionButton: FloatingActionButton(onPressed: (){},child: Text("Hello"),),
        // appBar: AppBar(title:Column(
        //   children: [
        //     Container(height: 500,
        //     width: 10,
        //     color: Colors.pink,)
        //   ],
        //
        // ),
        // actions: [
        //   Container(height: 500,
        //     width: 10,
        //     color: Colors.pink,)
        // ],
        // backgroundColor: Colors.blue,),
        endDrawerEnableOpenDragGesture:true,
        
        drawer: Drawer(

        ),
        endDrawer: Drawer(),
        // backgroundColor: Colors.red,
        primary: true,
        body: SingleChildScrollView(
          // reverse: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: (){
                        getImage();
                      },
                      child: Icon(Icons.home)),
                ),

                ElevatedButton(
                  onPressed: () {
                    player.play(AssetSource("music1.mp3"));
                  },
                  child: Text("Play Music"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    player.pause();
                  },
                  child: Text("Pause Music"),
                ),

                SizedBox(
                  height: 30,
                ),
                //
                // Container(
                //   height: 300,
                //   width: 300,
                //   // alignment: Alignment.center,
                //   color: Colors.blue,
                //   child:Text("Hello word",
                //       maxLines: 2
                //       ,textAlign: TextAlign.start
                //     ,textDirection:TextDirection.rtl,
                //     locale:Localizations.maybeLocaleOf(context) ,
                //     softWrap: false
                //     ,style: TextStyle(
                //
                //       fontSize: 30,
                //     ),
                //     // overflow: TextOverflow.fade,
                //   ) ,
                // ),

                // Icon(
                //   Icons.add_a_photo_rounded,
                //   color: Colors.pink,
                //   size: 40,
                //   weight: 8000,
                //   // shadows: [
                //   //   Shadow(color: Colors.black,blurRadius: 10,offset: Offset(0, 0)),
                //   //   Shadow(color: Colors.black,blurRadius: 1,offset: Offset(0, 0))
                //   // ],
                //   textDirection: TextDirection.ltr,
                //   applyTextScaling: true,
                //   fill: 1.0,
                //
                // ),



                Container(
                  height: 300,
                  width: 300,
                  // color: Colors.red,
                  child: Image.asset(
                      "assets/p2.jpg",
                    width: 50,
                    height: 50,
                    // color: Colors.red,
                    opacity:AlwaysStoppedAnimation(0.9),
                    fit: BoxFit.cover
                    ,
                    // colorBlendMode: BlendMode.clear,
                    filterQuality: FilterQuality.low,
                    isAntiAlias: true,
                    errorBuilder:(context, url, error) =>  Icon(Icons.error),

                  ),

                ),
                if(imageMemory != null)
                  Image.memory(imageMemory!),

                SizedBox(
                  height: 20,
                ),

                Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runSpacing: 30,
                  alignment: WrapAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.pink,
                    ),
                    // SizedBox(width: 100,),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.pink,
                    ),
                    // SizedBox(width: 100,),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.pink,
                    ),
                    // SizedBox(width: 100,),
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.pink,
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                TextField(
                  onChanged: (value){
                    print("----$value");
                  },
                  obscureText: true,

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text("Enter the Name"),
                    hintText: "Enter the name",
                    prefixIcon: Icon(Icons.remove_red_eye),
                    suffix: Text("Hello"),
                    enabled: true,
                   focusColor: Colors.red,
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color:Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:
                        Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(color:
                        Colors.red),

                    ),
                //       focusedBorder: OutlineInputBorder(
                //
                //
                //   borderRadius: BorderRadius.circular(20),
                //   borderSide: BorderSide(color: Colors.red),
                //
                // )
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: (){
                    print("Hello");
                  },
                  onDoubleTap: (){
                    print("On Double tap");
                  },
                  onDoubleTapDown: (v){
                    print("on tap down $v");
                  },
                  onLongPress: (){
                    print("on Long press");
                  },
                  child: Icon(Icons.add),

                ),
                
                SizedBox(
                  height: 20,
                ),
                
                ElevatedButton(
                    onHover: (v){
                      print("000000000000 $v");
                    },
                    
                    onPressed: (){
                      print("on Press");
                    },
                    child: Text("Add")
                ),
                TextButton(onPressed: (){}, child: Text("Text")),
                OutlinedButton(
                    style: ButtonStyle(
                      // backgroundColor: WidgetStatePropertyAll(Colors.red),

                    ),
                    onPressed: (){}, child: Text("data")),
                IconButton(onPressed: (){}, icon: Icon(Icons.add)),

                SizedBox(height: 20,),

                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics()
                  ,padding: EdgeInsets.all(100),
                  clipBehavior: Clip.antiAlias,
                  children: [
                          Container(
                            height: 109,
                            width: 109,
                            color: Colors.pink,
                          ),
                    SizedBox(height: 10,),
                    Container(
                      height: 109,
                      width: 109,
                      color: Colors.pink,
                    ),
                  ],
                ),

                SizedBox(
                  width: 200,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                      itemCount: 3,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemBuilder:(BuildContext context,int index){
                  
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 40,
                          width: 40,
                          color: Colors.yellow,
                        );
                  
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


