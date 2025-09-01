
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/getassets/images.dart';
import 'package:whatsapp_clone/framework/model/show_info_group.dart';
import 'package:whatsapp_clone/framework/model/userdetails.dart';
import 'package:whatsapp_clone/ui/view/chatting_screen.dart';
import 'package:whatsapp_clone/ui/view/home_screen.dart';
import 'package:whatsapp_clone/ui/widgets/custom_rowwidget.dart';

import '../../framework/getassets/getColors.dart';
import '../../framework/getassets/getdata.dart';
import '../widgets/my_textwidget.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {


  List<ShowInfoModelClass> list = [
    ShowInfoModelClass(widget:Icon(Icons.people_alt,color: GetColors.white,) , name: "New group"),
    ShowInfoModelClass(widget:Icon(Icons.person_add_alt_rounded,color: GetColors.white) , name: "New contact",iconData:Icon(Icons.qr_code) ),
    ShowInfoModelClass(widget:Image.asset(GetImages.com,height: 30,width: 30,) , name: "New contact"),
    ShowInfoModelClass(widget:Icon(Icons.emoji_emotions,color: GetColors.white) , name: "Chat With Ai"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetColors.white,
      appBar: AppBar(
        titleSpacing: 0,
        bottom: PreferredSize(preferredSize: Size.fromHeight(1), child: Divider(color: GetColors.searchIcon.withOpacity(0.2),)),
        actionsPadding: EdgeInsets.only(right: 9),
        // leadingWidth: 80,
        backgroundColor: GetColors.white,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: GetColors.black),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: "Select Contact",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 33, 32, 32),
            ),
            CustomTextWidget(
              title: "${Data.users.length.toString()} contacts",
              fontSize: 14.7,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 33, 32, 32),
            ),
          ],
        ),
        actions: [
          Icon(Icons.search, color: GetColors.black, size: 24),
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: GetColors.black, size: 24),
          SizedBox(width: 5),
        ],
      ),

      body:SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            ListView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (BuildContext context,int index){
                return ListTile(
                  contentPadding: EdgeInsets.only(left: 0,right: 10,top: 0,bottom: 10),
                  titleAlignment: ListTileTitleAlignment.top,
                  leading:Container(
                    // margin: EdgeInsets.only(bottom: 10),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: GetColors.colorOriginal,
                    ),
                    child: list[index].widget,
                  ),
                  trailing: list[index].iconData,
                  title: CustomTextWidget(title: list[index].name, fontSize: 17,color: GetColors.black,fontWeight: FontWeight.w500,),
                );
                },
            ),

            CustomTextWidget(title: "Contacts on WhatsApp", fontSize: 17,fontWeight: FontWeight.w500,color: GetColors.black.withOpacity(0.6),)

            ,ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: Data.users.length,
              itemBuilder: (BuildContext context,int index){

                return (Data.users[index].isCommunity!) ? Container():GestureDetector(
                  onTap: ()async{
                    final result = await  Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ChattingScreen(index: index);
                    })).then((v){
                      print("call from select contact");
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                        return HomeScreen();
                      }), (route)=>route.isCurrent);
                    });

                    // if(result=='t'){
                    //   print("call from select contact1");
                    //   Navigator.pop(context);
                    // }else{
                    //   print("call from select contact2");
                    //   Navigator.pop(context);
                    // }
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 0,right: 10,top: 0,bottom: 10),
                    titleAlignment: ListTileTitleAlignment.top,
                    leading:Container(
                      // margin: EdgeInsets.only(bottom: 10),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: GetColors.colorOriginal,
                      ),
                      child: Image.asset(Data.users[index].profileImage!),
                    ),
                    subtitle: CustomTextWidget(title: Data.users[index].prompt!, fontSize: 15,color: GetColors.black,),
                    title: CustomTextWidget(title: Data.users[index].userName, fontSize: 17,color: GetColors.black,fontWeight: FontWeight.w500,),
                  ),
                );
              },
            ),

          ],
        ),
      ) ,
    );
  }
}
