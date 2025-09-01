
import 'package:advancedshoppingapp/framework/controller/app_controller.dart';
import 'package:advancedshoppingapp/framework/enums/tab_view.dart';
import 'package:advancedshoppingapp/framework/model/product_details.dart';
import 'package:advancedshoppingapp/ui/home/mobile/helper/rating.dart';
import 'package:advancedshoppingapp/ui/util/theme/app_color.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_icon.dart';
import 'package:advancedshoppingapp/ui/util/widget/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../framework/enums/app_enum.dart';

class ShowMyGridView extends StatefulWidget {

  final CurrentTabView currentTabView;


  const ShowMyGridView({super.key,required this.currentTabView});

  @override
  State<ShowMyGridView> createState() => _ShowMyGridViewState();
}

class _ShowMyGridViewState extends State<ShowMyGridView> {

  List<ProductDetails> showList = [];
  String selectName = "all";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findList();
  }

  void findList(){
    showList.clear();
    for(int index=0;index<AppController.products.length;index++){
      if(widget.currentTabView == CurrentTabView.shop ){
        print("1");
        if(selectName=='all'){
          print("2");
          showList.add(AppController.products[index]);
        }else if(selectName==AppController.products[index].category.name){
          print("3");
          showList.add(AppController.products[index]);
        }

      }else if(widget.currentTabView == CurrentTabView.favorites){
        if(AppController.products[index].isFavorite){
          if(selectName=='all'){
            print("2");
            showList.add(AppController.products[index]);
          }else if(selectName==AppController.products[index].category.name){
            print("3");
            showList.add(AppController.products[index]);
          }
        }
      }else if(widget.currentTabView == CurrentTabView.offers){
      }
    }
  }

  void setFlag(ProductDetails productDetail,bool flag){

    for(int i=0;i<AppController.products.length;i++){
      if(productDetail.productName == AppController.products[i].productName){
        AppController.products[i].isFavorite = flag;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: Categories.values.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap: (){
                    print(selectName);
                    selectName = Categories.values[index].name;
                    findList();
                    print(selectName);
                    setState(() {
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                    margin: EdgeInsets.only(top: 10,bottom: 5,left: 10),
                    decoration: BoxDecoration(
                        color: (selectName== Categories.values[index].name)?AppColor.blueAccent.withOpacity(0.4) :null,
                        borderRadius:BorderRadius.circular(13),
                        border: Border.all(color: AppColor.black)
                    ),
                    alignment: Alignment.center,
                    child: CustomText(title: Categories.values[index].name,fontSize: 14,color: AppColor.black,),
                  ),
                );
              }),
        ),
        Expanded(

          child:(showList.isEmpty)? Center(child: CustomText(title: "No ${widget.currentTabView.name} item Found",color: AppColor.black,),): GridView.builder(
              itemCount: showList.length,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 230
              ),
              itemBuilder: (BuildContext context,int index){

                ProductDetails? productDetails = showList[index];

                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(136, 136, 136, 1).withOpacity(0.15),
                        blurRadius: 5
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white

                  ),

                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                            Center(
                              child: Hero(
                                tag:"one",
                                child: SizedBox(
                                                height: 100,width: 100,
                                    child: Image.network(productDetails.productImage[0],fit: BoxFit.cover,)),
                              ),
                            ),
                          CustomText(title: productDetails.productName,fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.black,maxLines: 2,textOverflow:TextOverflow.ellipsis,),
                          Row(
                            children: [
                              CustomIcon(iconData:Icons.currency_rupee,color: AppColor.black,size: 15,),
                              CustomText(title: "${productDetails.productPrice}",color: AppColor.black,),
                              Spacer(),
                              CustomIcon(iconData:Icons.currency_rupee,color: AppColor.black,size: 12,),
                              CustomText(title: "1200",color: AppColor.black,textDecoration: TextDecoration.lineThrough,fontSize: 12,)
                              ,Spacer(flex: 1,),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                            width: MediaQuery.of(context).size.width*0.4,
                            child: Rating(rating: productDetails.rating),
                          )
                        ],
                      ),

                      Positioned(
                          right: 0,
                          bottom: 110,
                          child: GestureDetector(
                          onTap: (){
                            print(showList[index].isFavorite);
                            showList[index].isFavorite = !showList[index].isFavorite;
                            print(showList[index].isFavorite);
                            setFlag(showList[index],showList[index].isFavorite);
                            setState(() {});
                            },
                          child: SizedBox(child: (!productDetails.isFavorite)? CustomIcon(iconData: Icons.favorite_border_outlined,color: AppColor.black.withOpacity(0.5),) :CustomIcon(iconData: Icons.favorite,color: Colors.red,) ,)))




                    ],
                  ),
                );

              }
          ),
        ),
      ],
    );
  }
}
