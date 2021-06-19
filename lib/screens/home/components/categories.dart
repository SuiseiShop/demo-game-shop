import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/providers/categories_provider.dart';

class Categories extends StatelessWidget {
  final categoriesProvider = new CategoriesProvider();

  @override
  Widget build(BuildContext context) {
    //   List<Map<String, dynamic>> categories = [
    //     {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    //     {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    //     {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    //     {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    //     {"icon": "assets/icons/Discover.svg", "text": "More"},
    //   ];

    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: FutureBuilder(
        future: categoriesProvider.loadCategories(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<CategoryModel>> snapshot,
        ) {
          if (snapshot.hasData) {
            final categories = snapshot.data;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                  icon: categories[index].icon,
                  text: categories[index].text,
                  press: () {},
                ),
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
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
