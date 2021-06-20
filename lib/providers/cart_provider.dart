import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/providers/products_provider.dart';

class CartProvider {
  final productsProvider = new ProductsProvider();

  final String _url =
      'suiseishop-9f1ad-default-rtdb.europe-west1.firebasedatabase.app';

  Future<bool> createCartItem(CartModel cartItem) async {
    final url = Uri.https(_url, 'cart.json');
    final resp = await http.post(url, body: cartModelToJson(cartItem));
    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<bool> editCartItem(CartModel cartItem) async {
    final url = Uri.https(_url, 'cart/${cartItem.id}.json');
    final resp = await http.put(url, body: cartModelToJson(cartItem));
    final decodedData = json.decode(resp.body);

    return true;
  }

  Future<CartModel> getCartItemByProduct(String productId) async {
    final cartMap = await loadCart();

    final List<CartModel> cart = cartMap['cart'];
    if (cart != null) {
      for (var i = 0; i < cart.length; i++) {
        if (productId == cart[i].productId) return cart[i];
      }
    }

    return null;
  }

  Future<Map<String, Object>> loadCart() async {
    final url = Uri.https(_url, 'cart.json');
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    final List<CartModel> cart = [];

    if (decodedData == null) return {};
    decodedData.forEach((id, cartItem) {
      final cartItemTemp = CartModel.fromJson(cartItem);
      cartItemTemp.id = id;

      cart.add(cartItemTemp);
    });

    final List<ProductModel> products = [];

    for (var i = 0; i < cart.length; i++) {
      final prodTemp = await productsProvider.getProduct(cart[i].productId);
      products.add(prodTemp);
    }

    return {
      'cart': cart,
      'products': products,
    };
  }

  Future<bool> deleteCartItem(String id) async {
    final url = Uri.https(_url, 'cart/$id.json');
    final resp = await http.delete(url);

    return true;
  }
}
