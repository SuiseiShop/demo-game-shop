import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/category_model.dart';

class CategoriesProvider {
  final String _url =
      'suiseishop-9f1ad-default-rtdb.europe-west1.firebasedatabase.app';
  
  Future<bool> createCategory(CategoryModel category) async {
    final url = Uri.https(_url, 'categories.json');
    final resp = await http.post(url, body: categoriesModelToJson(category));
    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<bool> editCategory(CategoryModel category) async {
    final url = Uri.https(_url, 'categories/${category.id}.json');
    final resp = await http.put(url, body: categoriesModelToJson(category));
    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<List<CategoryModel>> loadCategories() async {
    final url = Uri.https(_url, 'categories.json');
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<CategoryModel> categories = [];

    if (decodedData == null) return [];
    decodedData.forEach((id, category) {
      final categoryTemp = CategoryModel.fromJson(category);
      categoryTemp.id = id;

      categories.add(categoryTemp);
    });

    return categories;
  }

  Future<bool> deleteCategory(String id) async {
    final url = Uri.https(_url, 'categories/$id.json');
    final resp = await http.delete(url);

    return true;
  }
}