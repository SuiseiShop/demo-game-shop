import 'package:flutter/material.dart';
import 'package:suisei_shop/size_config.dart';
import 'package:suisei_shop/components/coustom_bottom_nav_bar.dart';
import 'package:suisei_shop/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
