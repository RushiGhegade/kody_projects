import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';
import 'package:shopping_app/ui/cart/helper/show_cart.dart';
import 'package:shopping_app/ui/home/helper/custom_appbar.dart';
import 'package:shopping_app/ui/home/web/helper/showdrawer.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_button.dart';
import 'package:shopping_app/ui/utils/widgets/custom_snackar.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

class CheckoutScreenWeb extends ConsumerStatefulWidget {
  const CheckoutScreenWeb({super.key});

  @override
  ConsumerState<CheckoutScreenWeb> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreenWeb> {
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

  @override
  Widget build(BuildContext context) {
    final val = ref.watch(getUserCredential);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.spMin),
        child: CustomAppbar(
          title: "Checkout Screen",
          isWeb: false,
          isShowTextField: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
        child: Row(
          children: [
            MyDrawer(),
            Spacer(),
            (cart!.isEmpty)
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: CustomTextWidget(text: "No Items")),
                  )
                : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width-250,

                child: Stack(
                        children: [
                          ShowCart(
                            flag: true,
                            myOrders: cart!,
                            callback: () {},
                          ),

                          Positioned(
                            bottom: 0,
                            // left: 0,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.primaryColor,
                              ),
                              width: MediaQuery.of(context).size.width - 250,
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  CustomTextWidget(
                                    text: 'Amount :  $amount',
                                    color: AppColor.black,
                                  ),
                                  Spacer(),
                                  CustomButton(
                                    color: AppColor.secondaryColor,
                                    title: "Buy",
                                    callback: () async {
                                      await LocalDatabaseHive.clearCartAndOrder(
                                        (val.value)!.id,
                                      );

                                      ref
                                          .read(productListProvider.notifier)
                                          .addData();
                                      CustomSnackBar.showMySnackBar(
                                        context,
                                        "Order Placed Successfully",
                                        AppColor.successColor,
                                      );
                                      CustomNavigation.confirmationScreenNavigation(
                                        context,
                                      );
                                    },
                                    size: Size(150, 30),
                                  ),

                                  SizedBox(width: 5),
                                ],
                              ),
                              // child:
                            ),
                          ),
                        ],
                      ),
                    ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
