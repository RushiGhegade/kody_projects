
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/framework/getassets/getdata.dart';
import 'package:whatsapp_clone/ui/view/home_screen.dart';

import '../../framework/getassets/getColors.dart';
import '../widgets/my_textwidget.dart';

class AddPeople extends StatefulWidget {
  final String name;
  const AddPeople({super.key,required this.name});

  @override
  State<AddPeople> createState() => _AddPeopleState();
}

class _AddPeopleState extends State<AddPeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GetColors.white,
        title: Text("Add to list"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Data.categoryText.add(widget.name);

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
          return HomeScreen();
        }), (route)=> route.isCurrent);

        // Navigator.push(context, );
      },backgroundColor: GetColors.colorOriginal,child: Icon(Icons.done)),
      backgroundColor: GetColors.white,
      body:ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        // physics: NeverScrollableScrollPhysics(),

        itemCount: Data.users.length,
        itemBuilder: (BuildContext context,int index){

          return (Data.users[index].isCommunity!) ? Container():GestureDetector(
            onTap: (){
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              //   return ChattingScreen(index: index);
              // }));
            },
            child: ListTile(

              contentPadding: EdgeInsets.only(left: 0,right: 10,top: 0,bottom: 10),
              titleAlignment: ListTileTitleAlignment.top,
              trailing: Checkbox(value: Data.users[index].addCategory!.contains(widget.name), onChanged: (v){
                    if(!Data.users[index].addCategory!.contains(widget.name)){
                      print("object1");
                      Data.users[index].addCategory!.add(widget.name);
                    }else{
                      print("object2");
                      int index1 = Data.users[index].addCategory!.indexOf(widget.name);
                      Data.users[index].addCategory!.removeAt(index1);
                    }
                    setState(() {

                    });
              }),
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
    );
  }
}
