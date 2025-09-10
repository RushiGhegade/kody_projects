
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:https_methods_implements/framework/controller/homecontroller/home_controller_provider.dart';
import 'package:https_methods_implements/framework/repository/homerepository/module/fetchdata_model.dart';
import 'package:https_methods_implements/framework/repository/homerepository/repository/apis_repository.dart';
import 'package:https_methods_implements/ui/utils/theme/app_color.dart';
import 'package:https_methods_implements/ui/utils/widgets/custom_snackbar.dart';
import 'package:https_methods_implements/ui/utils/widgets/custom_text_field.dart';
import 'package:https_methods_implements/ui/utils/widgets/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiImplements().getAll();
  }


  @override
  Widget build(BuildContext context) {

    print("Build method");
          return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(text: "Home Screen",color: AppColor.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 10,
          children: [

            CustomTextField(),

            Consumer(builder: (context,ref,child){

              final getData = ref.watch(apisOperationProvider);

              return getData.when(
                data: (data){
                  return Expanded(
                    child: (data.isNotEmpty && data[0].apiError!=null)?
                        Center(child: CustomTextWidget(text: data[0].apiError!.error,color: AppColor.error,),)
                        : ListView.builder(
                        itemCount:data.length ,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          FetchData fetchData = data[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                        child: Slidable(

                          endActionPane: ActionPane(
                              extentRatio: 0.4,
                              motion: DrawerMotion(),
                            children: [
                              SlidableAction(
                                autoClose: false,
                                onPressed: (BuildContext context) async{
                                  final slidableController = Slidable.of(context);
                                  bool result = await ref.read(apisOperationProvider.notifier).postUserOnServer();

                                  if(result){
                                    CustomSnackBar.showMySnackBar(context, "Data Update Successfully",AppColor.success);
                                  }else{
                                    CustomSnackBar.showMySnackBar(context, "Data  Not updated",AppColor.success);
                                  }
                                  slidableController?.close();
                                },
                                icon: Icons.edit,
                                backgroundColor: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                              ),
                              SlidableAction(
                                autoClose: false,
                                onPressed: (BuildContext context) async{

                                  final slidableController = Slidable.of(context);

                                  bool result = await ref.read(apisOperationProvider.notifier).postUserOnServer();

                                  if(result){
                                    CustomSnackBar.showMySnackBar(context, "Data deleted Successfully",AppColor.success);
                                  }else{
                                    CustomSnackBar.showMySnackBar(context, "Data  Not deleted",AppColor.success);
                                  }

                                  slidableController?.close();

                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                          ],
                          ),
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.black.withOpacity(0.3),
                                  blurRadius: 4,

                                )
                              ]
                            ),
                            child: ListTile(
                              title: CustomTextWidget(text:"id : ${fetchData.id!}",fontWeight: FontWeight.w500,fontSize: 15,),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(text:fetchData.name!,fontWeight: FontWeight.w600,fontSize: 14,),

                                  if(fetchData.data!=null)
                                    CustomTextWidget(text:"Price : ${fetchData.data!.price!=null ?fetchData.data!.price! :"Not Available "}" ,fontWeight: FontWeight.w400,fontSize: 13,),

                                ],
                              ),
                              leading: SizedBox(
                                height: 60,
                                width: 60,
                                child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Icon(Icons.shopify_outlined,color: AppColor.black,)),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
                loading: () => Expanded(child: const Center(child: CircularProgressIndicator())),
                error: (error, stack) => Center(child: Text('Error: $error')),
              );

            }),
          ],
        ),
      ),
        floatingActionButton: Consumer(
            builder: (context,ref,child){
             return FloatingActionButton(onPressed: ()async{

              bool result = await ref.read(apisOperationProvider.notifier).postUserOnServer();

              if(result){
                CustomSnackBar.showMySnackBar(context, "Data Added Successfully",AppColor.success);
              }else{
                CustomSnackBar.showMySnackBar(context, "Data  Not added",AppColor.success);
              }

              },child: CustomTextWidget(text: "Post",color: AppColor.white,),);
            },)
    );
  }
}
