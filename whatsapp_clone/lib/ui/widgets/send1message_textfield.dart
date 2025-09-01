

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/framework/getassets/getColors.dart';
import 'package:whatsapp_clone/framework/localStoreage/shared_preferance.dart';
import 'package:whatsapp_clone/framework/model/userdetails.dart';

import '../../framework/getassets/getdata.dart';
import '../../framework/model/message.dart';

class SendmessageTextfield extends StatefulWidget {
  final int index;
  final Function send;
  final bool flag;
   bool? like;
   UserDetails? userDetails;
   SendmessageTextfield({
    super.key,
    required this.send,
    required this.index,
    required this.flag,
    this.like,
     this.userDetails
  });

  @override
  State<SendmessageTextfield> createState() => _SendmessageTextfieldState();
}

class _SendmessageTextfieldState extends State<SendmessageTextfield> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          // height: 50,
          width: MediaQuery.of(context).size.width - 82,
          child: TextFormField(

            focusNode: focusNode,
            // expands: true,
            // maxLines: null,
            minLines: 1, // Start with one line
            maxLines: 5,
            controller: controller,
            onChanged: (v) {
              setState(() {});
            },
            decoration: InputDecoration(

              filled: true,
              prefixIcon:(widget.flag)?Icon(Icons.emoji_emotions_outlined):null,
              hint: Text(
                (widget.flag)?"Message":"Reply",
                style: TextStyle(
                  fontSize: 18,
                  color:(widget.flag)? GetColors.iconsColors:GetColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              suffixIcon:(widget.flag)? SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.attach_file),
                    Icon(Icons.currency_rupee),
                    Icon(Icons.camera_alt_outlined),
                  ],
                ),
              ):null,
              fillColor:(widget.flag)? GetColors.white:Color.fromRGBO(41, 39, 39,1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular((widget.flag)?15:25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            if(!widget.flag){

              if(widget.like != null){
                widget.like = !widget.like!;
                // widget.send();
              }

              for(int i=0;i<Data.users.length;i++){
                if(Data.users[i].id == widget.userDetails!.id){
                  print(Data.users[i].isStatusLike);
                  Data.users[i].isStatusLike = widget.like;
                  print(Data.users[i].userName);
                  print(Data.users[i].isStatusLike);
                }
              }

              setState(() {
              });
            }
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:(widget.flag)? Color.fromARGB(255, 24, 184, 82):Color.fromRGBO(41, 39, 39,1),
            ),
            child: (controller.text.length > 0)
                ? GestureDetector(
                    onTap: () {
                      if(widget.flag){
                        String time = DateFormat('HH:mm').format(DateTime.now());
                        print(time);
                        Message message =  Message(
                          name: controller.text.toString(),
                          isSending: true,
                          time: time,
                        );
                        Data.users[widget.index].messageList!.add(
                            message
                        );

                        StoreDataLocally.saveMessage(message, Data.users[widget.index].userName);
                        controller.clear();
                        print("Hello");
                        widget.send();
                      }

                    },
                    child:(widget.flag)?Icon(Icons.send, color: GetColors.white, size: 31):Icon(Icons.favorite_border_outlined, color: GetColors.white, size: 31),
                  )
                : (widget.flag)?Icon(Icons.mic, color: GetColors.white, size: 31):(!widget.like!)?Icon(Icons.favorite_border_outlined, color: GetColors.white, size: 27):Icon(Icons.favorite, color: GetColors.colorOriginal, size: 27),
          ),
        ),
      ],
    );
  }
}
