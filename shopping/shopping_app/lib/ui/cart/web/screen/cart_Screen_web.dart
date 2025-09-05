import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/controller/auth_controller/check_login_status.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/ui/cart/helper/show_cart.dart';
import 'package:shopping_app/ui/home/helper/custom_appbar.dart';
import 'package:shopping_app/ui/home/web/helper/showdrawer.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_button.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

class AddToCartWeb extends ConsumerStatefulWidget {
  const AddToCartWeb({super.key});

  @override
  ConsumerState<AddToCartWeb> createState() => _AddToCartWebState();
}

class _AddToCartWebState extends ConsumerState<AddToCartWeb> {
  List<ProductDetails>? cart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cart = ref.read(productListProvider).filterProduct;
    findTotalAmount();
  }

  double amount = 0;
  //
  void findTotalAmount() {
    amount = 0;
    for (int i = 0; i < cart!.length; i++) {
      amount += cart![i].productPrice * cart![i].quantity;
    }
  }

  void showMyDailog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomTextWidget(text: "You Must have An Account"),
          content: CustomTextWidget(
            text: "Become a Member and Enjoy the Online shopping",
          ),
          actions: [
            CustomButton(
              title: "No",
              callback: () {
                Navigator.pop(context);
              },
              color: AppColor.secondaryColor,
            ),
            CustomButton(
              title: "Yes",
              color: AppColor.secondaryColor,
              callback: () {
                CustomNavigation.loginScreen(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final getcredentail = ref.watch(getUserCredential);

    final checkStatus = ref.watch(checkLoginStatus);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.spMin),
        child: CustomAppbar(
          title: "Cart Screen",
          isWeb: false,
          isShowTextField: false,
        ),
      ),
      body:  getcredentail.when(
              data: (data) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      MyDrawer(),

                      (cart!.isEmpty)
                          ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width-200,
                        child: Center(child: CustomTextWidget(text: "No Add to cart")),
                      )
                          :  Expanded(
                        child: SizedBox(
                          // height: MediaQuery.of(context).size.height - 190,
                          height: MediaQuery.of(context).size.height - 150,
                          child: Stack(
                            children: [
                              ShowCart(
                                flag: false,
                                myOrders: cart!,
                                callback: () {},
                              ),

                              Positioned(
                                bottom: 10,
                                left: 0,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.secondaryColor,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: CustomButton(
                                    color: AppColor.secondaryColor,
                                    title: "Check out",
                                    callback: () {
                                      if (checkStatus) {
                                        ref
                                            .read(productListProvider.notifier)
                                            .getAddToCartList();
                                        CustomNavigation.checkoutScreen(
                                          context,
                                        );
                                      } else {
                                        showMyDailog();
                                      }

                                      if (data.isLogin) {
                                      } else {}
                                    },
                                    size: Size(150, 30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}


// Expanded(
//                   child: SizedBox(
//                     // height: MediaQuery.of(context).size.height - 190,
//                     child: Stack(
//                       children: [
//                         ShowCart(flag: false, myOrders: cart!, callback: () {}),

//                         Positioned(
//                           bottom: 10,
//                           left: 0,
//                           child: Container(
//                             height: 50,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: AppColor.secondaryColor,
//                             ),
//                             width: MediaQuery.of(context).size.width - 20,
//                             child: CustomButton(
//                               color: AppColor.secondaryColor,
//                               title: "Check out",
//                               callback: () {
//                                 if (checkStatus) {
//                                   ref
//                                       .read(productListProvider.notifier)
//                                       .getAddToCartList();
//                                   CustomNavigation.checkoutScreen(context);
//                                 } else {
//                                   showMyDailog();
//                                 }

//                                 if (data.isLogin) {
//                                 } else {}
//                               },
//                               size: Size(150, 30),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
              
