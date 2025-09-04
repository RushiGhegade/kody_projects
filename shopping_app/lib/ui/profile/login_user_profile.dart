
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/controller/homecontroller/select_category.dart';
import 'package:shopping_app/framework/controller/profilecontrller/get_user_data_controller.dart';
import 'package:shopping_app/framework/repository/orderrepository/model/user_dummy_info.dart';
import 'package:shopping_app/framework/utils/local_database_sharedpreferance.dart';
import 'package:shopping_app/ui/auth/helper/action_button.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Icon.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';

import '../home/helper/custom_appbar.dart';
import '../home/mobile/helper/navigation_bar.dart';
import '../utils/widgets/custom_text_widget.dart';

class LoginUserProfile extends ConsumerStatefulWidget {

  final String id;

  const LoginUserProfile({super.key,required this.id});

  @override
  ConsumerState<LoginUserProfile> createState() => _LoginUserProfileState();
}

class _LoginUserProfileState extends ConsumerState<LoginUserProfile> {


  List<UserDummyInfo> userDummy = [
    UserDummyInfo(name: "My Profile", iconData: Icons.person),
    UserDummyInfo(name: "My Address", iconData: Icons.location_on_rounded),
    UserDummyInfo(name: "My Orders", iconData: Icons.shopping_bag),
    UserDummyInfo(name: "My Cart", iconData: Icons.shopping_cart),
    UserDummyInfo(name: "Setting", iconData: Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(getUserData(widget.id));
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.spMin),
        child: CustomAppbar(
          title: "Profile Screen",
          isWeb: false,
          isShowTextField: false,
        ),
      ),

      body: userInfo.when(data: (data){

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Center(
                  child: Column(
                    spacing: 10.spMin,
                    children: [
                      CustomSizeBox.height5,
                      Container(
                        height: 150.spMin,
                        width: 150.spMin,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        alignment: Alignment.center,
                        clipBehavior: Clip.antiAlias,
            
                        child: Image.memory(data.uint8list,fit: BoxFit.cover),
                      ),
            
                      CustomTextWidget(text: data.userName,fontWeight: FontWeight.w600,fontSize: 21.spMin,),
                    ],
                  ),
                ),
            
            
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: userDummy.length,
                  itemBuilder: (context,index){
                    
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 3.h),
                      child: ListTile(leading: CustomIcon(iconData: userDummy[index].iconData),
                      title: CustomTextWidget(text: userDummy[index].name),
                      ),
                    );
                    
                  }),
            
            
              ActionButton(text: "Log Out", callback: (){
                ref.read(getUserCredential);
                ref.read(selectedIndexProvider.notifier).state = 0;
                LocalDataBaseSharedPref.storeLoginInfo(false);
                CustomNavigation.loginScreen(context);

            
              }),
              // CustomSizeBox.height10,
              ],
            ),
          ),
        );

      }, error: (obj,st){
        return CustomTextWidget(text:"${st}" );
      }, loading: (){
        return Center(child: CircularProgressIndicator(),);
      }),
        bottomNavigationBar: CustomBottomNavigationBar()
    );
  }
}
