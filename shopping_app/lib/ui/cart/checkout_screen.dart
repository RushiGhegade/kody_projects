
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/ui/home/mobile/helper/navigation_bar.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_snackar.dart';

import '../../framework/controller/homecontroller/home_controller.dart';
import '../../framework/repository/homerepository/model/productmodel.dart';
import '../home/helper/custom_appbar.dart';
import '../utils/theme/app_color.dart';
import '../utils/widgets/custom_button.dart';
import '../utils/widgets/custom_text_widget.dart';
import 'helper/show_cart.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {

  List<ProductDetails>? cart;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cart = ref
        .read(productListProvider)
        .filterProduct;
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.spMin),
        child: CustomAppbar(
          title: "Checkout Screen",
          isWeb: false,
          isShowTextField: false,
        ),
      ),
      body: (cart!.isEmpty) ? SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Center(child: CustomTextWidget(text: "No Items",)),
      ) : SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height - 190,
            child: Stack(
              children: [
                ShowCart(flag: true, myOrders: cart!, callback: () {},),

                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primaryColor,
                    ),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 20,
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        CustomTextWidget(text: 'Amount :  $amount', color: AppColor.black,),
                        Spacer(),

                        CustomButton(
                          color: AppColor.secondaryColor,
                          title: "Buy", callback: () {

                          CustomSnackBar.showMySnackBar(
                              context, "Order Placed Successfully",
                              AppColor.successColor);
                          CustomNavigation.confirmationScreenNavigation(context);
                        }, size: Size(150, 30),),


                        SizedBox(width: 5,),
                      ],
                    ),
                    // child:
                  ),


                )
              ],
            ),
          )
      ),
      bottomNavigationBar: CustomBottomNavigationBar(

      ),
    );
  }
}
