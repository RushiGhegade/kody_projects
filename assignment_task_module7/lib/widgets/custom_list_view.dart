import 'package:flutter/material.dart';

import '../assetsFolder/getcolors.dart';
import '../assetsFolder/getfont.dart';
import '../model/my_data.dart';
import 'custom_texttile.dart';

class CustomListView extends StatelessWidget {
  final List<MyData> data;
  const CustomListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Getcolors.boxcolor,
              ),
              child: Image.asset(data[index].image),
            ),
            SizedBox(height: 10),
            CustomText(
              str: data[index].name,
              size: 13,
              weight: FontWeight.bold,
              color: Getcolors.back,
              fontFamily: GetFontFamily.segoeUiSemiBold,
            ),
          ],
        );
      },
    );
  }
}
