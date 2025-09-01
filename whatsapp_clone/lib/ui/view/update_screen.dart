import 'package:flutter/material.dart';
import 'package:whatsapp_clone/main.dart';
import 'package:whatsapp_clone/ui/view/show_status_screen.dart';
import 'package:whatsapp_clone/ui/widgets/my_textwidget.dart';

import '../../framework/getassets/getColors.dart';
import '../../framework/getassets/getdata.dart';
import '../../framework/model/userdetails.dart';



class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  List<UserDetails> userDetail = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sortList();
  }

  void sortList() {

    List<UserDetails> viewUser = [];
    userDetail.clear();
    for(int i=0;i<Data.users.length;i++){
      if(Data.users[i].status != null ){

        if(Data.users[i].isViewStatus!){
          viewUser.add(Data.users[i]);
        }else{
          userDetail.add(Data.users[i]);
        }
      }
    }
    userDetail.insertAll(userDetail.length,viewUser);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: GetColors.black,
      onRefresh: ()async{
        sortList();
        await Future.delayed(Duration(seconds: 1),(){});
        setState(() {
        });
      },
      child: Scaffold(
        backgroundColor: GetColors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                title: "Status",
                fontSize: 23,
                color: GetColors.black,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: userDetail.length,
                  itemBuilder: (BuildContext context, int index) {
                    String userName = userDetail[index].userName
                        .split(' ')
                        .join('\n');
                    return (userDetail[index].status == null)
                        ? Container()
                        : GestureDetector(
                          onTap: (){
                            if(index!=0){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ShowStatusScreen(index: index,userDetail: userDetail,);
                              })).then((v){
                                sortList();
                                setState(() {

                                });
                              });
                            }
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                                image: (index == 0)
                                    ? null
                                    : DecorationImage(
                                        image: NetworkImage(
                                          userDetail[index].status!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              height: 150,
                              width: 100,
                              child: Stack(
                                children: [
                                  if (index != 0)
                                    Positioned(
                                      top: 5,
                                      left: 5,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        clipBehavior: Clip.antiAlias,
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:(userDetail[index].isViewStatus!)? Colors.grey:GetColors.colorOriginal,
                                        ),
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          clipBehavior: Clip.antiAlias,
                                          // padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: GetColors.colorOriginal,
                                          ),
                                          child: Image.asset(
                                            userDetail[index].profileImage!,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),

                                  if (index != 0)
                                    Positioned(
                                      bottom: 5,
                                      left: 10,
                                      right: 5,
                                      child: CustomTextWidget(
                                        title: userName,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  if (index == 0)
                                    Positioned(
                                      bottom: 5,
                                      left: 5,
                                      right: 5,
                                      child: Text(
                                        "Add \nStatus",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,

                                          color: GetColors.black,
                                        ),
                                      ),
                                    ), //CustomTextWidget(title:"", fontSize: 14,fontWeight: FontWeight.w500,color: GetColors.black,))

                                  if (index == 0)
                                    Positioned(
                                      top: 30,
                                      left: 20,
                                      child: Container(
                                        height: 55,
                                        width: 55,
                                        clipBehavior: Clip.antiAlias,
                                        // padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          userDetail[index].profileImage!,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),

                                  if (index == 0)
                                    Positioned(
                                      top: 60,
                                      left: 50,
                                      child: Container(
                                        height: 23,
                                        width: 23,
                                        clipBehavior: Clip.antiAlias,
                                        // padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: GetColors.white,
                                        ),
                                        child: Icon(
                                          Icons.add_circle_rounded,
                                          color: GetColors.colorOriginal,
                                        ),
                                        // child: Image.asset(Data.users[index].profileImage!,fit: BoxFit.contain,)
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        );
                  },
                ),
              ),

              Row(
                children: [
                  CustomTextWidget(
                    title: "Channels",
                    fontSize: 19,
                    color: GetColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                  Container(
                    // height: 30,
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 5,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: CustomTextWidget(
                      title: "Explore",
                      fontSize: 16,
                      color: GetColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Data.channel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        trailing: (index > 1)
                            ? Container(
                                // height: 30,
                                padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: GetColors.blurColor,
                                ),
                                child: CustomTextWidget(
                                  title: "Follow",
                                  fontSize: 16,
                                  color: GetColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : null,
                        leading: Container(
                          height: 45,
                          width: 45,
                          clipBehavior: Clip.antiAlias,
                          padding: (Data.channel[index].isImage!)
                              ? null
                              : EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: GetColors.blurColor.withOpacity(0.1),
                          ),
                          child: (Data.channel[index].isImage!)
                              ? Image.network(
                                  Data.channel[index].image!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  Data.channel[index].image!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        title: Row(
                          children: [
                            CustomTextWidget(
                              title: Data.channel[index].title,
                              fontSize: 16,
                              color: GetColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            Spacer(),
                            if (index <= 1)
                              CustomTextWidget(
                                title: Data.channel[index].date!,
                                fontSize: 14,
                                color: GetColors.black,
                              ),
                          ],
                        ),

                        subtitle: CustomTextWidget(
                          title: Data.channel[index].subTitle,
                          fontSize: 15,
                          color: GetColors.black.withAlpha(220),
                        ),
                      ),
                      if (index == 1) SizedBox(height: 10),

                      if (index == 1)
                        CustomTextWidget(
                          title: "Find Channels to follow",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: GetColors.black.withAlpha(100),
                        ),
                      if (index == 1) SizedBox(height: 10),
                    ],
                  );
                },
              ),

              Container(
                // height: 30,
                padding: EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.grey.withOpacity(0.2),
                  border: Border.all(color: GetColors.searchIcon),
                ),
                child: CustomTextWidget(
                  title: "Explore more",
                  fontSize: 16,
                  color: GetColors.colorOriginal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
