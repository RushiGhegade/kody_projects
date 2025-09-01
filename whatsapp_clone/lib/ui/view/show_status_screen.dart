import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:whatsapp_clone/framework/getassets/getColors.dart';
import 'package:whatsapp_clone/framework/getassets/getdata.dart';
import 'package:whatsapp_clone/framework/model/userdetails.dart';
import 'package:whatsapp_clone/main.dart';
import 'package:whatsapp_clone/ui/widgets/my_textwidget.dart';
import 'package:whatsapp_clone/ui/widgets/send1message_textfield.dart';

class ShowStatusScreen extends StatefulWidget {
   int index;
  final List<UserDetails> userDetail;

   ShowStatusScreen({super.key, required this.index,required this.userDetail});

  @override
  State<ShowStatusScreen> createState() => _ShowStatusScreenState();
}

class _ShowStatusScreenState extends State<ShowStatusScreen> {

  int selectIndex=0;
    bool flag = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      flag = true;
      pageControllerStatus.jumpToPage(widget.index);
      setState(() {
      });
    });

    Future.delayed(Duration(seconds: 6),(){
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.userDetail);
    return Scaffold(
        backgroundColor: GetColors.black,
      body:Stack(
        children: [
          Positioned(
            top:MediaQuery.of(context).size.height *0.08 ,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: pageControllerStatus,
                onPageChanged:(val){

                  for(int i = 0;i<Data.users.length;i++){

                    if(Data.users[i].id==widget.userDetail[widget.index].id){

                      print(Data.users[i].isViewStatus);
                      Data.users[i].isViewStatus = true;
                      print(Data.users[i].isViewStatus);
                      break;
                    }
                  }
                  widget.index = val;
                  setState(() {
                  });
                } ,
                itemCount: widget.userDetail.length,
                itemBuilder: (BuildContext context, int index) {
                  return (!flag)? Center(child: CircularProgressIndicator(color: GetColors.white,),) : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child: Image.network(widget.userDetail[index].status!),
                  );
                },
              ),
            ),
          ),

          Positioned(
              top:MediaQuery.of(context).size.height *0.05,
              left: 0,
              bottom: 0,
              right: 0,
              child:Column(
                spacing: 12,
            children: [
              Divider(
                color: GetColors.white,
                height: 1,
              ),
              Row(
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: GetColors.white),
                  ),
                  // SizedBox(width: 5),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Container(
                      height: 40,
                      width: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle
                      ),
                      child: Image.asset(widget.userDetail[widget.index].profileImage!),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(title: widget.userDetail[widget.index].userName, fontSize: 19,fontWeight: FontWeight.w500,)
                      ,CustomTextWidget(title: "9:00 Am", fontSize: 16,fontWeight: FontWeight.w400,)
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_vert,color: GetColors.white,size: 32,),
                  SizedBox(width: 2,),
                ],
              ),
            ],
          )),
          Positioned(
            bottom: 10,
              left: 10,
              right: 10,
              child:SendmessageTextfield(
               like: Data.users[widget.index].isStatusLike!,
                userDetails: widget.userDetail[widget.index]
                ,send: (like){
                widget.userDetail[widget.index].isStatusLike = like;
                setState(() {
                });
              }, flag: false,index: selectIndex+1),
          )
        ],
      )
    );
  }
}
