import 'package:flutter/material.dart';
import 'package:demo_game_shop/screens/home/widgets/body.dart';
import 'package:demo_game_shop/widgets/coustom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('DemoGameShop'),
      leading: IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
