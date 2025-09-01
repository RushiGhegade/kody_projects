import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/localStoreage/shared_preferance.dart';
import 'package:whatsapp_clone/framework/model/message.dart';

import '../../framework/getassets/getColors.dart';
import '../../framework/getassets/getdata.dart';
import '../../framework/model/call_modele.dart';
import '../../framework/model/userdetails.dart';
import '../widgets/my_textwidget.dart';
import 'chatting_screen.dart';

class MyListview extends StatelessWidget {
  final bool isBool;
  final List<UserDetails>? userDetails;
  final List<CallDetails>? callDetails;
  final VoidCallback? callback;
  final int? slectedIndex;

  const MyListview({
    super.key,
    required this.isBool,
    this.userDetails,
    this.callDetails,
    this.callback,
    this.slectedIndex
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: (isBool) ? Data.users.length : Data.call.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {

        UserDetails? userdetail;



        if(slectedIndex ==0){
          if(Data.users[index].messageList!.isNotEmpty ){
            userdetail = Data.users[index];
          }
        }else if(slectedIndex ==1 ){
          if(Data.users[index].pendingMessage !=0){
            userdetail = Data.users[index];
          }
        }else if(slectedIndex ==2){
          if(Data.users[index].isStatusLike!){
            userdetail = Data.users[index];
          }
        }else if(slectedIndex ==3){
          if(Data.users[index].isCommunity!){
            userdetail = Data.users[index];
          }
        }else{
          if(isBool && slectedIndex! < Data.categoryText.length){
            if(Data.users[index].addCategory!.contains(Data.categoryText[slectedIndex!])){
              userdetail = Data.users[index];
            }
          }
        }


        return GestureDetector(
          onTap: () {
            if (isBool) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChattingScreen(index: index);
                  },
                ),
              ).then((v) {
                print("Call back call Mylistview ");
                callback!();
              });
            }
          },
          child:(isBool && userdetail==null) ? Container():Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.only(right: 9),
            // color: Colors.red,
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
              leading: (isBool)
                  ? Image.asset(
                userdetail!.profileImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(Data.call[index].profileImage!),
              title: (isBool)
                  ? Row(
                      children: [
                        CustomTextWidget(
                          title: userdetail!.userName,
                          color: GetColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        CustomTextWidget(
                          title: (userdetail
                              .messageList!
                              .isNotEmpty)? userdetail
                              .messageList![userdetail
                              .messageList!
                              .length -
                              1]
                              .time : "no",
                          color: (userdetail.pendingMessage == 0)
                              ? GetColors.black
                              : GetColors.colorDart,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    )
                  : CustomTextWidget(
                      title: Data.call[index].userName,
                      color: (Data.call[index].isMissedCall!)
                          ? GetColors.red
                          : GetColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              trailing: (!isBool)
                  ? (Data.call[index].isCall)
                        ? Icon(Icons.call_outlined)
                        : Icon(Icons.videocam_outlined)
                  : null,
              subtitle: (isBool)
                  ? Row(
                      children: [
                        CustomTextWidget(
                          title: (userdetail!
                              .messageList!
                              .isNotEmpty)? userdetail
                              .messageList![userdetail
                              .messageList!
                              .length -
                              1]
                              .name : "no",
                          color: GetColors.black.withAlpha(170),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        if (userdetail.pendingMessage != 0)
                          Container(
                            height: 25,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 3,
                              bottom: 3,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: GetColors.colorOriginal,
                            ),
                            child: CustomTextWidget(
                              title: "${userdetail.pendingMessage}",
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    )
                  : Row(
                      spacing: 5,
                      children: [
                        (Data.call[index].isCall)
                            ? Icon(
                                Icons.call_received,
                                color: GetColors.colorOriginal,
                                size: 17,
                              )
                            : Icon(
                                Icons.call_made,
                                color: Colors.red,
                                size: 17,
                              ),
                        CustomTextWidget(
                          title: Data.call[index].dataTime,
                          fontSize: 16,
                          color: GetColors.black,
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
