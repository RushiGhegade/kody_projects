import 'package:flutter/material.dart';

import '../auth/userdata.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text(
          "ProductList Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: Userdata.products.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    bool result =
                        await Navigator.pushNamed(
                              context,
                              "ProductDetailScreen",
                              arguments: Userdata.products[index],
                            )
                            as bool;
                    // print("$result ${Userdata.products[index].iscart!}");

                    if (result && Userdata.products[index].iscart! == false) {
                      Userdata.products[index].iscart = true;
                      Userdata.cart.add(Userdata.products[index]);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 12),
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
                    child: ListTile(
                      title: Text("${Userdata.products[index].name}"),
                      leading: Hero(
                        tag: 'one',
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            Userdata.products[index].image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        "${Userdata.products[index].desc}",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
