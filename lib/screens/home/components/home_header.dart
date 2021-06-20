import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = new CartProvider();

    int numOfCartItems = 0;
    int numOfNotif = 0;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          FutureBuilder(
              future: cartProvider.loadCart(),
              builder: (
                BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot,
              ) {
                if (snapshot.hasData) {
                  // final cart = snapshot.data['cart'];
                  // if (cart != null) numOfCartItems = cart.length;
                  return buildCartBtn(numOfCartItems, context);
                } else {
                  return buildCartBtn(numOfCartItems, context);
                }
              }),
          buildNotifBtn(numOfNotif, context),
        ],
      ),
    );
  }

  IconBtnWithCounter buildCartBtn(int numOfCartItems, BuildContext context) {
    return IconBtnWithCounter(
      svgSrc: "assets/icons/Cart Icon.svg",
      numOfitem: numOfCartItems,
      press: () => Navigator.pushNamed(context, CartScreen.routeName),
    );
  }

  IconBtnWithCounter buildNotifBtn(int numOfNotif, BuildContext context) {
    return IconBtnWithCounter(
      svgSrc: "assets/icons/Bell.svg",
      numOfitem: numOfNotif,
      press: () {},
    );
  }
}
