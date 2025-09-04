
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/controller/homecontroller/select_category.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';

import '../../../../framework/utils/local_database_hive.dart';
import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/custom_Icon.dart';
import '../../../utils/widgets/custom_text_widget.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends ConsumerState<CustomBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    final getcredentail = ref.watch(getUserCredential);
    return getcredentail.when(data: (data){
      return BottomNavigationBar(
        elevation: 10,
        backgroundColor: AppColor.primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedFontSize: 13,
        selectedItemColor: AppColor.secondaryColor,
        unselectedItemColor: AppColor.black,
        onTap: (index){
          ref.read(selectedIndexProvider.notifier).state = index;
          if(index==0){
            ref.read(productListProvider.notifier).fetchFilterList();
            CustomNavigation.homeScreen(context);
          }else if(index==1){
            // LocalDatabaseHive.clearCartAndOrder((val.value)!.id);
            if(data.isLogin){
              ref.read(productListProvider.notifier).getOrderList();
              CustomNavigation.orderScreenNavigation(context);
            }else{
              CustomNavigation.loginScreen(context);

            }

            // CustomNavigation.
          }else{
            CustomNavigation.profileScreenNavigation(context);
          }
        },
        items: [
          BottomNavigationBarItem(icon: selected(Icons.list_alt,Icons.border_all,0,selectedIndex),label: "Products"),
          BottomNavigationBarItem(icon:selected(Icons.shopping_cart_outlined,Icons.shopping_cart,1,selectedIndex) ,label: "Order"),
          BottomNavigationBarItem(icon:selected(Icons.perm_identity,Icons.person,2,selectedIndex) ,label: "Profile"),
        ],
      );
    },  error: (obj,st){
      return CustomTextWidget(text:"${st}" );
    }, loading: (){
      return Center(child: CircularProgressIndicator(),);
    });
  }
  Widget selected(IconData icon,IconData icon1,int positionIndex ,int selectedIndex){

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