import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.id,
    this.numOfItem,
    this.productId,
  });

  String id;
  String productId;
  int numOfItem;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        numOfItem: json["numOfItem"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "numOfItem": numOfItem,
        "product_id": productId,
      };
}
