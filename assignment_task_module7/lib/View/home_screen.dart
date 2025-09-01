import 'package:assignment_task_module7/assetsFolder/getcolors.dart';
import 'package:assignment_task_module7/assetsFolder/getfont.dart';
import 'package:assignment_task_module7/assetsFolder/images.dart';
import 'package:assignment_task_module7/data/store_data.dart';
import 'package:assignment_task_module7/model/my_data.dart';
import 'package:assignment_task_module7/widgets/custom_texttile.dart';
import 'package:assignment_task_module7/widgets/my_gridview.dart';
import 'package:assignment_task_module7/widgets/show_slide.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> keys = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int currentIndex = 1;
  int currentIndex1 = 1;
  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return Scaffold(
      backgroundColor: Getcolors.white,
      key: keys,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.only(
                  bottomLeft: Radius.circular(
                    20,
                    // MediaQuery.of(context).size.width * 0.04,
                  ),
                  bottomRight: Radius.circular(
                    20,
                    // MediaQuery.of(context).size.width * 0.04,
                  ),
                ),
              ),

              backgroundColor: Getcolors.blue,

              leading: InkWell(
                onTap: () {
                  keys.currentState!.openDrawer();
                },
                child: Image.asset("assets/MaskGroup21.png"),
              ),

              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2,
                children: [
                  CustomText(
                    str: "Home",
                    size: 19,
                    weight: FontWeight.w600,
                    fontFamily: GetFontFamily.segoeUiSemiBold,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Getcolors.white,
                  ),
                ],
              ),
              actions: [
                Badge(
                  backgroundColor: Getcolors.red,
                  smallSize: 13,
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
                SizedBox(width: 10),
                Badge(
                  backgroundColor: Getcolors.red,
                  smallSize: 13,
                  child: Image.asset(
                    Images.image1,
                    height: MediaQuery.of(context).size.width * 0.08,
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 20,
              left: 6,
              right: 6,
              child: Padding(
                padding: EdgeInsetsGeometry.only(left: 20, right: 20, top: 50),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Getcolors.shadowColor, blurRadius: 10),
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Getcolors.textTitle,
                      ),
                      hint: CustomText(
                        str: "Search here",
                        fontFamily: GetFontFamily.SegoeUIRegular,
                        color: Getcolors.textTitle,
                        size: 16,
                      ),
                      filled: true,
                      fillColor: Getcolors.white,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            SizedBox(
              height: 160,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                  initialPage: currentIndex,
                  // padEnds: false,
                  enableInfiniteScroll: false,
                  onPageChanged: (int index, re) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: 450.0,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.002,
                  viewportFraction: 0.95,
                ),

                itemBuilder: (BuildContext context, int index, int pageIndex) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 20,
                      bottom: 10,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(color: Getcolors.shadowColor, blurRadius: 12),
                      ],
                      image: DecorationImage(
                        image: AssetImage(Images.image2),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 100,

                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 10),
                        Spacer(),
                        RichText(
                          text: TextSpan(
                            text: "UPTO",
                            style: TextStyle(
                              color: Getcolors.back,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: GetFontFamily.SegoeUIRegular,
                            ),
                            children: [
                              TextSpan(
                                text: "  25% OFF",
                                style: TextStyle(
                                  color: Getcolors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  fontFamily: GetFontFamily.SegoeUIBold,
                                ),
                              ),
                              TextSpan(
                                text: "\nOn Groceries",
                                style: TextStyle(
                                  color: Getcolors.back,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  fontFamily: GetFontFamily.SegoeUIRegular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 38,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Getcolors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   " Shop Now",
                              //   style: TextStyle(
                              //     fontSize: 12,
                              //     color: Getcolors.white,
                              //   ),
                              // ),
                              CustomText(
                                str: "Shop Now",
                                size: 16,
                                fontFamily: GetFontFamily.segoeUiSemiBold,
                              ),
                              Icon(
                                Icons.arrow_right_sharp,
                                color: Getcolors.white,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),
            // getSlider(currentIndex, 3),
            ShowSlide(myIndex: currentIndex, length: 3),
            SizedBox(height: 1),
            // Text(
            //   "Categories",
            //   style: TextStyle(fontSize: 19, fontWeight: ),
            // ),
            CustomText(
              str: "Categories",
              size: 19,
              weight: FontWeight.bold,
              color: Getcolors.back,
              fontFamily: GetFontFamily.segoeUiSemiBold,
            ),
            SizedBox(height: 1),
            MyGridview(products: StoreData.products),
            RichText(
              text: TextSpan(
                text: "Newly Registered On ",
                style: TextStyle(
                  color: Getcolors.back,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: GetFontFamily.segoeUiSemiBold,
                ),
                children: [
                  TextSpan(
                    text: "GETSY",
                    style: TextStyle(
                      color: Getcolors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: GetFontFamily.segoeUiSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),

            SizedBox(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: CustomListView(data: StoreData.newlyRegister),
            ),

            RichText(
              text: TextSpan(
                text: "Best",
                style: TextStyle(
                  color: Getcolors.back,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: GetFontFamily.segoeUiSemiBold,
                ),
                children: [
                  WidgetSpan(
                    child: SizedBox(width: 5), // Adds space between text parts
                  ),
                  TextSpan(
                    text: "Deals",
                    style: TextStyle(
                      color: Getcolors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: GetFontFamily.segoeUiSemiBold,
                    ),
                  ),

                  WidgetSpan(
                    child: SizedBox(width: 5), // Adds space between text parts
                  ),
                  TextSpan(
                    text: "For You",
                    style: TextStyle(
                      color: Getcolors.back,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: GetFontFamily.segoeUiSemiBold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                // allowImplicitScrolling: true,
                controller: _pageController,
                pageSnapping: true,
                padEnds: false,
                onPageChanged: (int index) {
                  currentIndex1 = index;
                  setState(() {});
                },
                itemCount: StoreData.shopInfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.only(
                      top: 10,
                      right: 20,
                      bottom: 10,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(color: Getcolors.shadowColor, blurRadius: 12),
                      ],
                      image: DecorationImage(
                        image: AssetImage(StoreData.shopInfo[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    // child: Image.asset(shopeInfo[index]['image']!),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        RichText(
                          text: TextSpan(
                            text: StoreData.shopInfo[index].name,
                            style: TextStyle(
                              color: Getcolors.back,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              wordSpacing: 3,
                              fontFamily: GetFontFamily.SegoeUIBold,
                            ),
                          ),
                        ),
                        Spacer(),
                        if (index % 2 != 0)
                          Container(
                            height: 38,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Getcolors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(9),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  " Shop Now",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Getcolors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right_sharp,
                                  color: Getcolors.white,
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
            ShowSlide(myIndex: currentIndex1, length: 4),
            RichText(
              text: TextSpan(
                text: "Popular",
                style: TextStyle(
                  color: Getcolors.back,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: GetFontFamily.segoeUiSemiBold,
                ),
                children: [
                  WidgetSpan(
                    child: SizedBox(width: 5), // Adds space between text parts
                  ),
                  TextSpan(
                    text: "Items",
                    style: TextStyle(
                      color: Getcolors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontFamily: GetFontFamily.segoeUiSemiBold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // height: 200,
                    padding: EdgeInsets.all(10),
                    width: 150,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Getcolors.shadowColor, blurRadius: 5),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: 6,
                      children: [
                        Image.asset(Images.image5),
                        CustomText(
                          str: "Lay's India's \nMagic Masala Chips",
                          size: 13,
                          fontFamily: GetFontFamily.segoeUiSemiBold,
                          color: Getcolors.back,
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            CustomText(
                              str: " 75 pcs",
                              size: 13,
                              fontFamily: GetFontFamily.SegoeUIBold,
                              color: Getcolors.blue,
                            ),

                            Icon(Icons.arrow_drop_down, color: Getcolors.blue),
                          ],
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            Column(
                              children: [
                                Text(
                                  " 15 rs",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Getcolors.boxcolor1,
                                    decorationThickness: 2.0,
                                    color: Getcolors.boxcolor1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: GetFontFamily.SegoeUIBold,
                                  ),
                                ),
                                Text(
                                  "10 rs",
                                  style: TextStyle(
                                    color: Getcolors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: GetFontFamily.SegoeUIBold,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Getcolors.blue,
                              ),
                              child: Icon(Icons.add),
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            CustomText(
              str: "Previously Views Stores",
              size: 19,
              weight: FontWeight.bold,
              color: Getcolors.back,
              fontFamily: GetFontFamily.segoeUiSemiBold,
            ),
            SizedBox(height: 1),
            SizedBox(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: CustomListView(data: StoreData.newlyRegister),
            ),
            // SizedBox(
            //   height: 40,
            // ),
          ],
        ),
      ),
    );
  }

  Widget notificationCircule() {
    return Icon(
      Icons.circle,
      color: Colors.red,
      size: MediaQuery.of(context).size.width * 0.02,
    );
  }
}
