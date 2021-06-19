import 'dart:convert';

import 'package:flutter/material.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String id;
  String title;
  String description;
  List<String> images;
  List<int> colors;
  double price;
  double rating;
  bool isFavourite;
  bool isPopular;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.images,
    this.colors,
    this.price,
    this.rating,
    this.isFavourite,
    this.isPopular,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        colors: List<int>.from(json["colors"].map((x) => x)),
        price: json["price"].toDouble(),
        rating: json["rating"].toDouble(),
        isFavourite: json["isFavourite"],
        isPopular: json["isPopular"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "price": price,
        "rating": rating,
        "isFavourite": isFavourite,
        "isPopular": isPopular,
      };
}
