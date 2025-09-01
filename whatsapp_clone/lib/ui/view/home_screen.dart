import 'package:flutter/material.dart';

import 'package:whatsapp_clone/main.dart';

import 'package:whatsapp_clone/ui/widgets/myBottomNavigationBar.dart';

import '../../framework/getassets/getdata.dart';
import '../widgets/custom_floatingactionbutton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Data.showAppBar[currentPageIndex].getAppBar(),
      body: PageView.builder(
        controller: pageController,
        itemCount: Data.screens.length,
        pageSnapping: true,
        onPageChanged: (index) {
          currentPageIndex = index;
          Future.delayed(Duration(microseconds: 1500), () {
            setState(() {});
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return Data.screens[index];
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),

      floatingActionButton: (currentPageIndex == 2)
          ? Hero(tag: 'aa',child: Container())
          : CustomFloatingActionButton(
        callback: (){
          print("call back Home Screen");
          setState(() {

          });
        },
              showMetaIcon: Data.buttonInfo[currentPageIndex].isShowIcon,
              iconData: Data.buttonInfo[currentPageIndex].icon,
              widget: Data.buttonInfo[currentPageIndex].widget,
              showMetaIcon1: Data.buttonInfo[currentPageIndex].isShowIcon1,
            ),
    );
  }
}
