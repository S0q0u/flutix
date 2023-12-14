// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

part of 'pages.dart';

class MovieDetailPage extends StatefulWidget {
  final Film film;

  const MovieDetailPage({Key? key, required this.film}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Access film details from the widget parameter
    String title = widget.film.title ?? "";
    List<String> genre = widget.film.genres ?? [];
    String desc = widget.film.desc ?? "";

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Image.network(
                            widget.film.backdropUrl ?? '',
                            fit: BoxFit.cover,
                            width: width,
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.only(top: 25, left: 10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(253, 1, 120, 0.5),
                          ),
                          width: 40,
                          height: 40,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Raleway",
                            // fontSize: 30,
                            fontSize: width * 0.08,
                            // fontSize: width * 0.018,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          genre.join(', '),
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Raleway',
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < 5; i++)
                              Icon(
                                Icons.star,
                                color: i < (widget.film.rating ?? 0).round()
                                    ? Colors.yellow
                                    : Colors.grey,
                                size: width * 0.04,
                                // ? Color.fromARGB(255, 248, 30, 67)
                              ),
                            Text(
                              '\t\t${(widget.film.rating ?? 0).round()}/5',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.05,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Storyline',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Raleway',
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Text(
                          desc,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Raleway',
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Cast',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Raleway',
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ),

                  FutureBuilder<List<Cast>>(
                    future: Api.getCastList(widget.film.id.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is being fetched, show a loading indicator
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(253,1,120, 1),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        // If there is an error, display an error message
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        // If data is successfully fetched, build the UI with the cast information
                        List<Cast> cast = snapshot.data ?? [];
                        return Container(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cast.length,
                            itemBuilder: (context, index) {
                              return CastCard(cast: cast[index]);
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            padding: const EdgeInsets.all(8.0),
            width: width * 0.95,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // foregroundColor: const Color(0xFFDAA520),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromRGBO(253, 1, 120, 1),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                ),
                onPressed: () {
                  Provider.of<TicketData>(context, listen: false).ticket!.film =
                      widget.film;
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return PlaceAndTimePick();
                    },
                  ));
                },
                child: const Text(
                  "Book",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    //     body: SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       Stack(
    //         children: [
    //           Column(
    //             children: [
    //               Image.network(
    //                 widget.film.backdropUrl ?? '',
    //                 fit: BoxFit.cover,
    //                 width: width,
    //               ),
    //             ],
    //           ),
    //           Container(
    //             color: Colors.transparent,
    //             padding: const EdgeInsets.all(10),
    //             alignment: Alignment.topLeft,
    //             child: Container(
    //               margin: const EdgeInsets.only(top: 25, left: 10),
    //               decoration: const BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color: Color.fromRGBO(253, 1, 120, 0.5),
    //               ),
    //               width: 40,
    //               height: 40,
    //               child: IconButton(
    //                 icon: Icon(
    //                   Icons.arrow_back,
    //                   color: Colors.white,
    //                 ),
    //                 onPressed: () {
    //                   Navigator.of(context).pop();
    //                 },
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Text(
    //               title,
    //               style: TextStyle(
    //                 color: Colors.black,
    //                 fontFamily: "Raleway",
    //                 // fontSize: 30,
    //                 fontSize: width * 0.08,
    //                 // fontSize: width * 0.018,
    //                 fontStyle: FontStyle.normal,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //             SizedBox(height: 10),
    //             Text(
    //               genre.join(', '),
    //               style: TextStyle(
    //                 color: Colors.grey,
    //                 fontFamily: 'Raleway',
    //                 fontSize: width * 0.04,
    //                 fontWeight: FontWeight.normal,
    //               ),
    //               textAlign: TextAlign.center,
    //             ),
    //             SizedBox(height: 8),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 for (int i = 0; i < 5; i++)
    //                   Icon(
    //                     Icons.star,
    //                     color: i < (widget.film.rating ?? 0).round()
    //                         ? Colors.yellow
    //                         : Colors.grey,
    //                     size: width * 0.04,
    //                     // ? Color.fromARGB(255, 248, 30, 67)
    //                   ),
    //                 Text(
    //                   '\t\t${(widget.film.rating ?? 0).round()}/5',
    //                   style: TextStyle(
    //                     color: Colors.grey,
    //                     fontSize: width * 0.05,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Container(
    //                 margin: const EdgeInsets.only(top: 15, bottom: 15),
    //                 alignment: Alignment.centerLeft,
    //                 child: Text(
    //                   'Storyline',
    //                   style: TextStyle(
    //                     color: Colors.black,
    //                     fontFamily: 'Raleway',
    //                     fontSize: width * 0.05,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 )),
    //             Text(
    //               desc,
    //               style: TextStyle(
    //                 color: Colors.black,
    //                 fontFamily: 'Raleway',
    //                 fontSize: width * 0.04,
    //                 fontWeight: FontWeight.normal,
    //               ),
    //               textAlign: TextAlign.justify,
    //             ),
    //             Container(
    //                 margin: const EdgeInsets.only(top: 15, bottom: 15),
    //                 alignment: Alignment.centerLeft,
    //                 child: Text(
    //                   'Cast',
    //                   style: TextStyle(
    //                     color: Colors.black,
    //                     fontFamily: 'Raleway',
    //                     fontSize: width * 0.05,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 )),
    //           ],
    //         ),
    //       ),
    //
    //       FutureBuilder<List<Cast>>(
    //         future: Api.getCastList(widget.film.id.toString()),
    //         builder: (context, snapshot) {
    //           if (snapshot.connectionState == ConnectionState.waiting) {
    //             // While data is being fetched, show a loading indicator
    //             return Center(
    //               child: CircularProgressIndicator(
    //                 color: Color.fromARGB(255, 248, 30, 67),
    //               ),
    //             );
    //           } else if (snapshot.hasError) {
    //             // If there is an error, display an error message
    //             return Center(
    //               child: Text('Error: ${snapshot.error}'),
    //             );
    //           } else {
    //             // If data is successfully fetched, build the UI with the cast information
    //             List<Cast> cast = snapshot.data ?? [];
    //             return Container(
    //               height: 120,
    //               child: ListView.builder(
    //                 scrollDirection: Axis.horizontal,
    //                 itemCount: cast.length,
    //                 itemBuilder: (context, index) {
    //                   return CastCard(cast: cast[index]);
    //                 },
    //               ),
    //             );
    //           }
    //         },
    //       ),
    //
    //       Container(
    //         margin: const EdgeInsets.only(left: 5, right: 5),
    //         padding: const EdgeInsets.all(8.0),
    //         width: width * 0.95,
    //         child: Align(
    //           alignment: Alignment.bottomCenter,
    //           child: ElevatedButton(
    //             style: ElevatedButton.styleFrom(
    //               // foregroundColor: const Color(0xFFDAA520),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //               backgroundColor: const Color.fromRGBO(253, 1, 120, 1),
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
    //             ),
    //             onPressed: () {
    //               Provider.of<TicketData>(context, listen: false).ticket!.film =
    //                   widget.film;
    //               Navigator.of(context).push(MaterialPageRoute(
    //                 builder: (context) {
    //                   return PlaceAndTimePick();
    //                 },
    //               ));
    //             },
    //             child: const Text(
    //               "Book",
    //               style: TextStyle(
    //                 fontFamily: 'Raleway',
    //                 color: Colors.white,
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // )
    );
  }
}

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.cyan,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            child: cast.picture != null
            ? ClipOval(
                child: Image.network(
                  cast.picture!,
                  fit: BoxFit.cover,
                ),
              )
            : Icon(Icons.person_3_rounded),
          ),
          Container(
            width: 80,
            child: Text(
              cast.name ?? 'Unknown',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
