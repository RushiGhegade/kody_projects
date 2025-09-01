import 'package:e_commerce_app/auth/productInfo.dart';
import 'package:flutter/material.dart';

import '../auth/userdata.dart';

class CheckoutScreen extends StatefulWidget {
  final List<ProductInfo> checkoutlist;
  const CheckoutScreen({super.key, required this.checkoutlist});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int totalPrice = 0;

  int toatlAmount() {
    int amount = 0;

    for (int i = 0; i < widget.checkoutlist.length; i++) {
      amount +=
          widget.checkoutlist[i].quantity! * widget.checkoutlist[i].price!;
    }

    return amount;
  }

  String select = "Not Select";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Close Screen"),
              content: Text('Do you want Close Screen'),
              actions: [
                TextButton(
                  onPressed: () { Navigator.pop(context, false);},
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {Navigator.pop(context, true);},
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );
        return shouldPop ?? false; // Return false if dialog is dismissed without selection
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: Text("Checkout Screen", style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [






                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.checkoutlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("hello");
                    totalPrice =
                        totalPrice +
                        (widget.checkoutlist[index].quantity! *
                            widget.checkoutlist[index].price!);
                    print(totalPrice);
                    print("hello");
                    return GestureDetector(
                      onTap: () async {},
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 237, 234, 234),
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
                                widget.checkoutlist[index].image!,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(width: 10,),
                            SizedBox(
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${widget.checkoutlist[index].name}"),
                                  Text(
                                    "Quantity : ${widget.checkoutlist[index].quantity}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "price: ${widget.checkoutlist[index].price}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 100,
                              child: Text(
                                "Total Price : ${widget.checkoutlist[index].quantity! * widget.checkoutlist[index].price!}",
                              ),
                            ),
                          ],
                        )
                      ),
                    );
                  },
                ),
                SizedBox(height: 10,),
                Text(
                  "Total Amount : ${toatlAmount()}",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),

                Text(
                  "Select Payment Options",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),

                SizedBox(
                  height: 30,
                  // width: 4,
                  child: RadioListTile(
                    title: Text("UPI options"),
                    value: "UPI options",
                    activeColor: Colors.blue,
                    groupValue: select,
                    onChanged: (val) {
                      select = val!;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: RadioListTile(
                    value: "Cash On delevary",
                    title: Text("Cash On delevary"),
                    activeColor: Colors.blue,
                    groupValue: select,
                    onChanged: (val) {
                      select = val!;
                      setState(() {});
                    },
                  ),
                ),
                // Spacer(),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (select == 'Cash On delevary' || select == 'UPI options') {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'buy',
                        (route) => route.settings.name == 'homescreen',
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Select the Payment Option")),
                      );
                    }
                  },
                  child: Text("Buy", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
