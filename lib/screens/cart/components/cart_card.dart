import 'package:flutter/material.dart';
import 'package:suisei_shop/constants.dart';
import 'package:suisei_shop/size_config.dart';
import 'package:suisei_shop/models/cart_model.dart';
import 'package:suisei_shop/models/product_model.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cartItem,
    @required this.product,
  }) : super(key: key);

  final CartModel cartItem;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: FadeInImage(
                image: NetworkImage(product.images[0]),
                placeholder: AssetImage('assets/images/loading.gif'),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${product.price}€",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${cartItem.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
