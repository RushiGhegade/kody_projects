

import 'package:flutter/material.dart';

import 'package:whatsapp_clone/ui/widgets/my_textwidget.dart';

import '../../framework/getassets/getColors.dart';
import 'my_listview.dart';



class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetColors.white,
      body:SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(title: "Favorites", fontSize: 21,color: GetColors.black,fontWeight: FontWeight.w500,),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: GetColors.colorOriginal.withAlpha(500)
                      
                  ),
                  child: Icon(Icons.favorite,color: GetColors.white,),
                ),
                CustomTextWidget(title: "Add Favorite", fontSize: 18,color: GetColors.black,fontWeight: FontWeight.w500,),

              ],
            ),
            CustomTextWidget(title: "Recent", fontSize: 21,color: GetColors.black,fontWeight: FontWeight.w500,),
            MyListview(isBool: false),
          ],
        ),
      )
    );
  }
}