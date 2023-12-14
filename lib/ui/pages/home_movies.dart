part of 'pages.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  final List<String> _genre = [
    'Drama',
    'Thriller',
    'Comedy',
    'Fantasy',
    'Romance',
    'Sci-fi',
    'Adventure',
    'Sports',
    'Action',
    'Western',
    'Horror',
    'Musical'
  ];
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    int totalGenre = _genre.length;
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          width: width,
          margin: const EdgeInsets.only(top: 5, bottom: 10, left: 10),
          alignment: Alignment.topLeft,
          child: const Headtitle(
            text: "Now Playing",
            size: 18.0,
          ),
        ),
        FutureBuilder(
          future: Api.futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Data is still loading
              return Container(
                height: 160,
                child: const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(253,1,120, 1),
                  ),
                ),
              );

            } else if (snapshot.hasError) {
              // Error occurred
              debugPrint("API failed: ${snapshot.error}");
              return Container(
                alignment: Alignment.center,
                child: const Text(
                  'Failed to load data. Please try again later.',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              // No data available
              return Container(
                alignment: Alignment.center,
                child: const Text(
                  'No movies available.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            } else {
              // Data is available
              List<Film> films = snapshot.data as List<Film>;
              return Container(
                //margin: const EdgeInsets.only(top: 10),
                height: 160,
                color: Colors.transparent,
                child: RawScrollbar(
                  controller: _scrollController,
                  thumbColor: const Color.fromRGBO(253,1,120, 1),
                  thumbVisibility: true,
                  trackVisibility: false,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: films.length,
                    itemBuilder: (BuildContext context, int index) {
                      Film film = films[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return MovieDetailPage(
                                film: film,
                              );
                            },
                          ));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 10, bottom: 15),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(film.thumbnailUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),

        Container(
          width: width,
          margin: const EdgeInsets.only(top: 25, bottom: 10, left: 10),
          alignment: Alignment.topLeft,
          child: const Headtitle(
            text: "Movie Category",
            size: 18.0,
          ),
        ),
        Container(
          width: width,
          height: 40,
          color: Colors.transparent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: totalGenre,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 100,
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(34, 35, 53, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    _genre[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Raleway",
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        Container(
          width: width,
          margin: const EdgeInsets.only(top: 25, left: 10, bottom: 10),
          alignment: Alignment.topLeft,
          child: const Headtitle(
            text: "Coming Soon",
            size: 18.0,
          ),
        ),
        Container(
          width: width,
          height: 210,
          color: Colors.transparent,
          child: FutureBuilder<List<Film>>(
            future: Api.futureDataSoon,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  //height: 210,
                  child: const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(253,1,120, 1),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                // If there is an error, display an error message
                return Text('Error: ${snapshot.error}');
              } else {
                // If data is successfully fetched, build the UI with the film information
                List<Film> films = snapshot.data ?? [];

                return RawScrollbar(
                  controller: _scrollController2,
                  thumbColor: const Color.fromRGBO(253,1,120, 1),
                  thumbVisibility: true,
                  trackVisibility: false,
                  child: ListView.builder(
                    controller: _scrollController2,
                    scrollDirection: Axis.horizontal,
                    itemCount: films.length,
                    itemBuilder: (BuildContext context, int index) {
                      Film film = films[index];
                      return Container(
                        margin: const EdgeInsets.only(left: 10, bottom: 15),
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(film.backdropUrl ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(

                              )
                            ),
                            // const SizedBox(
                            //   height: 155,
                            // ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              width: double.infinity,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.white60,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  film.title ?? '',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Raleway",
                                    fontSize: 13,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),

        Container(
          width: width,
          margin: const EdgeInsets.only(top: 25, bottom: 10, left: 10),
          alignment: Alignment.topLeft,
          child: const Headtitle(
            text: "Promo",
            size: 18.0,
          ),
        ),

        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          width: width,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/promo1.png"),
            fit: BoxFit.fill
            )
          ),
        ),

        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          width: width,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/promo1.png"),
                  fit: BoxFit.fill
              )
          ),
        ),

      ],
    );
  }
}
