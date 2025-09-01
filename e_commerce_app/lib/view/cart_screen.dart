import 'package:flutter/material.dart';

import '../auth/productInfo.dart';
import '../auth/userdata.dart';

class CartScreen extends StatefulWidget {
  final List<ProductInfo> cart;

  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text("Cart Screen", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: (Userdata.cart.isEmpty)
            ? Center(child: Text("Not have any cart"))
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.cart.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          Navigator.pushNamed(
                            context,
                            'ProductDetailScreen',
                            arguments: widget.cart[index],
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 12),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 222, 218, 218),
                                offset: Offset(1, 1),
                                blurRadius: 9,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                            Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              widget.cart[index].image!,
                              fit: BoxFit.contain,
                            ),
                          ),
                            SizedBox(width: 10,),

                            SizedBox(
                              width: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${widget.cart[index].name}",overflow: TextOverflow.ellipsis,),
                                  Text(
                                    "${widget.cart[index].desc}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "Price : ${widget.cart[index].price}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          Container(
                            // width: 30,
                            child: Row(
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      if (widget.cart[index].quantity != 1) {
                                        widget.cart[index].quantity =
                                            widget.cart[index].quantity! - 1;
                                        setState(() {});
                                      }
                                    },
                                    child: Icon(Icons.remove,size: 29,)),
                                Text(
                                  "${widget.cart[index].quantity}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: (){
                                      widget.cart[index].quantity =
                                          widget.cart[index].quantity! + 1;
                                      setState(() {});
                                    },
                                    child: Icon(Icons.add,size: 29))
                              ],
                            ),
                          ),
                            ],
                          )
                        ),
                      );
                    },
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
                      Navigator.pushNamed(
                        context,
                        'checkoutscreen',
                        arguments: widget.cart,
                      );
                    },
                    child: Text(
                      "Checkouts",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
