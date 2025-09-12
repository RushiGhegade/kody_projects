import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:https_methods_implements/framework/controller/homecontroller/home_controller_provider.dart';
import 'package:https_methods_implements/framework/repository/homerepository/module/fetchdata_model.dart';
import 'package:https_methods_implements/ui/utils/widgets/custom_snackbar.dart';
import 'package:https_methods_implements/ui/utils/widgets/custom_text_widget.dart';

import '../utils/theme/app_color.dart';
import '../utils/widgets/custom_text_field.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();

}

class _PostScreenState extends State<PostScreen> {


  final TextEditingController productName = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController year = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(
        builder: (context,ref,child) {
          return Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [

              Center(
                child:CustomTextWidget(text: "Post The Data",color: AppColor.black,fontSize: 18,fontWeight: FontWeight.w600),
              ),

              TextFormField(
               controller: productName,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.shopify_outlined),
                  hintText: "Enter Product name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              CustomTextField(iconData: Icons.currency_rupee, text: "Enter price",callback: (v){
                price.text = v.toString();
              },),
              CustomTextField(iconData: Icons.calendar_month, text: "Enter year",callback: (v){
                year.text = v.toString();
              },),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton(onPressed: ()async{
                    print(productName.text);
                    print(price.text);
                    print(year.text);
                    if(productName.text.isNotEmpty && price.text.isNotEmpty && year.text.isNotEmpty){
                      FetchData fetchData = FetchData(
                        name: productName.text,
                        data: Data(
                            year:int.parse(year.text),
                            price: price.text
                        ),
                      );

                      print(productName.text);

                       String str = await ref.read(apisOperationProvider.notifier).postUserOnServer(fetchData);

                       CustomSnackBar.showMySnackBar(context,  str, AppColor.error);

                       Navigator.pop(context);

                    }else{
                      print("Filled all field");
                    }
                  },child: CustomTextWidget(text: "Post Data",color: AppColor.black,),style: ElevatedButton.styleFrom(backgroundColor: AppColor.success),),

                  ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                  },child: CustomTextWidget(text: "Cancel",color: AppColor.black),style: ElevatedButton.styleFrom(backgroundColor: AppColor.error),),


                ],
              ),
              SizedBox(height: 10,),
            ],
          );
        }
      ),
    );
  }
}
