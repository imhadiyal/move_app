import 'package:flutter/material.dart';
import 'package:move_app/utils/route_utils.dart';
import 'package:move_app/view/screen/cartPage.dart';
import 'package:move_app/view/screen/detailsPage.dart';
import 'package:move_app/view/screen/homePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detail_page: (context) => const DetailPage(),
        MyRoutes.bookmyshow_page: (context) => const ShowBook(),
      },
    );
  }
}
