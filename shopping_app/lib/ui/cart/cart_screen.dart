
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/ui/home/mobile/helper/navigation_bar.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../home/helper/custom_appbar.dart';
import '../utils/widgets/custom_button.dart';
import 'helper/show_cart.dart';

class AddToCart extends ConsumerStatefulWidget {
  const AddToCart({super.key});

  @override
  ConsumerState<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends ConsumerState<AddToCart> {


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
  void findTotalAmount(){
    amount=0;
    for(int i=0;i<cart!.length;i++){

      amount += cart![i].productPrice*cart![i].quantity;
    }
  }

  @override
  Widget build(BuildContext context) {

    final getcredentail = ref.watch(getUserCredential);

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.spMin),
        child: CustomAppbar(
          title: "Cart Screen",
          isWeb: false,
          isShowTextField: false,
        ),
      ),
      body: (cart!.isEmpty)? SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CustomTextWidget(text: "No Add to cart",)),
      ) :SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child:getcredentail.when(data: (data){
            return SizedBox(
              height: MediaQuery.of(context).size.height-190,
              child: Stack(
                children: [
                  ShowCart(flag: false,myOrders: cart!,callback: (){
                  },),

                  Positioned(
                      bottom: 0,
                      left: 0,
                      child:Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.secondaryColor,
                        ),
                        width: MediaQuery.of(context).size.width-20,
                        child: CustomButton(
                          color: AppColor.secondaryColor,
                          title: "Check out", callback: (){
                            if(data.isLogin){
                              ref.read(productListProvider.notifier).getAddToCartList();
                              CustomNavigation.checkoutScreen(context);
                            }else{
                              CustomNavigation.loginScreen(context);
                            }

                        },size: Size(150, 30),),
                      )
                  ),


                ],
              ),
            );

          }, error: (obj,st){
            return CustomTextWidget(text:"${st}" );
          }, loading: (){
            return Center(child: CircularProgressIndicator(),);
          }),

      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
