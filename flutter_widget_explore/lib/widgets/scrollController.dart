
import 'package:flutter/material.dart';
import 'package:flutter_widget_explore/widgets/pageview.dart';

class ScrollcontrollerWidget extends StatefulWidget {
  ScrollcontrollerWidget({super.key});

  @override
  State<ScrollcontrollerWidget> createState() => _ScrollcontrollerWidgetState();
}

class _ScrollcontrollerWidgetState extends State<ScrollcontrollerWidget> {
  final ScrollController _controller = ScrollController();

  GlobalKey key = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      // print("Hello");
        if(_controller.offset == _controller.position.maxScrollExtent){
          print("Reach end");
        }
        if(_controller.offset == _controller.position.minScrollExtent){
          print("Reach Start possition");
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},
        label: Row(children: [
        IconButton(onPressed: (){
          _controller.animateTo(0.0, duration: Duration(seconds: 2), curve: Curves.easeInOutCirc);
        }, icon: Icon(Icons.arrow_upward)),

          IconButton(onPressed: ()async{

            // _controller.jumpTo( 30*50 );

            await Scrollable.ensureVisible(key.currentContext!);

            // final context = key.currentContext!;
            // await Scrollable.ensureVisible(context);
            // _controller.animateTo(y, duration: Duration(seconds: 2), curve: Curves.easeInOutCirc);
          }, icon: Icon(Icons.arrow_upward)),
        IconButton(onPressed: (){

          _controller.position.animateTo(_controller.position.maxScrollExtent, duration:Duration(seconds: 3), curve: Curves.easeOut);

          }, icon: Icon(Icons.arrow_downward))
      ],),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height-30,
              width: MediaQuery.of(context).size.width,
             child: ListView(
               controller: _controller,
               children: List.generate(50, (int index)=> (index==30)?GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return MyPageView();
                   }));
                 },
                 child: Container(
                   key: key,
                   alignment: Alignment.center,
                   margin: EdgeInsets.only(bottom: 10),
                   height: 50,
                   // width: 50,
                   color: Colors.green,
                   child: Text("$index"),
                 ),
               ):Container(
                 alignment: Alignment.center,
                 margin: EdgeInsets.only(bottom: 10),
                 height: 50,
                 // width: 50,
                 color: Colors.blueAccent,
                 child: Text("$index"),
               ),
             ),
              // child: ListView.builder(
              //   // physics: NeverScrollableScrollPhysics(),
              //   controller: _controller,
              //   shrinkWrap: true,
              //     itemCount:  50,
              //     itemBuilder: (BuildContext context,int index){
              //         return  Column(
              //           children: [
              //             (index==30)?Container(
              //               key: key,
              //           alignment: Alignment.center,
              //           margin: EdgeInsets.only(bottom: 10),
              //           height: 50,
              //           // width: 50,
              //           color: Colors.green,
              //           child: Text("$index"),
              //         ):Container(
              //               alignment: Alignment.center,
              //               margin: EdgeInsets.only(bottom: 10),
              //               height: 50,
              //               // width: 50,
              //               color: Colors.blueAccent,
              //               child: Text("$index"),
              //             ),
              //           ],
              //         );
              //    },
              // ),
            ),
            )],
        ),
      ),
    );
  }
}
