import 'package:e_commerce_app/auth/productInfo.dart';
import 'package:e_commerce_app/auth/userdata.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    ProductInfo product =
        ModalRoute.of(context)!.settings.arguments as ProductInfo;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, flag);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Product Detail Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Hero(
                tag: 'one',
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(product.image!),
                  // child: s,
                ),
              ),
              Text(
                product.name!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                ),
              ),
              Text(
                product.desc!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
              Text(
                "Price : ${product.price!}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
              Text(
                "Avilable Colors : ${product.color!}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (product.iscart!) {
                    Navigator.pushReplacementNamed(
                      context,
                      'cartScreen',
                      result: flag,
                      arguments: Userdata.cart,
                    );
                  } else {
                    if (flag == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${product.name} Added to cart"),
                        ),
                      );
                      setState(() {
                        flag = !flag;
                      });
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        'cartScreen',
                        result: flag,
                        arguments: Userdata.cart,
                      );
                    }
                  }
                },
                child: Text(
                  (product.iscart!)
                      ? "Go to cart"
                      : (!flag)
                      ? "Add To cart"
                      : "Go to cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
