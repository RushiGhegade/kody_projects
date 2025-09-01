

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/main.dart';
import 'package:whatsapp_clone/ui/view/select_contact.dart';

import '../../framework/getassets/getColors.dart';

class CustomFloatingActionButton extends StatelessWidget {

  final bool showMetaIcon;
  final bool showMetaIcon1;
  final Icon iconData;
  final  Widget? widget;
  final VoidCallback? callback;

  const CustomFloatingActionButton({super.key,this.callback,this.widget,required this.showMetaIcon,required this.iconData,required this.showMetaIcon1});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(right: 0,bottom: 20,left: MediaQuery.of(context).size.width-45,
          child: FloatingActionButton.extended(
            heroTag:null,
              isExtended: true,
              elevation: 0,
              backgroundColor: GetColors.white,
              onPressed: (){

              }, label:GestureDetector(
              onTap: ()async{
                print("call-----------------");
                if(currentPageIndex==0){
                  final result  = await Navigator.push(context, MaterialPageRoute(builder: (context){return SelectContact();})).then((v){
                    print("call from floatingactionbuttom");
                    callback!();
                  });
                }
              },
                child: Column(
                            spacing: 15,
                            children: [
                if(showMetaIcon)
                  Container(
                    height: 42,
                    width: 42,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: GetColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: GetColors.black.withAlpha(45),
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: widget,//,
                  ),

                if(showMetaIcon1)
                  GestureDetector(
                    onTap: (){
                      print("call");
                      if(currentPageIndex==0){
                        Navigator.push(context, MaterialPageRoute(builder: (context){return SelectContact();}));
                      }
                    },
                    child: Container(
                      height: 57,
                      width: 57,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: GetColors.colorOriginal,
                      ),
                      child: iconData,
                    ),
                  )
                            ],
                          ),
              )),
        ),
      ],
    );
  }
}
