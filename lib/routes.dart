import 'package:flutter/widgets.dart';
import 'package:suisei_shop/screens/cart/cart_screen.dart';
import 'package:suisei_shop/screens/details/details_screen.dart';
import 'package:suisei_shop/screens/home/home_screen.dart';
import 'package:suisei_shop/screens/profile/profile_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
