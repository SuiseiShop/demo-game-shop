// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoriesModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoryModel data) =>
    json.encode(data.toJson());

class CategoryModel {
  String id;
  String icon;
  String text;

  CategoryModel({
    this.id,
    this.icon,
    this.text,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(
        id: json["id"],
        icon: json["icon"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "text": text,
      };
}
