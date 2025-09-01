import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/model/userdetails.dart';
import '../../framework/getassets/getColors.dart';
import '../../framework/getassets/getdata.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/my_textwidget.dart';
import 'add_people.dart';
import 'chatting_screen.dart';
import 'my_listview.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: GetColors.black,
      onRefresh: ()async{
          await Future.delayed(Duration(seconds: 1),(){setState(() {
          });
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView
          (
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 15,
            children: [
              SizedBox(height: 50, child: CustomTextfield()),
              SizedBox(
                height: 34,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: Data.categoryText.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {

                        selectIndex = index;
                        setState(() {});
                        if(selectIndex == Data.categoryText.length){
                          showMyBottomSheet();
                        }

                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 9),
                        padding: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 15,
                          right: 15,
                        ),
                        height: 30,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (selectIndex != index)
                              ? GetColors.white
                              : GetColors.blurColor,
                          border: BoxBorder.all(color: GetColors.searchIcon),
                        ),
                        alignment: Alignment.center,
                        child: (index == Data.categoryText.length)
                            ? Icon(Icons.add)
                            : CustomTextWidget(
                                title: Data.categoryText[index],
                                color: GetColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                      ),
                    );
                  },
                ),
              ),

          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount:  Data.users.length,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (BuildContext context, int index) {
          //     UserDetails? userdetail;
          //     if(selectIndex==0){
          //       if(Data.users[index].messageList!.isNotEmpty){
          //         userdetail = Data.users[index];
          //       }
          //     }else if(selectIndex ==1){
          //       if(Data.users[index].pendingMessage !=0){
          //         userdetail = Data.users[index];
          //       }
          //     }else if(selectIndex ==2){
          //       if(Data.users[index].isStatusLike!){
          //         userdetail = Data.users[index];
          //       }
          //     }else{
          //       if(Data.users[index].isCommunity!){
          //         userdetail = Data.users[index];
          //       }
          //     }
          //     return GestureDetector(
          //       onTap: () {
          //
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) {
          //                 return ChattingScreen(index: index);
          //               },
          //             ),
          //           ).then((v) {
          //
          //           });
          //       },
          //       child:(userdetail ==null) ? Container():Container(
          //         margin: EdgeInsets.only(bottom: 10),
          //         padding: EdgeInsets.only(right: 9),
          //         // color: Colors.red,
          //         child: ListTile(
          //           contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
          //           leading: Image.asset(
          //             userdetail!.profileImage!,
          //             fit: BoxFit.cover,
          //           ),
          //
          //           title: Row(
          //             children: [
          //               CustomTextWidget(
          //                 title: Data.users[index].userName,
          //                 color: GetColors.black,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //               Spacer(),
          //               CustomTextWidget(
          //                 title:(userdetail
          //                     .messageList!
          //                     .isNotEmpty)? userdetail
          //                     .messageList![userdetail
          //                     .messageList!
          //                     .length -
          //                     1]
          //                     .time : "no",
          //                 color: (userdetail.pendingMessage == 0)
          //                     ? GetColors.black
          //                     : GetColors.colorDart,
          //                 fontSize: 13,
          //                 fontWeight: FontWeight.w400,
          //               ),
          //             ],
          //           ),
          //           subtitle: Row(
          //             children: [
          //               CustomTextWidget(
          //                 title:(userdetail
          //                     .messageList!
          //                     .isNotEmpty)? userdetail!
          //                     .messageList![userdetail!
          //                     .messageList!
          //                     .length -
          //                     1]
          //                     .name:"No",
          //                 color: GetColors.black.withAlpha(170),
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w400,
          //               ),
          //               Spacer(),
          //               if (userdetail.pendingMessage != 0)
          //                 Container(
          //                   height: 25,
          //                   alignment: Alignment.center,
          //                   padding: EdgeInsets.only(
          //                     left: 10,
          //                     right: 10,
          //                     top: 3,
          //                     bottom: 3,
          //                   ),
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(15),
          //                     color: GetColors.colorOriginal,
          //                   ),
          //                   child: CustomTextWidget(
          //                     title: "${userdetail.pendingMessage}",
          //                     fontSize: 15,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //             ],
          //           )
          //
          //         ),
          //       ),
          //     );
          //   },
          // ),

              MyListview(
                isBool: true,
                slectedIndex: selectIndex,
                callback: () {
                  Future.delayed(Duration(seconds: 1),(){
                    setState(() {});
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


TextEditingController addcontroller = TextEditingController();

  FocusNode getFocus =FocusNode();

  void showMyBottomSheet(){
    getFocus.requestFocus();
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (context){
      return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child:Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Container(height: 9,width: 40,decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: GetColors.iconsColors.withOpacity(0.7)),),),
                SizedBox(height: 10,),
                Row(
            
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close)),
                    Spacer(),
                    CustomTextWidget(title: "New List", fontSize: 19,color: GetColors.black,fontWeight: FontWeight.w400),
                    Spacer(),
                  ],
                ),
                  SizedBox(
                    height: 30,
                  ),
                CustomTextWidget(title: "Last name", fontSize: 19,fontWeight: FontWeight.w400,color: GetColors.black),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: TextFormField(
                        focusNode: getFocus,
                        onChanged: (v){
                          setState(() {

                          });
                        },
                        controller: addcontroller,
                        decoration: InputDecoration(
                            hint: CustomTextWidget(title: "Example: Work, Friends", fontSize: 21,color: GetColors.iconsColors,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
            
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: GetColors.colorOriginal)
                            )
            
                        ),
                      ),
                    ),
            
                      Icon(Icons.emoji_emotions_outlined,color: GetColors.iconsColors,),
                    SizedBox(width: 5,),
                  ],
                ),
                SizedBox(height: 5,),
                // CustomTextWidget(title: , fontSize: 17,color: GetColors.black,),
                Text("Any list Ypu create become a filter at top of your chat tabs",style: TextStyle(
            
                ),),
                // Spacer(),
                SizedBox(
                  height:100,
                ),
                ElevatedButton(
            
                    style: ElevatedButton.styleFrom(
                        backgroundColor: (addcontroller.text.isEmpty)?GetColors.iconsColors.withOpacity(0.01) :GetColors.colorOriginal,
                        fixedSize: Size(MediaQuery.of(context).size.width,50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                    onPressed: (){

                      if(addcontroller.text.isNotEmpty){

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return AddPeople(name: addcontroller.text,);
                        }));

                      }

                    }, child: CustomTextWidget(title: "add people or groups", fontSize: 19,color: GetColors.white))
            
                ,SizedBox(height: 10,),
              ],
            ),
          )
      );
    });
  }

}
