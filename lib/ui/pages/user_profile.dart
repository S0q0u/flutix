part of 'pages.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<bool> _selections1 = List.generate(13, (index) => false);
  final List<bool> _selections2 = List.generate(8, (index) => false);
  final List<String> _genre = [
    'Drama',
    'thriller',
    'comedy',
    'fantasy',
    'romance',
    'sci-fi',
    'adventure',
    'sports',
    'action',
    'western',
    'horror',
    'musical',
    'mystery'
  ];
  final List<String> _lang = [
    'English',
    'Mandarin',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Russian',
    'Portuguese'
  ];

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> saveSelectedGenres(BuildContext context) async {
    List<String> selectedGenres = [];
    for (int i = 0; i < _selections1.length; i++) {
      if (_selections1[i]) {
        selectedGenres.add(_genre[i]);
      }
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Provider.of<UserData>(context, listen: false).id!)
          .update({
        'genre': selectedGenres,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> saveSelectedLanguage(BuildContext context) async {
    List<String> selectedLanguage = [];
    for (int i = 0; i < _selections2.length; i++) {
      if (_selections2[i]) {
        selectedLanguage.add(_lang[i]);
      }
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Provider.of<UserData>(context, listen: false).id!)
          .update({
        'language': selectedLanguage,
      });
    } catch (e) {
      return;
    }
  }

  Widget buildGenreContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selections1[index] = !_selections1[index];
        });
        saveSelectedGenres(context);
      },
      child: Container(
        height: 100,
        width: 150,
        //margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: _selections1[index] ? Colors.pink : const Color.fromRGBO(34, 35, 53, 1),
        ),
        child: Center(
          child: Text(
            _genre[index],
            style: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLanguageContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selections2[index] = !_selections2[index];
        });
        saveSelectedLanguage(context);
      },
      child: Container(
        height: 100,
        width: 150,
        //margin: const EdgeInsets.only(left: 20, bottom: 20),
        decoration: BoxDecoration(
          color: _selections2[index] ? Colors.pink : const Color.fromRGBO(34, 35, 53, 1),
        ),
        child: Center(
          child: Text(
            _lang[index],
              style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: true,
        // shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              margin: const EdgeInsets.only(left: 10),
              alignment: Alignment.center,
              child: Text(
                "Select Your Fav!",
                style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < _genre.length; i++)
                  buildGenreContainer(i),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: width,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
              alignment: Alignment.center,
              child: Text(
                "Which Movie Language You Prefer?",
                style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < _lang.length; i++)
                  buildLanguageContainer(i),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'Continue to Sign Up',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  Container(
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SuccessPage()),
                        );
                      },
                      mini: true,
                      backgroundColor: const Color.fromRGBO(34, 35, 53, 1),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
