

import 'package:advancedshoppingapp/ui/util/theme/app_color.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 10,
        backgroundColor: AppColor.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedFontSize: 13,
        selectedItemColor: AppColor.blueAccent,
        unselectedItemColor: AppColor.black,
        onTap: (index){
          selectedIndex = index;
          setState(() {
          });
        },
        items: [
          BottomNavigationBarItem(icon: selected(Icons.home_outlined,Icons.home,0),label: "Home"),
          BottomNavigationBarItem(icon:selected(Icons.category_outlined,Icons.category,1) ,label: "Category"),
          BottomNavigationBarItem(icon:selected(Icons.favorite_border_outlined,Icons.favorite,2) ,label: "Favorite"),
          BottomNavigationBarItem(icon:selected(Icons.perm_identity,Icons.person,3) ,label: "Profile"),
        ],
    );
  }
  Widget selected(IconData icon,IconData icon1,int positionIndex ){
    return (positionIndex == selectedIndex) ?Container(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.blue,width: 4)
            )
        ),
        child: CustomIcon(iconData: icon1,color:AppColor.blueAccent)):Container(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),child: CustomIcon(iconData: icon,color: AppColor.black));
  }
}
