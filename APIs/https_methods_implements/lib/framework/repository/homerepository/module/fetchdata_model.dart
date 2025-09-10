
// To parse this JSON data, do
//
//     final fetchData = fetchDataFromJson(jsonString);

import 'dart:convert';

import 'package:https_methods_implements/framework/repository/homerepository/module/api_error.dart';

List<FetchData> fetchDataFromJson(String str) => List<FetchData>.from(json.decode(str).map((x) => FetchData.fromJson(x)));

String fetchDataToJson(List<FetchData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchData {
  String? id;
  String? name;
  Data? data;
  ApiError? apiError;

  FetchData({
    this.id,
    this.name,
    this.data,
    this.apiError
  });



  factory FetchData.fromJson(Map<String, dynamic> json) => FetchData(
    id: json["id"],
    name: json["name"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "data": data?.toJson(),
  };
}

class Data {
  String? dataColor;
  String? dataCapacity;
  int? capacityGb;
  double? dataPrice;
  String? dataGeneration;
  int? year;
  String? cpuModel;
  String? hardDiskSize;
  String? strapColour;
  String? caseSize;
  String? color;
  String? description;
  String? capacity;
  double? screenSize;
  String? generation;
  String? price;

  Data({
    this.dataColor,
    this.dataCapacity,
    this.capacityGb,
    this.dataPrice,
    this.dataGeneration,
    this.year,
    this.cpuModel,
    this.hardDiskSize,
    this.strapColour,
    this.caseSize,
    this.color,
    this.description,
    this.capacity,
    this.screenSize,
    this.generation,
    this.price,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dataColor: json["color"],
    dataCapacity: json["capacity"],
    capacityGb: json["capacity GB"],
    dataPrice: json["price"]?.toDouble(),
    dataGeneration: json["generation"],
    year: json["year"],
    cpuModel: json["CPU model"],
    hardDiskSize: json["Hard disk size"],
    strapColour: json["Strap Colour"],
    caseSize: json["Case Size"],
    color: json["Color"],
    description: json["Description"],
    capacity: json["Capacity"],
    screenSize: json["Screen size"]?.toDouble(),
    generation: json["Generation"],
    price: json["Price"],
  );

  Map<String, dynamic> toJson() => {
    "color": dataColor,
    "capacity": dataCapacity,
    "capacity GB": capacityGb,
    "price": dataPrice,
    "generation": dataGeneration,
    "year": year,
    "CPU model": cpuModel,
    "Hard disk size": hardDiskSize,
    "Strap Colour": strapColour,
    "Case Size": caseSize,
    "Color": color,
    "Description": description,
    "Capacity": capacity,
    "Screen size": screenSize,
    "Generation": generation,
    "Price": price,
  };
}
