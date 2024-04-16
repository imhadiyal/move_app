import 'package:move_app/headers.dart';

class ShowBook extends StatefulWidget {
  const ShowBook({super.key});

  @override
  State<ShowBook> createState() => _ShowBookState();
}

class _ShowBookState extends State<ShowBook> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 4, 32, 1),
        foregroundColor: Colors.white,
        title: const Text('Booked Show'),
      ),
      backgroundColor: const Color.fromRGBO(7, 4, 32, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ...favList.map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          //Image
                          Expanded(
                            flex: 1,
                            child: Container(
                              // height: size.height * 0.6,
                              // width: size.width * 0.35,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    e['Poster'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          //Data
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Title
                                  Text(
                                    e['Title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  //Date
                                  Text(
                                    e['Released'],
                                    style: const TextStyle(),
                                  ),
                                  //Time
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time_filled,
                                      ),
                                      Text(
                                        e['Runtime'],
                                        style: const TextStyle(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  //Genre
                                  Row(
                                    children: [
                                      Text(
                                        e['Genre'].toString().split(',')[0],
                                        style: TextStyle(),
                                      ),
                                      SizedBox(width: size.height * 0.01),
                                      Text(
                                        e['Genre']
                                            .toString()
                                            .split(',')[1]
                                            .split(',')[0],
                                        style: const TextStyle(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.04),
                                  //Cancel

                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        favList.remove(e);
                                        setState(() {});
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
