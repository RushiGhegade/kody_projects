
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/home/web/helper/show_product_gridview.dart';
import 'package:shopping_app/ui/home/web/helper/showdrawer.dart';

import '../../helper/custom_appbar.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({super.key});

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(130),
          child:CustomAppbar(title: "Dashboard",isShowTextField: true,isWeb: true,)
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10,right: 10,bottom: 10),
        child: Row(
          children: [
            MyDrawer(),

            ShowProductGridview(),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
