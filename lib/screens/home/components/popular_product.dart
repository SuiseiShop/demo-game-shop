import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suisei_shop/constants.dart';
import 'package:suisei_shop/size_config.dart';
import 'package:suisei_shop/providers/products_provider.dart';
import 'package:suisei_shop/components/product_card.dart';
import 'package:suisei_shop/models/product_model.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final productsProvider = new ProductsProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "popular_products_title".tr, press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder(
          future: productsProvider.loadProducts(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<ProductModel>> snapshot,
          ) {
            if (snapshot.hasData) {
              final products = snapshot.data;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      products.length,
                      (index) {
                        if (products[index].isPopular)
                          return ProductCard(product: products[index]);

                        return SizedBox
                            .shrink(); // here by default width and height is 0
                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
