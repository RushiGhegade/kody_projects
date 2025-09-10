import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/auth_controller/auth_controllers.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/repository/auth_repository/model/user_info_model.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/framework/repository/orderrepository/ui_order_filter.dart';
import 'package:shopping_app/framework/utils/local_database_hive.dart';
import 'package:shopping_app/ui/home/helper/custom_appbar.dart';
import 'package:shopping_app/ui/home/web/helper/showdrawer.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Icon.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_button.dart';
import 'package:shopping_app/ui/utils/widgets/custom_sizebox.dart';
import 'package:shopping_app/ui/utils/widgets/custom_snackar.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../../framework/controller/ordercontroller/select_filter_controller.dart';

class Productdetailscreenweb extends ConsumerStatefulWidget {
  final ProductDetails product;
  final isCheckStatus;
  const Productdetailscreenweb({
    super.key,
    required this.isCheckStatus,
    required this.product,
  });

  @override
  ConsumerState<Productdetailscreenweb> createState() =>
      _ProductdetailscreenwebState();
}

class _ProductdetailscreenwebState
    extends ConsumerState<Productdetailscreenweb> {
  ProductDetails? product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
  }

  int selectIndex = 0;
  List<String> list = [
    "Brand",
    "Model Name",
    "Screen Size",
    "Operating System",
    "Color",
  ];

  void showMyDailog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomTextWidget(text: "Confirm Purchase"),
          content: CustomTextWidget(
            text: "Are you sure you want to buy this product?",
          ),
          actions: [
            CustomButton(
              title: "cancel",
              callback: () {
                Navigator.pop(context);
              },
              color: AppColor.secondaryColor,
            ),
            CustomButton(
              title: "Buy",
              color: AppColor.secondaryColor,
              callback: () {
                CustomSnackBar.showMySnackBar(
                  context,
                  "Order placed successfully!",
                  AppColor.successColor,
                );

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  List<OrderFilter> getStatusChangeDetails(ProductDetails productDetail) {
    if (productDetail.orderFilter == OrderFilter.Pending) {
      return [OrderFilter.Pending, OrderFilter.Shipped];
    } else if (productDetail.orderFilter == OrderFilter.Shipped) {
      return [OrderFilter.Shipped, OrderFilter.Delivered];
    }
    return [OrderFilter.Delivered];
  }

  @override
  Widget build(BuildContext context) {
    final getCredential = ref.watch(getUserCredential);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.spMin),
        child: CustomAppbar(
          title: "Product Detail",
          isWeb: false,
          isShowTextField: false,
        ),
      ),
      body: getCredential.when(
        data: (data) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                MyDrawer(),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.h,
                  children: [
                    CustomTextWidget(
                      text: product!.productName,
                      maxLines: 2,
                      fontSize: 19.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomSizeBox.height10,

                    Stack(
                      children: [
                        SizedBox(
                          height: 300.h,
                          width: MediaQuery.sizeOf(context).width -400,
                          child: PageView.builder(
                            itemCount: product!.productImage.length,
                            onPageChanged: (index) {
                              selectIndex = index;
                              setState(() {});
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Hero(
                                tag: widget.product.productName,
                                transitionOnUserGestures: true,
                                child: Image.network(
                                  product!.productImage[index],
                                  fit: BoxFit.fitHeight,
                                  loadingBuilder:
                                      (
                                        BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress,
                                      ) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: AppColor.secondaryColor,
                                          ),
                                        );
                                      },
                                ),
                              );
                            },
                          ),
                        ),
                        if (product!.isOrder)
                          Positioned(
                            left: 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                // height: 20,
                                // width: 40,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.red,
                                ),
                                child: CustomTextWidget(
                                  text: "50%  off",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    // CustomSizeBox.height2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        product!.productImage.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 2,
                          ), // spacing
                          child: Icon(
                            Icons.circle,
                            size: 10.r,
                            color: (selectIndex == index)
                                ? AppColor.secondaryColor
                                : AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    CustomSizeBox.height2,
                    Row(
                      children: [
                        CustomIcon(
                          iconData: Icons.currency_rupee,
                          size: 22.spMin,
                        ),
                        CustomTextWidget(
                          text: "${product!.productPrice}",

                          fontSize: 22.spMin,
                          fontWeight: FontWeight.w600,
                        ),
                        // Spacer(),
                        SizedBox(width: 5.w),
                        CustomIcon(
                          iconData: Icons.currency_rupee,
                          color: AppColor.secondaryColor,
                          size: 15.spMin,
                        ),
                        CustomTextWidget(
                          text: "1200",

                          textDecoration: TextDecoration.lineThrough,
                          fontSize: 15.spMin,
                        ),
                        // Spacer(flex: 5),
                      ],
                    ),

                    CustomTextWidget(
                      text: product!.productDis!,
                      maxLines: 3,
                      fontSize: 3.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    CustomSizeBox.height10,

                    if (widget.isCheckStatus)
                      (getStatusChangeDetails(widget.product).length == 1)
                          ? CustomButton(
                              title: UiOrderFilter.Delivered.name,
                              callback: () {},
                              color: Colors.amber,
                              radius: MediaQuery.sizeOf(context).width * 0.6,
                              size: Size(
                                MediaQuery.sizeOf(context).width -250,
                                50.spMin,
                              ),
                            )
                          : CustomButton(
                              title:
                                  "Change Status :  ${getStatusChangeDetails(widget.product)[0].name} -> ${getStatusChangeDetails(widget.product)[1].name}",
                              callback: () async {
                                await LocalDatabaseHive.changeDeliveryStatus(
                                  getStatusChangeDetails(widget.product)[1],
                                  widget.product.productId,
                                  data.id,
                                );
                                ref.read(selectUiFilterProvider.notifier).state = UiOrderFilter.All;
                                // ref.read(productListProvider.notifier).addData();
                                CustomSnackBar.showMySnackBar(
                                  context,
                                  "Delivery Status Change",
                                  AppColor.successColor,
                                );
                                ref
                                    .read(productListProvider.notifier)
                                    .getOrderList();
                                ref
                                    .read(productListProvider.notifier)
                                    .addFilterOrder(UiOrderFilter.All);
                                CustomNavigation.orderScreenNavigation(context);
                              },
                              color: Colors.amber,
                              radius: MediaQuery.sizeOf(context).width * 0.6,
                              size: Size(
                                MediaQuery.sizeOf(context).width-250,
                                50.spMin,
                              ),
                            ),

                    if (!widget.isCheckStatus)
                      Column(
                        children: [
                          CustomButton(
                            title: "Add to cart",
                            callback: () {
                              ProductDetails p = ProductDetails(
                                productName: product!.productName,
                                productId: product!.productId,
                                category: product!.category,
                                productImage: product!.productImage,
                                productPrice: product!.productPrice,
                                addToCart: true,
                              );

                              if (!product!.addToCart) {
                                ref
                                    .read(productListProvider.notifier)
                                    .addProductTOCart(product!.productId, p);

                                if (data.isLogin) {
                                  LocalDatabaseHive.updateDataAddToCart(
                                    getCredential.value!.id,
                                    product!.productId,
                                    true,
                                  );
                                }

                                CustomSnackBar.showMySnackBar(
                                  context,
                                  "Product added to cart",
                                  AppColor.successColor,
                                );
                              } else {
                                CustomSnackBar.showMySnackBar(
                                  context,
                                  "Product Already added to cart",
                                  AppColor.errorColor,
                                );
                              }
                            },
                            color: Colors.amber,
                            radius: MediaQuery.sizeOf(context).width * 0.6,
                            size: Size(
                              MediaQuery.sizeOf(context).width * 0.7,
                              50.spMin,
                            ),
                          ),
                          SizedBox(height: 8),
                          // CustomButton(
                          //   title: "Buy Now",
                          //   callback: () {
                          //     showMyDailog();
                          //   },
                          //   color: AppColor.secondaryColor,
                          //   radius: MediaQuery.sizeOf(context).width * 0.6,
                          //   size: Size(
                          //     MediaQuery.sizeOf(context).width * 0.7,
                          //     50.spMin,
                          //   ),
                          // ),
                          //

                        ],
                      ),
                  ],
                ),

                Spacer(),
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
    );
  }
}
