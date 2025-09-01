import 'package:assignment_task_module7/assetsFolder/getcolors.dart';
import 'package:assignment_task_module7/model/my_data.dart';
import 'package:flutter/cupertino.dart';

import '../assetsFolder/getfont.dart';
import 'custom_texttile.dart';

class MyGridview extends StatelessWidget {
  final List<MyData> products;

  const MyGridview({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 120,
        crossAxisCount: 3,
        mainAxisSpacing: 13,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // color: Colors.red,
          child: Column(
            spacing: 10,
            children: [
              Image.asset(products[index].image),
              CustomText(
                str: products[index].name,
                size: 13,
                textAlign: TextAlign.center,
                weight: FontWeight.bold,
                fontFamily: GetFontFamily.segoeUiSemiBold,
                color: Getcolors.back,
              ),
            ],
          ),
        );
      },
    );
  }
}
