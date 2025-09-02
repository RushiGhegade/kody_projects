
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';
import 'package:shopping_app/framework/utils/local_database_sharedpreferance.dart';
import 'package:shopping_app/ui/auth/mobile/screens/login_screen_mobile.dart';
import 'package:shopping_app/ui/auth/web/screens/login_screen_web.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../helper/check_screen_layout.dart';
import '../../../utils/widgets/custom_Icon.dart';
import '../../helper/custom_appbar.dart';
import '../../web/screens/home_screen_web.dart';
import '../helper/navigation_bar.dart';
class HomeScreenMobile extends ConsumerStatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  ConsumerState<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends ConsumerState<HomeScreenMobile> {



  @override
  Widget build(BuildContext context) {

    final getProduct = ref.watch(productListProvider);
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(130),
          child:CustomAppbar(isShowTextField: true,)
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: getProduct.filterProduct.length,
            itemBuilder:(BuildContext context,int index){
              ProductDetails productDetails = getProduct.filterProduct[index];

              return GestureDetector(
                onTap: (){
                  CustomNavigation.productDetailScreenNavigation(context, productDetails);
                },
                child: Container(

                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(136, 136, 136, 1).withOpacity(0.15),
                            blurRadius: 5
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white

                  ),
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.spMin,vertical: 10.spMin),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading:  Hero(
                      tag:"one$index",
                      child: SizedBox(
                          // height: 100,width: 100,
                          child: Image.network(productDetails.productImage[0],fit: BoxFit.cover,)),
                    ),
                    title: CustomTextWidget(text: productDetails.productName,fontWeight: FontWeight.w600,),
                    subtitle:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5.spMin,
                      children: [
                        CustomTextWidget(text: productDetails.productDis!,maxLines: 2,color: AppColor.textColor.withOpacity(0.6),),
                        Row(
                          children: [
                            CustomIcon(iconData:Icons.currency_rupee,color: AppColor.black,size: 15,),
                            CustomTextWidget(text: "${productDetails.productPrice}",color: AppColor.black,),
                         CustomSizeBox.width10,
                            CustomIcon(iconData:Icons.currency_rupee,color: AppColor.black,size: 12,),
                            CustomTextWidget(text: "1200",color: AppColor.black,textDecoration: TextDecoration.lineThrough,fontSize: 12,)
                            ,Spacer(flex: 1,),
                          ],
                        ),
                      ],
                    ),
                    trailing: CustomIcon(iconData: Icons.shopping_cart_outlined),

                  ),

                ),
              );
            }

        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

