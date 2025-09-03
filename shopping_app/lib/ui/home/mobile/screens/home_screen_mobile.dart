
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';

import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';

import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../utils/widgets/custom_Icon.dart';
import '../../helper/custom_appbar.dart';

import '../helper/navigation_bar.dart';
class HomeScreenMobile extends ConsumerStatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  ConsumerState<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends ConsumerState<HomeScreenMobile> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    final getProduct = ref.watch(productListProvider);
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(130),
          child:CustomAppbar(title: "Dashboard",isShowTextField: true,isWeb: false,)
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
                      tag:productDetails.productName,
                      child: SizedBox(
                          // height: 100,width: 100,
                          child: Image.network(productDetails.productImage[0],fit: BoxFit.cover,)),
                    ),
                    title: CustomTextWidget(text: productDetails.productName,fontWeight: FontWeight.w600,),
                    subtitle:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5.spMin,
                      children: [
                        CustomTextWidget(text: productDetails.productDis ?? "",maxLines: 1,color: AppColor.textColor.withOpacity(0.6),),
                        Row(
                          children: [
                            CustomIcon(
                              iconData: Icons.currency_rupee,

                              size: 16.spMin,
                            ),
                            CustomTextWidget(
                              text:"${productDetails.productPrice}",

                              fontSize: 16.spMin,
                              fontWeight: FontWeight.w600,
                            ),
                            // Spacer(),
                            SizedBox(width: 5.spMin,),
                            CustomIcon(
                              iconData: Icons.currency_rupee,
                              color: AppColor.secondaryColor,
                              size: 14.spMin,
                            ),
                            CustomTextWidget(
                              text: "1200",

                              textDecoration: TextDecoration.lineThrough,
                              fontSize: 14.spMin,
                            ),
                            // Spacer(flex: 5),
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

