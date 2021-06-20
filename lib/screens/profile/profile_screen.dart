import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suisei_shop/components/coustom_bottom_nav_bar.dart';
import 'package:suisei_shop/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
