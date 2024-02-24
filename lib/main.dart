import 'package:flutter/material.dart';
import 'package:move_app/utils/route_utils.dart';
import 'package:move_app/view/screen/bookmyshow_page.dart';
import 'package:move_app/view/screen/details_page.dart';
import 'package:move_app/view/screen/homePage.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detail_page: (context) => const DetailsPage(),
        MyRoutes.bookmyshow_page: (context) => const MyshowPage(),
      },
    );
  }
}
