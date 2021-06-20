import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  final cartProvider = new CartProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cartProvider.loadCart(),
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, dynamic>> snapshot,
      ) {
        if (snapshot.hasData) {
          final List<CartModel> cart = snapshot.data['cart'];
          final List<ProductModel> products = snapshot.data['products'];
          return Scaffold(
            appBar: buildAppBar(context, cart),
            body: Body(cart: cart, products: products),
            bottomNavigationBar: CheckoutCard(products: products),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          );
        }
      },
    );
  }

  AppBar buildAppBar(BuildContext context, List<CartModel> cart) {
    return AppBar(
      title: Column(
        children: [
          Text(
            'cart_screen_title'.tr,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '${cart.length} ' + 'items'.tr,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
