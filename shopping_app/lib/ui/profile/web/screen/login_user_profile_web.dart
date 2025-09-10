import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/check_login_status.dart';
import 'package:shopping_app/framework/controller/homecontroller/select_category.dart';
import 'package:shopping_app/framework/controller/profilecontrller/get_user_data_controller.dart';
import 'package:shopping_app/framework/repository/orderrepository/model/user_dummy_info.dart';
import 'package:shopping_app/framework/utils/local_database_sharedpreferance.dart';
import 'package:shopping_app/ui/home/helper/custom_appbar.dart';
import 'package:shopping_app/ui/home/web/helper/showdrawer.dart';
import 'package:shopping_app/ui/profile/web/helper/action_button_web.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

/// it show the login user on profile
class LoginUserProfileWeb extends ConsumerStatefulWidget {
  final String id;

  const LoginUserProfileWeb({super.key, required this.id});

  @override
  ConsumerState<LoginUserProfileWeb> createState() =>
      _LoginUserProfileWebState();
}

class _LoginUserProfileWebState extends ConsumerState<LoginUserProfileWeb> {
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

      body: userInfo.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                MyDrawer(),
                Spacer(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10.h,
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

                              child: Image.memory(
                                data.uint8list,
                                fit: BoxFit.fill,
                              ),
                            ),

                            CustomTextWidget(
                              text: data.userName,
                              fontWeight: FontWeight.w600,
                              fontSize: 21.spMin,
                            ),
                          ],
                        ),
                      ),

                      // Expanded(
                      //   child: ListView.builder(
                      //     physics: NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: userDummy.length,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         margin: EdgeInsets.symmetric(vertical: 3.h),
                      //         child: ListTile(
                      //           leading: CustomIcon(
                      //             iconData: userDummy[index].iconData,
                      //           ),
                      //           title: CustomTextWidget(
                      //             text: userDummy[index].name,
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      ActionButtonWeb(
                        text: "Log Out",
                        callback: () async {
                          ref.read(selectedIndexProvider.notifier).state = 0;
                          ref.read(checkLoginStatus.notifier).state = false;
                          await LocalDataBaseSharedPref.storeLoginInfo(false,data.userName);

                          CustomNavigation.loginScreen(context);
                        },
                      ),
                      // CustomSizeBox.height10,
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          );
        },
        error: (obj, st) {
          return CustomTextWidget(text: "$st");
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
