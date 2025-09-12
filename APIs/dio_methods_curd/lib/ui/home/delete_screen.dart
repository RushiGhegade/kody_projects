
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../framework/controller/homecontroller/home_controller.dart';
import '../../framework/controller/homecontroller/home_controller_provider.dart';
import '../utils/theme/app_color.dart';
import '../utils/widgets/custom_text_field.dart';
import '../utils/widgets/custom_text_widget.dart';

class DeleteScreen extends StatefulWidget {

  final int id;
   bool isFirst ;


   DeleteScreen({super.key,required this.id,required this.isFirst});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {

  @override
  Widget build(BuildContext context) {
    print(widget.isFirst);
    return Scaffold(
        appBar: AppBar(
          title: CustomTextWidget(text: "Delete Screen",color: AppColor.white,),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Consumer(
                builder: (context,ref,child) {
                  return CustomTextField(
                    text: "Enter Delete Id",
                    iconData: Icons.search,
                    callback:(v){
                      widget.isFirst=false;
                      setState(() {

                      });
                    },
                    controller: HomeController.deleteController,
                  );
                }
            ),


            //   Consumer(
            //   builder: (context,ref,child) {
            //
            //     return (widget.isFirst || HomeController.deleteController.text.isNotEmpty) ? FutureBuilder(
            //       future:ref.read(apisOperationProvider.notifier).deleteUserOnServer(HomeController.deleteController.text.isNotEmpty ?int.parse(HomeController.deleteController.text) :widget.id),
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return Expanded(child: Center(child: CircularProgressIndicator())); // Show a loading indicator
            //         } else if (snapshot.hasError) {
            //           return Text('Error: ${snapshot.error}');
            //         } else if (snapshot.hasData) {
            //
            //           return  Expanded(
            //             child: Center(
            //               child: (snapshot.data!.massage!=null)? CustomTextWidget(text: snapshot.data!.massage!,color: AppColor.success):CustomTextWidget(text: snapshot.data!.error!,color: AppColor.error),
            //             ),
            //           ); // Display the fetched data
            //         }
            //         return Container(); // Default empty container
            //       },
            //     ) : Expanded(
            //       child: Center(
            //         child: CustomTextWidget(text: "Enter the Id for delete"),
            //       ),
            //     );
            //   }
            // )

          ],
        ),
      ),

    );
  }
}
