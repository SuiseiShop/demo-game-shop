import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/models/cart_model.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
    this.callback,
    @required this.cart,
    @required this.products,
  }) : super(key: key);

  final Function(Map<String, Object>) callback;

  final List<CartModel> cart;
  final List<ProductModel> products;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final cartProvider = new CartProvider();

  @override
  Widget build(BuildContext context) {
    if (widget.cart != null) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: widget.cart.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(widget.cart[index].id),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                cartProvider.deleteCartItem(widget.cart[index].id);
                setState(() {
                  widget.cart.removeAt(index);
                  widget.products.removeAt(index);
                });
                widget.callback({
                  'cart': widget.cart,
                  'products': widget.products,
                });
              },
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: CartCard(
                  cartItem: widget.cart[index],
                  product: widget.products[index]),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
