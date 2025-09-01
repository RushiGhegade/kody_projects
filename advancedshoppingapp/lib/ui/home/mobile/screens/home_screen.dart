import 'package:advancedshoppingapp/framework/enums/app_enum.dart';
import 'package:advancedshoppingapp/framework/enums/tab_view.dart';
import 'package:advancedshoppingapp/ui/home/mobile/helper/gridview_showproducts.dart';
import 'package:advancedshoppingapp/ui/util/theme/app_color.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_appbar.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_bottomnavigationbar.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_icon.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      animationDuration: Duration(microseconds: 700),
      child: Scaffold(
        backgroundColor: AppColor.white,
        drawer: Drawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child:CustomAppbar()
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: AppColor.blueAccent,
              dividerColor: AppColor.searchIconColor.withOpacity(0.3),
              tabs: [
              Tab(child:CustomText(title: "Shop",color: AppColor.black,fontSize: 15,)),
              Tab(child:CustomText(title: "Favorites",color: AppColor.black,fontSize: 15,)),
              Tab(child:CustomText(title: "Offers",color: AppColor.black,fontSize: 15,)),
            ]),

            Expanded(
              child: TabBarView(children: [
                ShowMyGridView(currentTabView: CurrentTabView.shop),
                ShowMyGridView(currentTabView: CurrentTabView.favorites),
                ShowMyGridView(currentTabView: CurrentTabView.offers),
              ]),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: AppColor.blueAccent,
          onPressed: (){},child: CustomIcon(iconData: Icons.add,size: 32,),),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
