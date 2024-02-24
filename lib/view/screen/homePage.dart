import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:move_app/utils/movie_utils.dart';

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
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      backgroundColor: Color.fromRGBO(7, 4, 32, 1),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: [
                  ...poster
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.all(10),
                          height: size.height * 0.4,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(3, 3),
                                blurRadius: 15,
                                blurStyle: BlurStyle.solid,
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(e),
                              fit: BoxFit.fill,
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
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              Text(
                "Catagories",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  ...List.generate(
                    allCategories.length,
                    (e) => Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(4),
                      padding: EdgeInsets.all(5),
                      height: size.height * 0.05,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        allCategories[e],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              ...allMovies
                  .map(
                    (e) => Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("details_page", arguments: e);
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: size.height * 0.2,
                              width: size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                image: DecorationImage(
                                  image: NetworkImage(e['Poster']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
