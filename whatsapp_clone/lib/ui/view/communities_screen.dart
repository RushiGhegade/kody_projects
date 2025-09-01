import 'package:flutter/material.dart';


import '../../framework/getassets/getColors.dart';
import '../../framework/getassets/getdata.dart';
import '../../framework/getassets/images.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_rowwidget.dart';
import '../widgets/my_textwidget.dart';


class CommunitiesScreen extends StatefulWidget {
  const CommunitiesScreen({super.key});

  @override
  State<CommunitiesScreen> createState() => _CommunitiesScreenState();
}

class _CommunitiesScreenState extends State<CommunitiesScreen> {
  List<Color> color = [GetColors.orange, GetColors.pink, GetColors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetColors.textFillColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 10),
              child: Stack(
                // clipBehavior: Clip.antiAlias,
                children: [
                  CustomRowWidget(
                    title: "New Community",
                    flag: false,
                    boxColor: GetColors.searchIcon.withAlpha(100),
                    imageColor: GetColors.white,
                    image: GetImages.com,
                  ),
                  Positioned(
                    bottom: 0,
                    top: 29,
                    left: 43,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GetColors.colorOriginal,
                      ),
                      child: CustomIcon(
                        icon: Icons.add,
                        color: GetColors.white,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: 2,
                  ),
                  color: GetColors.white,
                  child: Column(
                    spacing: 10,
                    children: [
                      CustomRowWidget(
                        title: Data.community[index].communityName,
                        flag: true,
                        boxColor: color[index % 3].withOpacity(0.3),
                        imageColor: color[index % 3],
                        image: GetImages.com,
                      ),
                      Divider(
                        height: 2,
                        color: GetColors.searchIcon.withAlpha(70),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Data.community[index].communities.length,
                        itemBuilder: (BuildContext context, int index1) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 45,
                              width: 45,
                              padding:
                                  (Data
                                      .community[index]
                                      .communities[index1]
                                      .isImage!)
                                  ? EdgeInsets.all(1)
                                  : EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: GetColors.blurColor.withOpacity(0.1),
                              ),
                              child: Image.asset(
                                Data
                                    .community[index]
                                    .communities[index1]
                                    .image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Row(
                              children: [
                                CustomTextWidget(
                                  title: Data
                                      .community[index]
                                      .communities[index1]
                                      .title,
                                  fontSize: 16,
                                  color: GetColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                Spacer(),
                                CustomTextWidget(
                                  title: Data
                                      .community[index]
                                      .communities[index1]
                                      .date!,
                                  fontSize: 14,
                                  color: GetColors.black,
                                ),
                              ],
                            ),
                            subtitle: CustomTextWidget(
                              title: Data
                                  .community[index]
                                  .communities[index1]
                                  .subTitle,
                              fontSize: 15,
                              color: GetColors.black.withAlpha(220),
                            ),
                          );
                        },
                      ),

                      ListTile(
                        contentPadding: EdgeInsets.only(left: 8),
                        title: CustomTextWidget(
                          title: "View All",
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        leading: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
              itemCount: Data.community.length,
            ),
          ],
        ),
      ),
    );
  }
}
