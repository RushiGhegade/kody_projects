

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/custom_Icon.dart';
import '../../../utils/widgets/custom_text_widget.dart';


// these screen shoe the grid on web home screen
class ShowProductGridview extends ConsumerStatefulWidget{
  const ShowProductGridview({super.key});

  @override
  ConsumerState<ShowProductGridview> createState() => _ShowProductGridviewState();
}

class _ShowProductGridviewState extends ConsumerState<ShowProductGridview> {
  @override
  Widget build(BuildContext context) {

    final getData = ref.watch(productListProvider);

    return Expanded(
      child: GridView.builder(
        itemCount: getData.filterProduct.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4
          ,mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h,
            mainAxisExtent: 180.spMin
          ),

          itemBuilder: (context,index){
            ProductDetails productDetails = getData.filterProduct[index];
        return GestureDetector(
          onTap: (){
            CustomNavigation.productDetailScreenNavigation(context,false,productDetails);
          },
          child: Container(
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:AppColor.white.withOpacity(0.2),
                  blurRadius: 5.r,
                ),
              ],
              borderRadius: BorderRadius.circular(10.r),
              color: AppColor.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Center(
              child: Hero(
                tag: productDetails.productName,
                child: SizedBox(
                height: 90.spMin,
                width: 90.spMin,
                child: Image.network(productDetails.productImage[0],fit: BoxFit.cover,)),
              ),
            ),


                CustomTextWidget(text: productDetails.productName,fontWeight: FontWeight.w600,fontSize: 14.spMin,),
                CustomTextWidget(text: productDetails.productDis!,maxLines: 1,fontSize: 13.spMin,color: AppColor.textColor.withOpacity(0.6),),
                Row(
                  children: [
                    CustomIcon(
                      iconData: Icons.currency_rupee,

                      size: 12.spMin,
                    ),
                    CustomTextWidget(
                      text:"${productDetails.productPrice}",

                      fontSize: 12.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                    // Spacer(),
                    SizedBox(width: 2.spMin,),
                    CustomIcon(
                      iconData: Icons.currency_rupee,
                      color: AppColor.secondaryColor,
                      size: 12.spMin,
                    ),
                    CustomTextWidget(
                      text: "1200",

                      textDecoration: TextDecoration.lineThrough,
                      fontSize: 12.spMin,
                    ),
                    // Spacer(flex: 5),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
