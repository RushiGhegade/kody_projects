
import 'package:advancedshoppingapp/ui/util/theme/app_color.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_icon.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int rating;
  const Rating({super.key,required this.rating});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
        itemBuilder: (BuildContext context,int index){
      return (rating>index) ? CustomIcon(iconData: Icons.star,color: Colors.orange,): CustomIcon(iconData: Icons.star_rate_outlined,color: AppColor.black.withOpacity(0.2),);
    });
  }
}
