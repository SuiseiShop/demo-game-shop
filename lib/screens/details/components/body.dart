import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/cart_model.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/size_config.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartProvider = new CartProvider();

    int numOfItem = 1;

    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(
                      product: product,
                      callback: (value) => numOfItem = value,
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "add_to_cart".tr,
                          press: () {
                            cartProvider
                                .getCartItemByProduct(product.id)
                                .then((cartItem) {
                              if (cartItem == null) {
                                cartProvider.createCartItem(new CartModel(
                                  productId: product.id,
                                  numOfItem: numOfItem,
                                ));
                              } else {
                                cartItem.numOfItem += numOfItem;
                                cartProvider.editCartItem(cartItem);
                              }
                            });

                            ScaffoldMessenger.of(context)
                                .showSnackBar(new SnackBar(
                              content: Text(
                                  'El producto ha sido añadido a la cesta'),
                              duration: Duration(seconds: 1),
                            ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
