

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pageController.addListener((){
    //   print("Call the ");
    //   if(pageController.page==2){
    //     print("go to home");
    //     pageController.initialPage;
    //   }
    // });

  }


  int currentPageIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text("Page Vew "),
        actions: [
          IconButton(onPressed: (){
            
            pageController.previousPage(duration: Duration(milliseconds:300), curve:Curves.bounceInOut);

          }, icon: Icon(Icons.arrow_back)),
          IconButton(onPressed: (){
            pageController.nextPage(duration: Duration(milliseconds: 300), curve:Curves.bounceInOut);
          }, icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: Padding(
        padding:EdgeInsets.all(10),
        child: Column(
          children: [
              // Expanded(
              //   child: PageView(
              //     controller: pageController,
              //     pageSnapping: true,
              //     scrollDirection: Axis.vertical,
              //     physics: BouncingScrollPhysics(
              //
              //     ),
              //     onPageChanged: (index){
              //       currentPageIndex = index;
              //       print(currentPageIndex);
              //       setState(() {});
              //     },
              //     children: [
              //       Container(
              //         height: 500,
              //         width: MediaQuery.of(context).size.width,
              //         color: Colors.red,
              //         alignment: Alignment.center,
              //         child: Text("1"),
              //       ),
              //       Container(
              //         height: 500,
              //         width: MediaQuery.of(context).size.width,
              //         color: Colors.yellow,
              //         alignment: Alignment.center,
              //         child: Text("2"),
              //       ),
              //       Container(
              //         height: 500,
              //         width: MediaQuery.of(context).size.width,
              //         color: Colors.pink,
              //         alignment: Alignment.center,
              //         child: Text("3"),
              //       ),
              //     ],
              //   ),
              //
              // ),
              //

              SizedBox(
                height: 400,
                child: PageView.builder(
                    itemCount: 10,

                    controller: pageController,
                    itemBuilder:(BuildContext context,int index){
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue[index%9*100],
                      child: Text("$index"),
                    );
                }),
              )


          ],
        ),
      ),
    );
  }
}
