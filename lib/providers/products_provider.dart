import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/product_model.dart';

class ProductsProvider {
  final String _url =
      'suiseishop-9f1ad-default-rtdb.europe-west1.firebasedatabase.app';
  
  Future<bool> createProduct(ProductModel product) async {
    final url = Uri.https(_url, 'products.json');
    final resp = await http.post(url, body: productModelToJson(product));
    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<bool> editProduct(ProductModel product) async {
    final url = Uri.https(_url, 'products/${product.id}.json');
    final resp = await http.put(url, body: productModelToJson(product));
    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    final url = Uri.https(_url, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductModel> products = [];

    if (decodedData == null) return [];
    decodedData.forEach((id, prod) {
      final prodTemp = ProductModel.fromJson(prod);
      prodTemp.id = id;

      products.add(prodTemp);
    });

    return products;
  }

  Future<bool> deleteProduct(String id) async {
    final url = Uri.https(_url, 'products/$id.json');
    final resp = await http.delete(url);

    return true;
  }
}