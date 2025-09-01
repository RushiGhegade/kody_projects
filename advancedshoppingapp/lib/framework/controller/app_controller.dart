

import 'package:advancedshoppingapp/framework/enums/app_enum.dart';
import 'package:advancedshoppingapp/framework/model/about_item.dart';
import 'package:advancedshoppingapp/framework/model/product_details.dart';
import 'package:flutter/cupertino.dart';


class AppController{

  static TextEditingController searchController = TextEditingController();

  static List<ProductDetails> products = [
    // watch categories
    ProductDetails(
        productName:"Fastrack Limitless Glide X 1.83",
        productDis: "Smart Watch with Ultra UV HD Display, SpO2, Heart Rate & Sleep Tracking, Bluetooth Calling, 100+ Sports Modes, 5-Day Battery, Smartwatch for Men & Women (Black)",
        category: Categories.watch,
        rating: 3,
        productImage: [
          "https://m.media-amazon.com/images/I/61rbYFj7DgL._SY450_.jpg",
          "https://m.media-amazon.com/images/I/61dmql3gf2L._SY450_.jpg",
          "https://m.media-amazon.com/images/I/61UvXTHBVgL._SY450_.jpg",
          "https://m.media-amazon.com/images/I/61edTSu7IcL._SY450_.jpg"
        ],
        productPrice: 1499,
    ),

    ProductDetails(
      productName:"Noise Twist Go Round dial Smartwatch with BT Calling, 1.39",
      productDis: " Display, Metal Build, 100+ Watch Faces, IP68, Sleep Tracking, 100+ Sports Modes, 24/7 Heart Rate Monitoring (Elite Black)",
      category: Categories.watch,
      isFavorite: true,
      productImage: [
        "https://m.media-amazon.com/images/I/61q0ZgCYoJL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/71-kf2reZbL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/71EWbmQoiNL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/61s02cHi3tL._SX679_.jpg"
      ],
      productPrice:1799,
    ),

    ProductDetails(
      productName:"Stainless Steel Chain Watch for Men",
      productDis: "TIMEWEAR Analog Day Date Functioning Stainless Steel Chain Watch for Men",
      category: Categories.watch,
      rating: 4,
      productImage: [
          "https://m.media-amazon.com/images/I/81nj6IlZpVL._SY679_.jpg",
          "https://m.media-amazon.com/images/I/716QkxqyjbL._SY679_.jpg",
        "https://m.media-amazon.com/images/I/716QkxqyjbL._SY679_.jpg",
        "https://m.media-amazon.com/images/I/81b4XCIqYxL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/51sKbIrGvkL._SX569_.jpg"
      ],
      productPrice:379,
    ),

    //mobile cateogies
    ProductDetails(
      productName:"Vivo V60 5G",
      productDis: "(Mist Gray, 16GB RAM, 512GB Storage) with No Cost EMI/Additional Exchange Offers",
      category: Categories.mobile,
      rating: 4,
      productImage: [
          "https://m.media-amazon.com/images/I/61eAwV+gq6L._SX569_.jpg",
        "https://m.media-amazon.com/images/I/71PjQULNswL._SX569_.jpg",
        "https://m.media-amazon.com/images/I/71sHsAUMxkL._SX569_.jpg",
        "https://m.media-amazon.com/images/I/81j7k8uPzRL._SX569_.jpg"
      ],
      productPrice:45999,
    ),

    ProductDetails(
      productName:"Samsung Galaxy Z Flip7 5G",
      productDis: "Smartphone with Galaxy AI (Coralred, 12GB RAM, 256GB Storage), Ultra Sleek Design with 50MP High-Resolution Camera, Exynos 2500, Google Gemini",
      category: Categories.mobile,
      isFavorite: true,
      productImage: [
          "https://m.media-amazon.com/images/I/61WZIwoNvnL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/712FvLpWK4L._SX679_.jpg",
        "https://m.media-amazon.com/images/I/71DIDLTWKCL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/715qieDxIXL._SX679_.jpg"
      ],
      productPrice:109999,
    ),

    ProductDetails(
      productName:"iPhone 16 Pro Max",
      productDis: "512 GB: 5G Mobile Phone with Camera Control, 4K 120 fps Dolby Vision and a Huge Leap in Battery Life. Works with AirPods; Natural Titanium",
      category: Categories.mobile,
      rating: 5,
      productImage: [
          "https://m.media-amazon.com/images/I/61PBLEFPoKL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/61PAfRk2C0L._SX679_.jpg",
        "https://m.media-amazon.com/images/I/71YIi+0qWUL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/81d1Ih5UHDL._SX679_.jpg"
      ],
      productPrice:154900,
    ),



    // Laptop
    ProductDetails(
      productName:"acer Travel Lite 14",
      productDis: "AMD Ryzen 3-7330U, 16GB RAM, 512GB SSD, 14inch Full HD, UHD Graphics, Premium Metal Body, Windows 11 Pro, MSO 21, 1.34KG, TL14-42M, Thin & Light Laptop",
      aboutItem: AboutItem(brand: "acer", model: "Travel Lite", screen: "14 Inches", colour: "Silver", operatingSystem: "Windows 11 Pro"),
      category: Categories.laptop,
      rating: 3,
      productImage: [
        "https://m.media-amazon.com/images/I/51xKQHXurwL._SX569_.jpg",
        "https://m.media-amazon.com/images/I/31cDEALIOkL._SX569_.jpg",
        "https://m.media-amazon.com/images/I/41BhdHYTfvL._SX569_.jpg",
        "https://m.media-amazon.com/images/I/31MX2dyGpFL._SX569_.jpg",
        "https://m.media-amazon.com/images/I/61oogTgo8JL._SX569_.jpg"
      ],
      productPrice:31800,
    ),
    ProductDetails(
      productName:"Lenovo ThinkBook 16 AMD Ryzen",
      productDis: "WUXGA IPS 300 Nits Thin & Light Laptop/1Y Warranty/Aluminium Top/1.7kg, 21MWA0BSIN",
      aboutItem: AboutItem(brand: "	Lenovo", model: "ThinkBook 16", screen: "16 Inches", colour: "Dark Silver", operatingSystem: "Windows 11 Home"),
      category: Categories.laptop,
      isFavorite: true,
      rating: 4,
      productImage: [
        "https://m.media-amazon.com/images/I/51XpiWaeMQL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/61bNcG36YxL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/71WPyvB27sL._SX679_.jpg",
      ],
      productPrice:46400,
    ),
    ProductDetails(
      productName:"HP Pavilion Aero, AMD Ryzen 7",
      productDis: "HP Pavilion Aero, AMD Ryzen 7-8840U AI Laptop, 16 Tops (16GB RAM, 512GB SSD), WUXGA 13.3/33.8cm, Win 11, Office 2021, Silver, 1Kg, AMD Radeon Graphics, Ultra-Light, 5MP Camera, bg0017AU",
      category: Categories.laptop,
      aboutItem: AboutItem(brand: "	HP", model: "ThinkBook 16", screen: "16 Inches", colour: "Dark Silver", operatingSystem: "Windows 11 Home"),

      productImage: [
          "https://m.media-amazon.com/images/I/71UMSnhgW-L._SX679_.jpg",
        "https://m.media-amazon.com/images/I/81KMhaGhR3L._SX679_.jpg",
        "https://m.media-amazon.com/images/I/81-EG+j1LUL._SX679_.jpg"
      ],
      productPrice:76990,
    ),





    // sound
    ProductDetails(
      productName:"Zebronics Zeb-Warrior",
      productDis: "Zebronics Zeb-Warrior 2.0 Multimedia Speaker With Aux Connectivity,USB Powered And Volume Control",
      category: Categories.sound,
      isFavorite: true,
      rating: 5,
      aboutItem: AboutItem(brand:"ZEBRONICS", model: "Stereo", screen: "15", colour: "black", operatingSystem: "Auxiliary, USB"),
      productImage: [
          "https://m.media-amazon.com/images/I/71kIRMs8nQL._SY450_.jpg",
        "https://m.media-amazon.com/images/I/71UBfZZ7ZaL._SY450_.jpg",
        "https://m.media-amazon.com/images/I/71VyyMaFGTL._SY450_.jpg",
        "https://m.media-amazon.com/images/I/81pEKA2ZGxL._SY450_.jpg"
      ],
      productPrice:699,
    ),

    //airpods
    ProductDetails(
      productName:"boAt Airdopes 141/8,",
      productDis: "boAt Airdopes 141/8, Low Latency, ENx Tech, 42HRS Battery, Fast Charge, IWP, IPX4, v5.1 Bluetooth Earbuds, TWS Ear Buds Wireless Earphones with mic (Bold Black)",
      category: Categories.airdopes,
      rating: 4,
      aboutItem: AboutItem(brand:"boAt" , model: "boat", screen: "141 a", colour: "Bold Black", operatingSystem: "Active Noise Cancellation"),
      productImage: [
          "https://m.media-amazon.com/images/I/71RFdy6y6LL._SY450_.jpg",
        "https://m.media-amazon.com/images/I/61mEqp7RZXL._SY450_.jpg",
        "https://m.media-amazon.com/images/I/61FdNwlVUWL._SY450_.jpg"
      ],
      productPrice:899,
    ),

    // Ac
    ProductDetails(
      productName:"Panasonic 1.5 Ton 3 ",
      productDis: "Panasonic 1.5 Ton 3 Star Premium Wi-Fi Inverter Smart Split AC (Matter Enabled, Higher Airflow, Copper Condenser, 7in1 Convertible, True AI, 2-Way, PM 0.1 Filter, CS/CU-SU18AKY3W, White)",
      category: Categories.ac,
      rating: 5,
      aboutItem: AboutItem(brand: "Panasonic", model: "‎CS/CU-SU18AKY3W", screen: "‎1.5 Tons", colour: "White", operatingSystem: "No"),
      productImage: [
          "https://m.media-amazon.com/images/I/51wTTb34FoL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/81VYpK9BjwL._SX679_.jpg",
        "https://m.media-amazon.com/images/I/71uUreB65OL._SX679_.jpg"
      ],
      productPrice:35000,
    ),
  ];
}