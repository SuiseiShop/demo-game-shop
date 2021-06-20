import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suisei_shop/constants.dart';
import 'package:suisei_shop/models/cart_model.dart';
import 'package:suisei_shop/models/product_model.dart';
import 'package:suisei_shop/providers/cart_provider.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
          List<CartModel> cart = snapshot.data['cart'];
          List<ProductModel> products = snapshot.data['products'];

          return Scaffold(
            appBar: buildAppBar(context, cart),
            body: Body(
              cart: cart,
              products: products,
              callback: (value) => setState(() {
                cart = value['cart'];
                products = value['products'];
              }),
            ),
            bottomNavigationBar: CheckoutCard(cart: cart, products: products),
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
    int numOfItem = 0;
    if (cart != null) numOfItem = cart.length;

    return AppBar(
      title: Column(
        children: [
          Text(
            'cart_screen_title'.tr,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            '$numOfItem ' + 'items'.tr,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
