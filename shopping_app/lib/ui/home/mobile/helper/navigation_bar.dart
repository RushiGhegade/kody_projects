
import 'package:flutter/material.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/custom_Icon.dart';

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
      backgroundColor: AppColor.primaryColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedFontSize: 13,
      selectedItemColor: AppColor.secondaryColor,
      unselectedItemColor: AppColor.black,
      onTap: (index){
        selectedIndex = index;
        setState(() {
        });
      },
      items: [
        BottomNavigationBarItem(icon: selected(Icons.home_outlined,Icons.home,0),label: "Products"),
        BottomNavigationBarItem(icon:selected(Icons.category_outlined,Icons.category,1) ,label: "Order"),
        BottomNavigationBarItem(icon:selected(Icons.perm_identity,Icons.person,2) ,label: "Profile"),
      ],
    );
  }
  Widget selected(IconData icon,IconData icon1,int positionIndex ){
    return (positionIndex == selectedIndex) ?Container(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: Colors.purple,width: 4)
            )
        ),
        child: CustomIcon(iconData: icon1,color:AppColor.secondaryColor)):Container(padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),child: CustomIcon(iconData: icon,color: AppColor.black));
  }
}