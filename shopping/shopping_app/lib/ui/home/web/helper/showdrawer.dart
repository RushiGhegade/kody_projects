import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/framework/controller/homecontroller/select_category.dart';
import 'package:shopping_app/framework/controller/profilecontrller/expand_status.dart';
import 'package:shopping_app/framework/repository/orderrepository/ui_order_filter.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_Navigation.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../utils/widgets/custom_Icon.dart';

class MyDrawer extends ConsumerStatefulWidget {
  const MyDrawer({super.key});

  @override
  ConsumerState<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends ConsumerState<MyDrawer> {
  // List<String> drawerText = ["Orders", "Wishlist", "Settings"];

  List<Map<String, dynamic>> drawerText = [
    {"name": "Product", "icon": Icons.list_alt},
    {"name": "Order", "icon": Icons.shopping_cart_outlined},
    {"name": "Profile", "icon": Icons.perm_identity},
  ];

  Color getColor() {
    return AppColor.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = ref.watch(selectedIndexProvider);
    bool expand = ref.watch(expandStatus);
    return (expand)
        ? Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: 40,
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: drawerText.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          ref.read(expandStatus.notifier).state = !expand;
                          ref.read(selectedIndexProvider.notifier).state =
                              index;

                          if (index == 0) {
                            ref.read(productListProvider.notifier).fetchFilterList();
                            CustomNavigation.homeScreen(context);
                          } else if (index == 1) {
                            ref
                                .read(productListProvider.notifier)
                                .addFilterOrder(UiOrderFilter.All);

                            CustomNavigation.orderScreenNavigation(context);
                          } else {
                            CustomNavigation.profileScreenNavigation(context);
                          }
                          // setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(7.r),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.white.withOpacity(0.2),
                                blurRadius: 5.r,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(7.r),
                            color: selectedIndex == index
                                ? AppColor.primaryColor.withOpacity(0.4)
                                : AppColor.white,
                          ),
                          child: CustomIcon(
                            iconData: drawerText[index]['icon'],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: SizedBox(
              width: 180.spMin,
              // child: Drawer(
              // backgroundColor: AppController.isDarkMode.value ? :,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.spMin,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                              text: "Menu",
                              fontWeight: FontWeight.w600,
                              fontSize: 20.spMin,
                            ),

                            GestureDetector(
                              onTap: () {
                                ref.read(expandStatus.notifier).state = !expand;
                              },
                              child: CustomIcon(iconData: Icons.close),
                            ),
                          ],
                        ),
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: drawerText.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              ref.read(selectedIndexProvider.notifier).state =
                                  index;

                              if (index == 0) {
                                ref.read(productListProvider.notifier).fetchFilterList();
                                CustomNavigation.homeScreen(context);
                              } else if (index == 1) {
                                ref
                                    .read(productListProvider.notifier)
                                    .addFilterOrder(UiOrderFilter.All);
                                CustomNavigation.orderScreenNavigation(context);
                              } else {
                                CustomNavigation.profileScreenNavigation(
                                  context,
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 7),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: selectedIndex == index
                                    ? AppColor.primaryColor.withOpacity(0.4)
                                    : AppColor.backgroundColor,
                              ),
                              // margin: EdgeInsets.only(bottom: 20, left: 10),
                              child: Row(
                                spacing: 10,
                                children: [
                                  CustomIcon(
                                    iconData: drawerText[index]['icon'],
                                    size: 20.spMin,
                                    color: getColor().withOpacity(0.6),
                                  ),
                                  CustomTextWidget(
                                    text: drawerText[index]['name'],
                                    // color: getColor(),
                                    fontSize: 18.spMin,
                                  ),
                                  // Spacer(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
    // );
  }
}
