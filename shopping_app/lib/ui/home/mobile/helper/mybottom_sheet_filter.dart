
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_Category.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../../framework/repository/homerepository/enums/categories.dart';
import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/custom_Icon.dart';
import '../../../utils/widgets/custom_button.dart';


class MyBottomSheetContent extends ConsumerStatefulWidget {
  final VoidCallback callback;

  const MyBottomSheetContent({super.key, required this.callback});

  @override
  ConsumerState<MyBottomSheetContent> createState() => _MyBottomSheetContentState();
}

class _MyBottomSheetContentState extends ConsumerState<MyBottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    
    MyFilter mySelectCategory = ref.watch(homeSelectCategoryProvider);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(height: 2),
        Center(
          child: Container(
            height: 6,
            width: 70,
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              CustomTextWidget(
                text: "Category",
                color: AppColor.black,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 7,
                children: Categories.values.map((ele) {
                  return IntrinsicWidth(
                    child: GestureDetector(
                      onTap: () {
                        ref.read(homeSelectCategoryProvider.notifier).addCategory(ele);
                        print("click");
                        // setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: AppColor.black,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          spacing: 5,
                          children: [
                            CustomTextWidget(
                              text: ele.name,
                              color:AppColor.black,
                            ),
                            if (ele.name != 'all' && mySelectCategory.filterList.contains(ele))
                              GestureDetector(
                                onTap: () {
                                  print("object");
                                  ref.read(homeSelectCategoryProvider.notifier).removeCategory(ele);
                                },
                                child: CustomIcon(
                                  iconData: Icons.close,
                                  color: Colors.red.withOpacity(0.7),
                                  size: 18,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              Divider(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!mySelectCategory.filterList.contains(Categories.all))
                    CustomButton(
                      title: "Clear Filter",
                      callback: () {
                          ref.read(homeSelectCategoryProvider.notifier).clearCategory();
                          ref.read(productListProvider.notifier).fetchFilterList();
                          Navigator.pop(context);

                      },
                      color: AppColor.secondaryColor,
                      textColor: AppColor.textColor,
                    ),
                  Spacer(),
                  CustomButton(
                    title: (mySelectCategory.filterList.contains(Categories.all))
                        ? "Show Products"
                        : "Apply Filter",
                    callback: () {

                      ref.read(productListProvider.notifier).addFilter(mySelectCategory.filterList);
                      Navigator.pop(context);
                    },
                    color: AppColor.secondaryColor,
                    textColor: AppColor.textColor,

                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
