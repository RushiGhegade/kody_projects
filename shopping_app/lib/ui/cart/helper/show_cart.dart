



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/controller/homecontroller/home_controller.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../framework/controller/auth_controller/auth_controllers.dart';
import '../../../framework/repository/homerepository/model/productmodel.dart';
import '../../../framework/utils/local_database_hive.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/widgets/custom_Icon.dart';

class ShowCart extends ConsumerStatefulWidget {

  final List<ProductDetails> myOrders;
  final VoidCallback callback;
  final bool flag;

  const ShowCart({super.key,required this.flag,required this.myOrders,required this.callback});

  @override
  ConsumerState<ShowCart> createState() => _ShowCartState();
}

class _ShowCartState extends ConsumerState<ShowCart> {


  double findAmount(int quantity , double amount){

    return quantity * amount;

  }

  @override
  Widget build(BuildContext context) {
    final getCredential = ref.read(getUserCredential);
    return getCredential.when(data: (data){
      return  ListView.builder(
        shrinkWrap: true,
        itemCount: widget.myOrders.length,
        itemBuilder: (BuildContext context, int index) {
          ProductDetails productDetails = widget.myOrders[index];
          return GestureDetector(
            onTap: (){

            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: widget.flag ?  100:130,
              child: Card(
                color: AppColor.white,
                shadowColor: AppColor.black.withOpacity(0.9),
                child: ListTile(
                  leading: Container(
                    color: Colors.red,
                    child:Image.network(
                      productDetails.productImage[0],
                      fit: BoxFit.cover,
                      loadingBuilder:
                          (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress,
                          ) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(

                          ),
                        );
                      },
                    ),
                  ),
                  title: CustomTextWidget(
                    text: productDetails.productName,
                    color: AppColor.black,
                    maxLines: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  // dense: ,
                  isThreeLine: true,

                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 3,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          CustomIcon(
                            iconData: Icons.currency_rupee,
                            color: AppColor.black,
                            size: 15,
                          ),
                          CustomTextWidget(
                            text: "${productDetails.productPrice}",
                            color: AppColor.black,
                          ),
                          // Spacer(),
                          SizedBox(width: 10),
                          CustomIcon(
                            iconData: Icons.currency_rupee,
                            color: AppColor.black,
                            size: 12,
                          ),
                          CustomTextWidget(
                            text: "1200",
                            color: AppColor.black,
                            textDecoration:
                            TextDecoration.lineThrough,
                            fontSize: 12,
                          ),
                          Spacer(flex: 1),
                        ],
                      ),

                      if(!widget.flag)
                        SizedBox(height: 13,),
                      
                      if(widget.flag)
                        CustomTextWidget(text: "Amount : ${findAmount(productDetails.quantity,productDetails.productPrice)}"),
                      
                      if(!widget.flag)
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:Border.all(color: AppColor.yellow)
                          )
                          ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: (){

                                    if(productDetails.quantity==1){
                                      widget.myOrders.removeAt(index);
                                      if(data.isLogin){
                                        LocalDatabaseHive.updateDataAddToCart(data.id, productDetails.productId, false);
                                        LocalDatabaseHive.updateDataAddToCart(getCredential.value!.id , productDetails.productId,false);
                                      }
                                      ref.read(productListProvider.notifier).addProductQuantity(productDetails,0);
                                    }else{
                                      productDetails.quantity --;
                                      if(data.isLogin){
                                        LocalDatabaseHive.updateDataQuantity(data.id, productDetails.productId, productDetails.quantity);
                                      }
                                      ref.read(productListProvider.notifier).addProductQuantity(productDetails,productDetails.quantity);
                                      setState(() {
                                      });
                                    }
                                  },
                                  child:(productDetails.quantity==1)? CustomIcon(iconData: Icons.delete,size: 20,color: AppColor.black,) :CustomIcon(iconData: Icons.remove,size: 20,color: AppColor.black,)),
                              CustomTextWidget(text: "${productDetails.quantity}",color: AppColor.black,),
                              GestureDetector(
                                  onTap: (){
                                    productDetails.quantity ++;
                                    if(data.isLogin){
                                      LocalDatabaseHive.updateDataQuantity(data.id, productDetails.productId, productDetails.quantity);
                                    }
                                    ref.read(productListProvider.notifier).addProductQuantity(productDetails,productDetails.quantity);
                                    setState(() {
                                    });
                                  },
                                  child: Icon(Icons.add))
                            ],
                          ),
                        ),
                    ],
                  ),
                  // ),
                ),
              ),
            ),
          );
        },
      );

    }, error: (obj,st){
      return CustomTextWidget(text:"${st}" );
    }, loading: (){
      return Center(child: CircularProgressIndicator(),);
    });
  }
}
