
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/auth/helper/action_button.dart';
import 'package:shopping_app/ui/utils/theme/app_color.dart';
import 'package:shopping_app/ui/utils/widgets/custom_snackar.dart';
import 'package:shopping_app/ui/utils/widgets/custom_text_widget.dart';

import '../../../../framework/repository/homerepository/model/productmodel.dart';
import '../../../utils/widgets/custom_Icon.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../helper/custom_appbar.dart';
import '../helper/navigation_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductDetails product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetails? product;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = widget.product;
  }

  int selectIndex = 0;
  List<String> list = [
    "Brand",
    "Model Name",
    "Screen Size",
    "Operating System",
    "Color",
  ];




  void showMyDailog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: CustomTextWidget(text: "Confirm Purchase"),
          content: CustomTextWidget(
            text: "Are you sure you want to buy this product?",

          ),
          actions: [
            CustomButton(
              title: "cancel",
              callback: () {
                Navigator.pop(context);
              },
              color: AppColor.secondaryColor,
            ),
            CustomButton(
              title: "Buy",
              color: AppColor.secondaryColor,
              callback: () {

                CustomSnackBar.showMySnackBar(context,"Order placed successfully!" ,AppColor.successColor);

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: CustomAppbar(

          isShowTextField: false,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            CustomTextWidget(
              text: product!.productName,
              maxLines: 2,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    itemCount: product!.productImage.length,
                    onPageChanged: (index) {
                      selectIndex = index;
                      setState(() {});
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Hero(
                        tag: widget.product.productName,
                        transitionOnUserGestures: true,
                        child: Image.network(
                            product!.productImage[index],
                            fit: BoxFit.fitHeight,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.secondaryColor,
                                ),
                              );
                            }
                        ),
                      );
                    },
                  ),
                ),
                if (product!.isOrder)
                  Positioned(
                    left: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        // height: 20,
                        // width: 40,
                        padding: EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.red,
                        ),
                        child: CustomTextWidget(
                          text: "50%  off",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),


              ],
            ),

            SizedBox(height: 3,),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                product!.productImage.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2), // spacing
                  child: Icon(
                    Icons.circle,
                    size: 10,
                    color: (selectIndex == index)
                        ? AppColor.secondaryColor
                        : AppColor.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 3,),
            Row(
              children: [
                CustomIcon(
                  iconData: Icons.currency_rupee,

                  size: 25,
                ),
                CustomTextWidget(
                  text:"${product!.productPrice}",

                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                // Spacer(),
                SizedBox(width: 15),
                CustomIcon(
                  iconData: Icons.currency_rupee,
                  color: AppColor.secondaryColor,
                  size: 15,
                ),
                CustomTextWidget(
                  text: "1200",

                  textDecoration: TextDecoration.lineThrough,
                  fontSize: 15,
                ),
                // Spacer(flex: 5),
              ],
            ),

            CustomTextWidget(
              text: product!.productDis!,
maxLines: 3,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 5),

            CustomButton(
              title: "Add to cart",
              callback: () {

                CustomSnackBar.showMySnackBar(
                  context,
                    "Product added to cart",
                  AppColor.successColor
                );

              },
              color: Colors.amber,
              radius: MediaQuery.of(context).size.width * 0.6,
              size: Size(MediaQuery.of(context).size.width, 50),
            ),
            SizedBox(height: 8),
            CustomButton(
              title: "Buy Now",
              callback: () {
                showMyDailog();
              },
              color: AppColor.secondaryColor,
              radius: MediaQuery.of(context).size.width * 0.6,
              size: Size(MediaQuery.of(context).size.width, 50),
            ),
            SizedBox(height: 5),



            SizedBox(height: 2,),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),

    );
  }

}

