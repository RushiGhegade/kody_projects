import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/getassets/getColors.dart';
import 'package:whatsapp_clone/main.dart';

import '../../framework/getassets/images.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentPageIndex,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Colors.black),
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      onTap: (int index1) {
        currentPageIndex = index1;
        pageController.jumpToPage(currentPageIndex);
        // pageController.animateTo(5, duration: Duration(milliseconds: 800), curve: Curves.easeInOutCirc);
        print(currentPageIndex);
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          icon: getItem(
            0,
            Image.asset(
              GetImages.chats,
              height: 27,
              width: 27,
              color: GetColors.black,
            ),
          ),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: getItem(
            1,
            Image.asset(
              GetImages.updates,
              height: 25,
              width: 25,
              color: GetColors.black,
            ),
          ),
          label: "Updates",
        ),
        BottomNavigationBarItem(
          icon: getItem(
            2,
            Image.asset(
              (currentPageIndex != 2) ? GetImages.community : GetImages.com,
              height: 28,
              width: 28,
              color: GetColors.black,
            ),
          ),
          label: "Communities",
        ),
        BottomNavigationBarItem(
          icon: getItem(3, Icon(Icons.call_outlined)),
          label: "Calls",
        ),
      ],
    );
  }

  Widget getItem(int itemIndex, Widget icons) {
    return (itemIndex == currentPageIndex)
        ? Container(
            height: 33,
            width: 65,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: GetColors.blurColor,
            ),
            child: icons,
          )
        : icons;
  }
}
