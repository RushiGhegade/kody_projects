import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/model/userdetails.dart';

import 'package:whatsapp_clone/ui/widgets/my_continer.dart';
import 'package:whatsapp_clone/ui/widgets/my_textwidget.dart';

import '../../framework/getassets/getColors.dart';
import '../../framework/getassets/getdata.dart';
import '../../framework/getassets/images.dart';
import '../../framework/localStoreage/shared_preferance.dart';
import '../../framework/model/message.dart';
import '../widgets/send1message_textfield.dart';
import 'home_screen.dart';


class ChattingScreen extends StatefulWidget {
  final int index;
  const ChattingScreen({super.key, required this.index});

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // getMessages();
    Data.users[widget.index].pendingMessage = 0;
    super.initState();
  }

  Future<void> getMessages()async{
    Data.users[widget.index].messageList!.clear();
    if(Data.users[widget.index].messageList!.length>2){
      Data.users[widget.index].messageList!.removeRange(1,Data.users[widget.index].messageList!.length );
    }
    Data.users[widget.index].messageList!.clear();
    Data.users[widget.index].messageList!.addAll(await StoreDataLocally.getMessage(Data.users[widget.index].userName));
    setState(() {
    });
  }
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    ScrollController scrollcontroller = ScrollController();

    return WillPopScope(
      onWillPop: ()async{
        if(flag){
          print("Hello World");
          UserDetails userDetails = Data.users.removeAt(widget.index);
          Data.users.insert(0, userDetails);
        }
        await Future.delayed(Duration(milliseconds: 700),(){});
        return true;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: GetColors.white,
          image: DecorationImage(
            image: AssetImage(GetImages.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 8,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            actionsPadding: EdgeInsets.only(right: 9),
            leadingWidth: 80,
            backgroundColor: GetColors.white,
            leading: Row(
              children: [
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.maybePop(context,'t');
                  },
                  child: Icon(Icons.arrow_back, color: GetColors.black),
                ),
                SizedBox(width: 5),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(Data.users[widget.index].profileImage!),
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: Data.users[widget.index].userName,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 33, 32, 32),
                ),
                CustomTextWidget(
                  title: Data.users[widget.index].userStatus!,
                  fontSize: 14.7,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 33, 32, 32),
                ),
              ],
            ),
            actions: [
              Icon(Icons.videocam_outlined, color: GetColors.black, size: 28),
              SizedBox(width: 10),
              Icon(Icons.call_outlined, color: GetColors.black, size: 28),
              SizedBox(width: 10),
              Icon(Icons.more_vert, color: GetColors.black, size: 28),
            ],
          ),
          body: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollcontroller,
                    child: Column(
                      children: [
                        MyContiner(
                          text: "Aug 9, 2025",
                          color: GetColors.white,
                          width: 110,
                          left: MediaQuery.of(context).size.width * 0.23,
                          right: MediaQuery.of(context).size.width * 0.23,
                        ),
                        MyContiner(
                          text:
                              "Messages and calls are end-to-end encrypted. Only people in this chat can read, listen to, or share them. Learn more.",
                          width: MediaQuery.of(context).size.width * 0.8,
                          color: Color.fromARGB(255, 247, 236, 190),
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.04,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: Data.users[widget.index].messageList!.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            Message message =
                                Data.users[widget.index].messageList![index];
                            return (message.isSending)
                                ? Align(
                                    alignment: Alignment.centerRight,

                                    child: MyContiner(
                                      text: "${message.name}                ",
                                      data: message.time,
                                      color: const Color.fromARGB(
                                        150,
                                        6,
                                        243,
                                        93,
                                      ),
                                      left: 50,
                                      right: 0,
                                    ),
                                  )
                                : Align(
                                    alignment: Alignment.centerLeft,
                                    child: MyContiner(
                                      data: message.time,
                                      text: "${message.name}              ",
                                      color: GetColors.white,
                                      left: 0,
                                      right: 50,
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SendmessageTextfield(
                  index: widget.index,
                  flag: true,
                  send: () {
                    print("object");
                    flag=true;
                    // StoreDataLocally.getMessage(Data.users[widget.index].userName);
                    scrollcontroller.jumpTo(
                      scrollcontroller.position.maxScrollExtent+100,
                    );
                    // getMessages();
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
