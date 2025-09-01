

import '../assetsFolder/images.dart';
import '../model/my_data.dart';

class StoreData{

 static  List<MyData> products = [
    MyData(name: "Pick and Drop Service", image: Images.package),
    MyData(name: "Laundry \nService", image: Images.shirt),
    MyData(name: "Groceries & Essentials", image:Images.grocery),
    MyData(name: "Food \nDelivery", image:Images.burger),
    MyData(name: "Fruits & Vegetables", image:Images.diet),
    MyData(name: "Medical", image:Images.medicine),
  ];

 static List<MyData> shopInfo = [
   MyData(name: "Get Your \nGroceries Free \nUse Code \nFREEGRO", image:"assets/download.jpg"),
   MyData(name: "Get Your \nGroceries Free \nUse Code \nFREEGRO", image:"assets/image7.jpg"),
   MyData(name: "Get Your \nGroceries Free \nUse Code \nFREEGRO", image:"assets/download.jpg"),
   MyData(name: "Get Your \nGroceries Free \nUse Code \nFREEGRO", image:"assets/image7.jpg"),
 ];

  static List<MyData> newlyRegister = [
    MyData(name: "Macdonald", image: Images.mcdonald),
    MyData(name: "Subway", image: Images.subway),
    MyData(name: "Walmart", image: Images.walmart),
    MyData(name: "Target" ,image: Images.target),
  ];
}