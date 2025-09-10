
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_Category.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/widgets/custom_Icon.dart';
import '../../../utils/widgets/custom_text_widget.dart';

class PriceShow extends ConsumerStatefulWidget {
  const PriceShow({super.key});

  @override
  ConsumerState<PriceShow> createState() => _PriceShowState();
}

class _PriceShowState extends ConsumerState<PriceShow> {
  List<double> prices = [10000, 35000, 60000, 100000];
  double price = 0;
  @override
  Widget build(BuildContext context) {

    final getFilters = ref.watch(homeSelectCategoryProvider);

    return  ListView.builder(
      itemCount: prices.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            price = prices[index];
            ref.read(productListProvider.notifier).addPriceFilter(getFilters.filterList, price, price==100000);
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            margin: EdgeInsets.only(top: 10, bottom: 5, left: 10),
            decoration: BoxDecoration(
              color: (price == prices[index])
                  ? AppColor.primaryColor.withOpacity(0.4)
                  : null,
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                color:AppColor.black,
              ),
            ),
            alignment: Alignment.center,
            child: Row(
              spacing: 2,
              children: [
                CustomTextWidget(
                  text:
                  '${index == prices.length - 1 ? 'above' : 'below'}  ${prices[index]}',
                  fontSize: 13.5,
                  color:  AppColor.black,
                ),
                if (price == prices[index])
                  GestureDetector(
                    onTap: () {
                      price = 0;
                      // findList();
                      ref.read(productListProvider.notifier).addFilter(getFilters.filterList);
                      setState(() {});
                    },
                    child: CustomIcon(
                      iconData: Icons.close,
                      color: Colors.red.withOpacity(0.7),
                      size: 15,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
