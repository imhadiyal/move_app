import 'package:move_app/headers.dart';

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
