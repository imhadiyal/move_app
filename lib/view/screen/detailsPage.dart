import 'package:move_app/headers.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> movie = (ModalRoute.of(context)?.settings.arguments ??
        allMovies[0]) as Map<String, dynamic>;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Book My Show"),
          backgroundColor: const Color.fromRGBO(7, 4, 32, 1),
          foregroundColor: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(7, 4, 32, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: size.height * 0.35,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlay: true,
                ),
                items: List.generate(
                  movie['Images'].length,
                  (index) => Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      // color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(movie['Images'][index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 0),
                      child: Text(
                        movie['Title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //imdb
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: size.height * 0.01),
                        Text(
                          movie['imdbRating'] + "  IMDb",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    //container
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.03,
                          // width: size.width * 0.2,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              movie['Genre'].toString().split(',')[0],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: size.height * 0.01),
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.03,
                          // width: size.width * 0.2,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              movie['Genre']
                                  .toString()
                                  .split(',')[1]
                                  .split(',')[0],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.03,
                          // width: size.width * 0.2,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              movie['Type'].toString().toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Duration    :  " + movie['Runtime'],
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Language  :  " + movie['Language'],
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Released   :  " + movie['Released'],
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Actors        :  " + movie['Actors'],
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: size.height * 0.01),
                        const Divider(),
                        const Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          movie['Plot'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.10),
                    GestureDetector(
                      onTap: () {
                        late SnackBar snackBar;
                        if (favList.contains(movie)) {
                          // favList.remove(movie);
                          snackBar = const SnackBar(
                            content: Text("Already Booked Your SHOW !!"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          );
                        } else {
                          favList.add(movie);
                          snackBar = const SnackBar(
                            content: Text("Book Your SHOW !!"),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          );
                        }
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Container(
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Booking",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
