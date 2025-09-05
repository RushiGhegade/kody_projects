import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/check_login_status.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/controller/ordercontroller/select_filter_controller.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/framework/repository/orderrepository/ui_order_filter.dart';
import 'package:shopping_app/ui/home/helper/custom_appbar.dart';
import 'package:shopping_app/ui/home/web/helper/showdrawer.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Icon.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

class OrderScreenWeb extends ConsumerStatefulWidget {
  const OrderScreenWeb({super.key});

  @override
  ConsumerState<OrderScreenWeb> createState() => _OrderScreenWebState();
}

class _OrderScreenWebState extends ConsumerState<OrderScreenWeb> {
  @override
  Widget build(BuildContext context) {
    final uiFilter = ref.watch(selectUiFilterProvider);
    List<ProductDetails>? orders = ref.watch(productListProvider).filterProduct;

    final checkStatus = ref.watch(checkLoginStatus);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.spMin),
        child: CustomAppbar(
          title: "Order Screen",
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
            (checkStatus)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        SizedBox(
                          height: 40,
                          width: MediaQuery.sizeOf(context).width - 350,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: UiOrderFilter.values.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  ref
                                      .read(productListProvider.notifier)
                                      .addFilterOrder(
                                        UiOrderFilter.values[index],
                                      );
                                  ref
                                          .read(selectUiFilterProvider.notifier)
                                          .state =
                                      UiOrderFilter.values[index];
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 15,
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color:
                                        uiFilter.name ==
                                            UiOrderFilter.values[index].name
                                        ? AppColor.primaryColor.withOpacity(0.4)
                                        : null,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColor.black),
                                  ),
                                  child: CustomTextWidget(
                                    text: UiOrderFilter.values[index].name,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        (orders.isEmpty)
                            ? Expanded(
                                child: Center(
                                  child: CustomTextWidget(text: "No Items"),
                                ),
                              )
                            : SizedBox(
                              // height: MediaQuery.sizeOf(context).height,
                              height: MediaQuery.of(context).size.height - 150,
                            width: MediaQuery.sizeOf(context).width - 350,
                              child: ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: orders.length,
                                itemBuilder: (BuildContext context, int index) {
                                  ProductDetails productDetails =
                                      orders[index];
                                  return GestureDetector(
                                    onTap: () {
                                      print(
                                        productDetails.orderFilter.name,
                                      );
                                      CustomNavigation.productDetailScreenNavigation(
                                        context,
                                        true,
                                        productDetails,
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      height: 120,
                                      child: Card(
                                        color: AppColor.white,
                                        shadowColor: AppColor.black
                                            .withOpacity(0.9),
                                        child: ListTile(
                                          minLeadingWidth: 50,
                                          contentPadding: EdgeInsets.zero,
                                          leading: Container(
                                            color: Colors.red,
                                            child: Image.network(
                                              productDetails
                                                  .productImage[0],
                                              fit: BoxFit.cover,
                                              loadingBuilder:
                                                  (
                                                    BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                    loadingProgress,
                                                  ) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  },
                                            ),
                                          ),
                                          title: CustomTextWidget(
                                            text:
                                                productDetails.productName,
                                            color: AppColor.black,
                                            maxLines: 1,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          // dense: ,
                                          isThreeLine: true,

                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            spacing: 3,
                                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomIcon(
                                                    iconData: Icons
                                                        .currency_rupee,
                                                    color: AppColor.black,
                                                    size: 15,
                                                  ),
                                                  CustomTextWidget(
                                                    text:
                                                        "${productDetails.productPrice}",
                                                    // text: "${findProductPrice(productDetails.productPrice,productDetails.orderQuantity)}",
                                                    color: AppColor.black,
                                                  ),
                                                ],
                                              ),
                                              CustomTextWidget(
                                                text:
                                                    " QNT : ${productDetails.orderQuantity}",
                                              ),

                                              Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        10,
                                                      ),
                                                  color:
                                                      productDetails
                                                              .orderFilter ==
                                                          OrderFilter
                                                              .Delivered
                                                      ? AppColor
                                                            .successColor
                                                      : null,
                                                  border: Border.all(
                                                    color: AppColor.black,
                                                  ),
                                                ),
                                                alignment: Alignment.center,
                                                child: CustomTextWidget(
                                                  text: orders[index]
                                                      .orderFilter
                                                      .name,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10.h,
                      children: [
                        CustomTextWidget(text: "You Must have An Account"),

                        ElevatedButton(
                          onPressed: () {
                            ref.read(checkLoginStatus.notifier).state = false;
                            CustomNavigation.loginScreen(context);
                          },

                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100, 40),
                            backgroundColor: AppColor.secondaryColor,
                          ),
                          child: CustomTextWidget(
                            text: "Login",
                            color: AppColor.black,
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

  findProductPrice(double productPrice, int orderQuantity) {
    return productPrice * orderQuantity;
  }
}
