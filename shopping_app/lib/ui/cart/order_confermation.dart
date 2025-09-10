
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../framework/controller/ordercontroller/select_filter_controller.dart';
import '../../framework/repository/orderrepository/ui_order_filter.dart';

/// these is order cofirmation screen when order get these screen show
class OrderConfirmation extends ConsumerStatefulWidget {
  const OrderConfirmation({super.key});

  @override
  ConsumerState<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends ConsumerState<OrderConfirmation> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3),(){
      ref.read(productListProvider.notifier).getOrderList();
      ref.read(selectUiFilterProvider.notifier).state = UiOrderFilter.All;
      CustomNavigation.orderScreenNavigation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.h,
            children: [
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl0h6zxIxTFQK8KqHUmKYzzB0oli7kWGXycw&s"),
              CustomTextWidget(text: "Your Order is Confirmed",fontSize: 25.spMin,fontWeight: FontWeight.w600),
              CustomTextWidget(text: "Thank You for shopping with us \n Your Order will reach soon",maxLines: 3,textAlign: TextAlign.center,fontSize: 21.spMin,fontWeight: FontWeight.w400),
            ],
          ),
        ),
      ),
    );
  }
}
