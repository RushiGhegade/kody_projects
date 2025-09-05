//
//
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/framework/repository/homerepository/model/productmodel.dart';
import 'package:shopping_app/framework/repository/orderrepository/ui_order_filter.dart';

import '../../repository/homerepository/enums/categories.dart';

// these is main provider how store the all product states that desplay on the screen
final productListProvider = StateNotifierProvider<Product, StoreProduct>((ref) {
  return Product();
});

class Product extends StateNotifier<StoreProduct> {
  Product() : super(StoreProduct(allProducts: [], filterProduct: []));

  // these add the filter
  void addFilterOrder(UiOrderFilter orderFilter) {
    if (orderFilter.name == UiOrderFilter.All.name) {
      getOrderList();

    } else {
      state = state.copyWith(
        filterProduct: [
          ...state.allProducts.where((ele) {
            return (ele.isOrder && ele.orderFilter.name == orderFilter.name);
          }),
        ],
      );
    }
  }

  //search filter text Field call these controller
  void searchFilter(String search) {
    if (search.isEmpty) {
      state = state.copyWith(filterProduct: [...state.allProducts]);
    } else {
      state = state.copyWith(
        filterProduct: [
          ...state.allProducts.where(
            (ele) =>
                ele.productName.toLowerCase().contains(search.toLowerCase()),
          ),
        ],
      );
    }
  }

  // void add homeScreen Filter
  void addFilter(List<Categories> filter) {
    if (filter.contains(Categories.all)) {
      state = state.copyWith(filterProduct: [...state.allProducts]);
    } else {
      state = state.copyWith(
        filterProduct: [
          ...state.allProducts.where((ele) => filter.contains(ele.category)),
        ],
      );
    }
  }

  // price filter
  void addPriceFilter(List<Categories> category, double price, bool isAbove) {
    addFilter(category);

    state = state.copyWith(
      filterProduct: [
        ...state.filterProduct.where((ele) {
          if (isAbove) {
            return ele.productPrice >= price;
          } else {
            return ele.productPrice <= price;
          }
        }),
      ],
    );
  }

  // fetch the filtered list
  void fetchFilterList() {
    state = state.copyWith(filterProduct: [...state.allProducts]);
  }

  // store data
  void addData() {
    state = state.copyWith(allProducts: [...products]);
    fetchFilterList();
  }

  // get add to cart List
  void getAddToCartList() {
    state = state.copyWith(
      filterProduct: [
        ...state.allProducts.where((ele) {
          return ele.addToCart;
        }),
      ],
    );
  }

  // get add to cart List
  void getOrderList() {
    addData();

    state = state.copyWith(
      filterProduct: [
        ...state.allProducts.where((ele) {
          return ele.isOrder;
        }),
      ],
    );
  }

  // add product to add to cart
  void addProductTOCart(String proId, ProductDetails product1) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].productId == product1.productId) {
        products[i].addToCart = true;
        break;
      }
    }

    addData();
    fetchFilterList();
  }


  // add the product quantity in product
  void addProductQuantity(ProductDetails product1, int quantity) {
    if (quantity == 0) {
      for (int i = 0; i < products.length; i++) {
        if (products[i].productId == product1.productId) {
          products[i].addToCart = false;
          break;
        }
      }
    } else {
      for (int i = 0; i < products.length; i++) {
        if (products[i].productId == product1.productId) {
          products[i].quantity = quantity;
          break;
        }
      }
    }

    addData();
  }
}


// these class help to manage the home screen state
class StoreProduct {
  final List<ProductDetails> allProducts;
  final List<ProductDetails> filterProduct;

  StoreProduct({required this.allProducts, required this.filterProduct});

  StoreProduct copyWith({
    List<ProductDetails>? allProducts,
    List<ProductDetails>? filterProduct,
  }) {
    return StoreProduct(
      allProducts: allProducts ?? this.allProducts,
      filterProduct: filterProduct ?? this.filterProduct,
    );
  }
}





List<ProductDetails> products = [
  // watch categories
  ProductDetails(
    productId: "1",
    productName: "Fastrack Limitless Glide X 1.83",
    productDis:
        "Smart Watch with Ultra UV HD Display, SpO2, Heart Rate & Sleep Tracking, Bluetooth Calling, 100+ Sports Modes, 5-Day Battery, Smartwatch for Men & Women (Black)",
    category: Categories.watch,
    productImage: [
      "https://m.media-amazon.com/images/I/61rbYFj7DgL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61dmql3gf2L._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61UvXTHBVgL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61edTSu7IcL._SY450_.jpg",
    ],
    productPrice: 1499,
  ),

  ProductDetails(
    productId: "2",
    productName: "Noise Twist Go Round dial Smartwatch with BT Calling, 1.39",
    productDis:
        " Display, Metal Build, 100+ Watch Faces, IP68, Sleep Tracking, 100+ Sports Modes, 24/7 Heart Rate Monitoring (Elite Black)",
    category: Categories.watch,

    productImage: [
      "https://m.media-amazon.com/images/I/61q0ZgCYoJL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71-kf2reZbL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71EWbmQoiNL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/61s02cHi3tL._SX679_.jpg",
    ],
    productPrice: 1799,
  ),

  ProductDetails(
    productId: "3",
    productName: "Stainless Steel Chain Watch for Men",
    productDis:
        "TIMEWEAR Analog Day Date Functioning Stainless Steel Chain Watch for Men",
    category: Categories.watch,

    productImage: [
      "https://m.media-amazon.com/images/I/81nj6IlZpVL._SY679_.jpg",
      "https://m.media-amazon.com/images/I/716QkxqyjbL._SY679_.jpg",
      "https://m.media-amazon.com/images/I/716QkxqyjbL._SY679_.jpg",
      "https://m.media-amazon.com/images/I/81b4XCIqYxL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/51sKbIrGvkL._SX569_.jpg",
    ],
    productPrice: 379,
  ),

  //mobile cateogies
  ProductDetails(
    productId: "4",
    productName: "Vivo V60 5G",
    productDis:
        "(Mist Gray, 16GB RAM, 512GB Storage) with No Cost EMI/Additional Exchange Offers",
    category: Categories.mobile,

    productImage: [
      "https://m.media-amazon.com/images/I/61eAwV+gq6L._SX569_.jpg",
      "https://m.media-amazon.com/images/I/71PjQULNswL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/71sHsAUMxkL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/81j7k8uPzRL._SX569_.jpg",
    ],
    productPrice: 45999,
  ),

  ProductDetails(
    productId: "5",
    productName: "Samsung Galaxy Z Flip7 5G",
    productDis:
        "Smartphone with Galaxy AI (Coralred, 12GB RAM, 256GB Storage), Ultra Sleek Design with 50MP High-Resolution Camera, Exynos 2500, Google Gemini",
    category: Categories.mobile,

    productImage: [
      "https://m.media-amazon.com/images/I/61WZIwoNvnL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/712FvLpWK4L._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71DIDLTWKCL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/715qieDxIXL._SX679_.jpg",
    ],
    productPrice: 109999,
  ),

  ProductDetails(
    productId: "6",
    productName: "iPhone 16 Pro Max",
    productDis:
        "512 GB: 5G Mobile Phone with Camera Control, 4K 120 fps Dolby Vision and a Huge Leap in Battery Life. Works with AirPods; Natural Titanium",
    category: Categories.mobile,

    productImage: [
      "https://m.media-amazon.com/images/I/61PBLEFPoKL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/61PAfRk2C0L._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71YIi+0qWUL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81d1Ih5UHDL._SX679_.jpg",
    ],
    productPrice: 154900,
  ),

  // Laptop
  ProductDetails(
    productId: "7",
    productName: "acer Travel Lite 14",
    productDis:
        "AMD Ryzen 3-7330U, 16GB RAM, 512GB SSD, 14inch Full HD, UHD Graphics, Premium Metal Body, Windows 11 Pro, MSO 21, 1.34KG, TL14-42M, Thin & Light Laptop",
    category: Categories.laptop,
    productImage: [
      "https://m.media-amazon.com/images/I/51xKQHXurwL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/31cDEALIOkL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/41BhdHYTfvL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/31MX2dyGpFL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/61oogTgo8JL._SX569_.jpg",
    ],
    productPrice: 31800,
  ),
  ProductDetails(
    productId: "8",
    productName: "Lenovo ThinkBook 16 AMD Ryzen",
    productDis:
        "WUXGA IPS 300 Nits Thin & Light Laptop/1Y Warranty/Aluminium Top/1.7kg, 21MWA0BSIN",
    category: Categories.laptop,
    productImage: [
      "https://m.media-amazon.com/images/I/51XpiWaeMQL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/61bNcG36YxL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71WPyvB27sL._SX679_.jpg",
    ],
    productPrice: 46400,
  ),
  ProductDetails(
    productId: "9",
    productName: "HP Pavilion Aero, AMD Ryzen 7",
    productDis:
        "HP Pavilion Aero, AMD Ryzen 7-8840U AI Laptop, 16 Tops (16GB RAM, 512GB SSD), WUXGA 13.3/33.8cm, Win 11, Office 2021, Silver, 1Kg, AMD Radeon Graphics, Ultra-Light, 5MP Camera, bg0017AU",
    category: Categories.laptop,

    productImage: [
      "https://m.media-amazon.com/images/I/71UMSnhgW-L._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81KMhaGhR3L._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81-EG+j1LUL._SX679_.jpg",
    ],
    productPrice: 76990,
  ),

  // sound
  ProductDetails(
    productId: "10",
    productName: "Zebronics Zeb-Warrior",
    productDis:
        "Zebronics Zeb-Warrior 2.0 Multimedia Speaker With Aux Connectivity,USB Powered And Volume Control",
    category: Categories.sound,
    productImage: [
      "https://m.media-amazon.com/images/I/71kIRMs8nQL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/71UBfZZ7ZaL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/71VyyMaFGTL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/81pEKA2ZGxL._SY450_.jpg",
    ],
    productPrice: 699,
  ),

  //airpods
  ProductDetails(
    productId: "11",
    productName: "boAt Airdopes 141/8,",
    productDis:
        "boAt Airdopes 141/8, Low Latency, ENx Tech, 42HRS Battery, Fast Charge, IWP, IPX4, v5.1 Bluetooth Earbuds, TWS Ear Buds Wireless Earphones with mic (Bold Black)",
    category: Categories.airpodes,
    productImage: [
      "https://m.media-amazon.com/images/I/71RFdy6y6LL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61mEqp7RZXL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61FdNwlVUWL._SY450_.jpg",
    ],
    productPrice: 899,
  ),

  // Ac
  ProductDetails(
    productId: "12",
    productName: "Panasonic 1.5 Ton 3 ",
    productDis:
        "Panasonic 1.5 Ton 3 Star Premium Wi-Fi Inverter Smart Split AC (Matter Enabled, Higher Airflow, Copper Condenser, 7in1 Convertible, True AI, 2-Way, PM 0.1 Filter, CS/CU-SU18AKY3W, White)",
    category: Categories.ac,
    productImage: [
      "https://m.media-amazon.com/images/I/51wTTb34FoL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81VYpK9BjwL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71uUreB65OL._SX679_.jpg",
    ],
    productPrice: 35000,
  ),
];


List<ProductDetails> copyList = [

  // watch categories
  ProductDetails(
    productId: "1",
    productName: "Fastrack Limitless Glide X 1.83",
    productDis:
    "Smart Watch with Ultra UV HD Display, SpO2, Heart Rate & Sleep Tracking, Bluetooth Calling, 100+ Sports Modes, 5-Day Battery, Smartwatch for Men & Women (Black)",
    category: Categories.watch,
    productImage: [
      "https://m.media-amazon.com/images/I/61rbYFj7DgL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61dmql3gf2L._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61UvXTHBVgL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61edTSu7IcL._SY450_.jpg",
    ],
    productPrice: 1499,
  ),

  ProductDetails(
    productId: "2",
    productName: "Noise Twist Go Round dial Smartwatch with BT Calling, 1.39",
    productDis:
    " Display, Metal Build, 100+ Watch Faces, IP68, Sleep Tracking, 100+ Sports Modes, 24/7 Heart Rate Monitoring (Elite Black)",
    category: Categories.watch,

    productImage: [
      "https://m.media-amazon.com/images/I/61q0ZgCYoJL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71-kf2reZbL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71EWbmQoiNL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/61s02cHi3tL._SX679_.jpg",
    ],
    productPrice: 1799,
  ),

  ProductDetails(
    productId: "3",
    productName: "Stainless Steel Chain Watch for Men",
    productDis:
    "TIMEWEAR Analog Day Date Functioning Stainless Steel Chain Watch for Men",
    category: Categories.watch,

    productImage: [
      "https://m.media-amazon.com/images/I/81nj6IlZpVL._SY679_.jpg",
      "https://m.media-amazon.com/images/I/716QkxqyjbL._SY679_.jpg",
      "https://m.media-amazon.com/images/I/716QkxqyjbL._SY679_.jpg",
      "https://m.media-amazon.com/images/I/81b4XCIqYxL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/51sKbIrGvkL._SX569_.jpg",
    ],
    productPrice: 379,
  ),

  //mobile cateogies
  ProductDetails(
    productId: "4",
    productName: "Vivo V60 5G",
    productDis:
    "(Mist Gray, 16GB RAM, 512GB Storage) with No Cost EMI/Additional Exchange Offers",
    category: Categories.mobile,

    productImage: [
      "https://m.media-amazon.com/images/I/61eAwV+gq6L._SX569_.jpg",
      "https://m.media-amazon.com/images/I/71PjQULNswL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/71sHsAUMxkL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/81j7k8uPzRL._SX569_.jpg",
    ],
    productPrice: 45999,
  ),

  ProductDetails(
    productId: "5",
    productName: "Samsung Galaxy Z Flip7 5G",
    productDis:
    "Smartphone with Galaxy AI (Coralred, 12GB RAM, 256GB Storage), Ultra Sleek Design with 50MP High-Resolution Camera, Exynos 2500, Google Gemini",
    category: Categories.mobile,

    productImage: [
      "https://m.media-amazon.com/images/I/61WZIwoNvnL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/712FvLpWK4L._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71DIDLTWKCL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/715qieDxIXL._SX679_.jpg",
    ],
    productPrice: 109999,
  ),

  ProductDetails(
    productId: "6",
    productName: "iPhone 16 Pro Max",
    productDis:
    "512 GB: 5G Mobile Phone with Camera Control, 4K 120 fps Dolby Vision and a Huge Leap in Battery Life. Works with AirPods; Natural Titanium",
    category: Categories.mobile,

    productImage: [
      "https://m.media-amazon.com/images/I/61PBLEFPoKL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/61PAfRk2C0L._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71YIi+0qWUL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81d1Ih5UHDL._SX679_.jpg",
    ],
    productPrice: 154900,
  ),

  // Laptop
  ProductDetails(
    productId: "7",
    productName: "acer Travel Lite 14",
    productDis:
    "AMD Ryzen 3-7330U, 16GB RAM, 512GB SSD, 14inch Full HD, UHD Graphics, Premium Metal Body, Windows 11 Pro, MSO 21, 1.34KG, TL14-42M, Thin & Light Laptop",
    category: Categories.laptop,
    productImage: [
      "https://m.media-amazon.com/images/I/51xKQHXurwL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/31cDEALIOkL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/41BhdHYTfvL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/31MX2dyGpFL._SX569_.jpg",
      "https://m.media-amazon.com/images/I/61oogTgo8JL._SX569_.jpg",
    ],
    productPrice: 31800,
  ),
  ProductDetails(
    productId: "8",
    productName: "Lenovo ThinkBook 16 AMD Ryzen",
    productDis:
    "WUXGA IPS 300 Nits Thin & Light Laptop/1Y Warranty/Aluminium Top/1.7kg, 21MWA0BSIN",
    category: Categories.laptop,
    productImage: [
      "https://m.media-amazon.com/images/I/51XpiWaeMQL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/61bNcG36YxL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71WPyvB27sL._SX679_.jpg",
    ],
    productPrice: 46400,
  ),
  ProductDetails(
    productId: "9",
    productName: "HP Pavilion Aero, AMD Ryzen 7",
    productDis:
    "HP Pavilion Aero, AMD Ryzen 7-8840U AI Laptop, 16 Tops (16GB RAM, 512GB SSD), WUXGA 13.3/33.8cm, Win 11, Office 2021, Silver, 1Kg, AMD Radeon Graphics, Ultra-Light, 5MP Camera, bg0017AU",
    category: Categories.laptop,

    productImage: [
      "https://m.media-amazon.com/images/I/71UMSnhgW-L._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81KMhaGhR3L._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81-EG+j1LUL._SX679_.jpg",
    ],
    productPrice: 76990,
  ),

  // sound
  ProductDetails(
    productId: "10",
    productName: "Zebronics Zeb-Warrior",
    productDis:
    "Zebronics Zeb-Warrior 2.0 Multimedia Speaker With Aux Connectivity,USB Powered And Volume Control",
    category: Categories.sound,
    productImage: [
      "https://m.media-amazon.com/images/I/71kIRMs8nQL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/71UBfZZ7ZaL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/71VyyMaFGTL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/81pEKA2ZGxL._SY450_.jpg",
    ],
    productPrice: 699,
  ),

  //airpods
  ProductDetails(
    productId: "11",
    productName: "boAt Airdopes 141/8,",
    productDis:
    "boAt Airdopes 141/8, Low Latency, ENx Tech, 42HRS Battery, Fast Charge, IWP, IPX4, v5.1 Bluetooth Earbuds, TWS Ear Buds Wireless Earphones with mic (Bold Black)",
    category: Categories.airpodes,
    productImage: [
      "https://m.media-amazon.com/images/I/71RFdy6y6LL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61mEqp7RZXL._SY450_.jpg",
      "https://m.media-amazon.com/images/I/61FdNwlVUWL._SY450_.jpg",
    ],
    productPrice: 899,
  ),

  // Ac
  ProductDetails(
    productId: "12",
    productName: "Panasonic 1.5 Ton 3 ",
    productDis:
    "Panasonic 1.5 Ton 3 Star Premium Wi-Fi Inverter Smart Split AC (Matter Enabled, Higher Airflow, Copper Condenser, 7in1 Convertible, True AI, 2-Way, PM 0.1 Filter, CS/CU-SU18AKY3W, White)",
    category: Categories.ac,
    productImage: [
      "https://m.media-amazon.com/images/I/51wTTb34FoL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/81VYpK9BjwL._SX679_.jpg",
      "https://m.media-amazon.com/images/I/71uUreB65OL._SX679_.jpg",
    ],
    productPrice: 35000,
  ),

];