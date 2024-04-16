import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:move_app/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 4, 32, 1),
        foregroundColor: Colors.white,
        title: const Text("Home Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  MyRoutes.bookmyshow_page,
                );
              },
              icon: const Icon(CupertinoIcons.tickets_fill),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(7, 4, 32, 1),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: [
                  ...poster
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.all(10),
                          height: size.height * 0.4,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(5, 5),
                                blurRadius: 5,
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(e),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
                options: CarouselOptions(
                  height: size.height * 0.4,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              const Row(
                children: [
                  Text(
                    "ComingSoon",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...comingSoon
                        .map((e) => Container(
                              padding: const EdgeInsets.all(10),
                              margin:
                                  const EdgeInsets.only(bottom: 15, right: 10),
                              height: size.height * 0.15,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(e),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                        .toList(),
                  ],
                ),
              ),
              SizedBox(
                height: size.height,
                width: size.width,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  childAspectRatio: 7 / 11,
                  crossAxisSpacing: 1,
                  padding: const EdgeInsets.all(10),
                  children: allMovies
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("details_page", arguments: e);
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 500,
                                width: size.width,
                                margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Color.fromRGBO(7, 4, 32, 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      e['Title'],
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      e['Runtime'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 250,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(e['Poster']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
