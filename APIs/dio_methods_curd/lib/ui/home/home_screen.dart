
import 'package:dio_methods_curd/framework/repository/homerepository/repository/apis_repository.dart';
import 'package:dio_methods_curd/ui/home/post_screen.dart';
import 'package:dio_methods_curd/ui/home/product_detailed_screen.dart';
import 'package:dio_methods_curd/ui/home/update_screen.dart';
import 'package:dio_methods_curd/ui/utils/widgets/change_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../framework/controller/homecontroller/home_controller.dart';
import '../../framework/controller/homecontroller/home_controller_provider.dart';
import '../../framework/repository/homerepository/module/fetchdata_model.dart';
import '../utils/theme/app_color.dart';
import '../utils/widgets/custom_snackbar.dart';
import '../utils/widgets/custom_text_field.dart';
import '../utils/widgets/custom_text_widget.dart';
import 'delete_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  void showModelSheet(bool flag,[Datum? data,int? id]){

    showModalBottomSheet(context: context, builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom,
        ),
      child: (flag)? UpdateScreen(id: id!,data: data!) :  PostScreen(),
      );
    }
    );
  }


  void showBottomSheetForImage(int id)async{
    final result =  await  showModalBottomSheet(context: context, builder:(context){

      return Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child:ChangeImage(id: id)

      );

    });

  }

  @override
  Widget build(BuildContext context) {


    print("Build method");
          return RefreshIndicator(
            onRefresh: ()async{

              await ref.read(apisOperationProvider.notifier).getAllResponseApi();

            },
            child: Scaffold(
                  appBar: AppBar(
                    title: CustomTextWidget(text: "Home Screen",color: AppColor.white,),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
            spacing: 10,
            children: [




              Consumer(
                builder: (context,ref,child) {
                  return CustomTextField(
                    text: "Search Product By Id",
                    iconData: Icons.search,
                    callback:(v){

                      if(v.isNotEmpty){
                        ref.read(apisOperationProvider.notifier).getBrandById(int.parse(v));
                      }else{
                        ref.read(apisOperationProvider.notifier).getAllResponseApi();
                      }

                    },
                    controller: HomeController.searchController,
                  );
                }
              ),

              Consumer(builder: (context,ref,child){

                final data = ref.watch(apisOperationProvider);

                /// when data is loading it show these
                if(data.isLoading){
                  return Expanded(child: const Center(child: CircularProgressIndicator()));
                }

                /// when error come that time thee code execute
                if(data.error!=null){
                  return Expanded(child:  Center(child: CustomTextWidget(text: "${data.error}",color: AppColor.error,)));
                }

                /// when data come that time this code execute
                if(data.fetchData !=null) {

                  if(data.fetchData!.data==null){

                    Datum? datum = data.fetchData!.singleData;

                    return Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: 0.4,
                          motion: DrawerMotion(),
                          children: [
                            SlidableAction(
                              autoClose: false,
                              onPressed: (BuildContext context) async {
                                final slidableController = Slidable.of(
                                    context);


                                CustomSnackBar.showMySnackBar(
                                    context, "Data updated :",
                                    AppColor.success);

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
                              onPressed: (BuildContext context) async {
                                final slidableController = Slidable.of(
                                    context);

                                  FetchData? feData =await ref.read(apisOperationProvider.notifier).deleteUserOnServer(datum!.id!);


                                  ref.read(apisOperationProvider.notifier).getAllResponseApi();

                                  CustomSnackBar.showMySnackBar(
                                    context,
                                    "Data Delete : ${feData.message}",
                                    AppColor.success,
                                  );
                                  Navigator.pop(context);
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
                          child: GestureDetector(
                            onTap: (){
                              print("next Screen");
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProductDetailedScreen(fetchData: datum,);
                              }));

                            },
                            child: ListTile(
                              title: CustomTextWidget(
                                text: "id : ${datum!.id!}",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(text: datum.name!,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,),


                                  CustomTextWidget(text: datum.description!,
                                    fontWeight: FontWeight
                                        .w400,
                                    fontSize: 13,),

                                ],
                              ),
                              leading: GestureDetector(

                                onTap: (){
                                    print("call");
                                    showBottomSheetForImage(datum.id!);

                                },

                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: FittedBox(
                                      fit: BoxFit.cover,
                                      child:datum.logoUrl!=null? Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.network(datum.logoUrl)) :Icon(
                                        Icons.shopify_outlined, color: AppColor
                                          .black,)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                  }else{



                  List<Datum>? showData = data.fetchData!.data;

                  return Expanded(
                    child: ListView.builder(
                        itemCount: showData!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Datum datum = showData[index];
                          return GestureDetector(
                            onTap: (){
                              print("next Screen");
                               ref.read(apisOperationProvider.notifier).getBrandById(datum.id!);
                              print("get ${datum.id}");
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return ProductDetailedScreen(fetchData: datum,);
                              }));

                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: Slidable(
                                endActionPane: ActionPane(
                                  extentRatio: 0.4,
                                  motion: DrawerMotion(),
                                  children: [
                                    SlidableAction(
                                      autoClose: false,
                                      onPressed: (BuildContext context) async {


                                        showModelSheet(true,datum,datum.id);

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
                                      onPressed: (BuildContext context) async {

                                        FetchData? feData =await ref.read(apisOperationProvider.notifier).deleteUserOnServer(datum!.id!);

                                        await ref.read(apisOperationProvider.notifier).getAllResponseApi();


                                        CustomSnackBar.showMySnackBar(
                                          context,
                                          "Data Delete : ${feData.message}",
                                          AppColor.success,
                                        );

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
                                    title: CustomTextWidget(
                                      text: "id : ${datum.id!}",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomTextWidget(text: datum.name!,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,),


                                          CustomTextWidget(text: datum.description??"No Discription",
                                            fontWeight: FontWeight
                                                .w400,
                                            fontSize: 13,),

                                      ],
                                    ),
                                    leading: GestureDetector(
                                      onTap: (){
                                        print("call");
                                        showBottomSheetForImage(datum.id!);

                                      },
                                      child: Hero(
                                        tag: datum.id!,
                                        child: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: FittedBox(
                                              fit: BoxFit.cover,
                                              child:datum.logoUrl!=null? Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Image.network(datum.logoUrl)) :Icon(
                                                Icons.shopify_outlined, color: AppColor
                                                  .black,)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );


                        }
                    ),
                  );

                  }

                };


                return Expanded(child:  Center(child: CustomTextWidget(text: "No Item Found",color: AppColor.error,)));

              }
              )
            ],
                    ),
                  ),
                    floatingActionButton: Consumer(
              builder: (context,ref,child){
               return FloatingActionButton(onPressed: (){
                 showModelSheet(false);
                },child: CustomTextWidget(text: "Post",color: AppColor.white,),);
              },)


            ),
          );
  }
}
