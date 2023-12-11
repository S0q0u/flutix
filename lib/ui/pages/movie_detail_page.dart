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
    double height = MediaQuery.of(context).size.height;

    // Access film details from the widget parameter
    String title = widget.film.title ?? "";
    List<String> genre = widget.film.genres ?? [];
    String desc = widget.film.desc ?? "";

    return Scaffold(
        body: SingleChildScrollView(
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
                  Container(
                    height: height * 0.06,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black54,
                          Color(0xFF393E46),
                        ],
                      ),
                    ),
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
                    color: Color.fromARGB(255, 223, 128, 144),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Headtitle(text: title, size: 18)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    genre.join(', '),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        Icon(
                          Icons.star,
                          color: i < (widget.film.rating ?? 0).round()
                              ? Color.fromARGB(255, 248, 30, 67)
                              : Colors.grey,
                        ),
                      Text(
                        '\t\t${(widget.film.rating ?? 0).round()}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 248, 30, 67),
                          fontSize: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Headtitle(text: "Stoyline", size: 16)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    desc,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Headtitle(text: "Cast", size: 16)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<List<Cast>>(
                    future: Api.getCastList(widget.film.id.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is being fetched, show a loading indicator
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color.fromARGB(255, 248, 30, 67),
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
                        return SizedBox(
                          height: height * 0.232,
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
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25, left: 5, right: 5),
            padding: const EdgeInsets.all(8.0),
            width: width * 0.95,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                // foregroundColor: const Color(0xFFDAA520),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(255, 248, 30, 67),
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
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class CastCard extends StatelessWidget {
  final Cast cast;

  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Check if cast.picture is not null before using it
          cast.picture != null
              ? Image.network(
                  width: width * 0.2,
                  height: height * 0.15,
                  cast.picture!,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  width: width * 0.2,
                  height: height * 0.15,
                  child: const Icon(Icons.person_3_rounded)),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: width * 0.2,
            height: height * 0.06,
            child: Text(
              // Check if cast.name is not null before using it
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
