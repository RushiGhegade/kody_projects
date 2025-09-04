
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_Category.dart';

import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/repository/homerepository/enums/categories.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/ui/home/mobile/helper/price_show.dart';

import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';

import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../utils/widgets/custom_Icon.dart';
import '../../helper/custom_appbar.dart';

import '../helper/mybottom_sheet_filter.dart';
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

  void myBottomSheet() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return MyBottomSheetContent(
          callback: () {
            Navigator.pop(context, true);
          },
        );
      },
    );

    if (result != null) {
      print("Changes");
    } else {
      print("No Changes");
    }
  }


  @override
  Widget build(BuildContext context) {

    final selectFilterCategory = ref.watch(homeSelectCategoryProvider);

    final getProduct = ref.watch(productListProvider);
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(130),
          child:CustomAppbar(title: "Dashboard",isShowTextField: true,isWeb: false,)
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [


            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    myBottomSheet();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
                    decoration: BoxDecoration(
                      color: (!selectFilterCategory.contains(Categories.all))
                          ? AppColor.primaryColor.withOpacity(0.5)
                          : null,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:AppColor.black,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        CustomTextWidget(
                          text:
                          "Categories ${(!selectFilterCategory.contains( Categories.all)) ? selectFilterCategory.length : ''}",
                          fontSize: 13.5,
                          color:AppColor.black,
                        ),
                        CustomIcon(
                          iconData: Icons.keyboard_arrow_down,
                          color:AppColor.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                ),


                
                SizedBox(
                  height: 50,
                  width: MediaQuery.sizeOf(context).width*0.54,
                  child:PriceShow()
                ),
              ],
            ),




            Expanded(
              child: (getProduct.filterProduct.isEmpty)? Expanded(child: Center(child: CustomTextWidget(text: "No Item Found"),)) : ListView.builder(
                shrinkWrap: true,
                  itemCount: getProduct.filterProduct.length,
                  itemBuilder:(BuildContext context,int index){
                    ProductDetails productDetails = getProduct.filterProduct[index];

                    return GestureDetector(
                      onTap: (){
                        CustomNavigation.productDetailScreenNavigation(context, false,productDetails);
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
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

