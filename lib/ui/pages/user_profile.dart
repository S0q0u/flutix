part of 'pages.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
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

  final ScrollController _scrollContollerOne = ScrollController();
  final ScrollController _scrollContollerTwo = ScrollController();

  @override
  void dispose() {
    _scrollContollerOne.dispose();
    _scrollContollerTwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width - 50;
    var h = MediaQuery.of(context).size.height - 260;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Account Registered!",
          style: TextStyle(
            color: Color.fromARGB(255, 248, 30, 67),
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return const SuccessPage();
                  },
                ));
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Color.fromARGB(255, 248, 30, 67),
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                ),
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              width: w,
              height: h * 2 / 5,
              margin: const EdgeInsets.fromLTRB(25, 35, 25, 23.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: w,
                    height: (h * 2 / 5) * 2 / 5,
                    padding: EdgeInsets.only(right: w / 4),
                    child: const Text(
                      "What's you're into? Let us recommend it for you!",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w,
                    height: (h * 2 / 5) * 3 / 5,
                    child: RawScrollbar(
                      controller: _scrollContollerOne,
                      thumbVisibility: true,
                      trackVisibility: false,
                      thickness: 4,
                      thumbColor: Color.fromARGB(255, 248, 30, 67),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollContollerOne,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 3, crossAxisCount: 3),
                          itemCount: 13,
                          itemBuilder: (BuildContext context, int index) {
                            return LayoutBuilder(
                                builder: (context, constraints) {
                              return ToggleButtons(
                                constraints: BoxConstraints.expand(
                                    width: constraints.maxWidth - 4,
                                    height: constraints.maxHeight - 4),
                                renderBorder: true,
                                color: const Color.fromARGB(255, 248, 30, 67),
                                borderColor:
                                    const Color.fromARGB(255, 248, 30, 67),
                                borderWidth: 1,
                                borderRadius: BorderRadius.circular(25),
                                fillColor: const Color.fromARGB(255, 238, 51, 82),
                                selectedBorderColor:const Color.fromARGB(255, 238, 51, 82),
                                selectedColor: Colors.white,
                                isSelected: [_selections1[index]],
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Text(_genre[index],
                                        style: const TextStyle(fontSize: 12)),
                                  )
                                ],
                                onPressed: (pressIndex) {
                                  setState(() {
                                    if (_selections1[index] == true) {
                                      _selections1[index] = false;
                                    } else {
                                      _selections1[index] = true;
                                    }
                                  });
                                },
                              );
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: w,
              height: h * 2 / 5,
              margin: const EdgeInsets.fromLTRB(25, 20, 25, 86),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: w,
                    height: (h * 2 / 5) * 2 / 5,
                    padding: EdgeInsets.only(right: w / 4),
                    child: const Text(
                      'Which one you Understand? We will filter it!',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: w,
                    height: (h * 2 / 5) * 3 / 5,
                    child: RawScrollbar(
                      controller: _scrollContollerTwo,
                      thumbVisibility: true,
                      trackVisibility: false,
                      thickness: 4,
                      thumbColor: const Color.fromARGB(255, 248, 30, 67),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollContollerTwo,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 3, crossAxisCount: 3),
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return LayoutBuilder(
                                builder: (context, constraints) {
                              return ToggleButtons(
                                constraints: BoxConstraints.expand(
                                    width: constraints.maxWidth - 4,
                                    height: constraints.maxHeight - 4),
                                renderBorder: true,
                                color: const Color.fromARGB(255, 248, 30, 67),
                                borderColor:
                                    const Color.fromARGB(255, 248, 30, 67),
                                borderWidth: 1,
                                borderRadius: BorderRadius.circular(25),
                                fillColor: const Color.fromARGB(255, 238, 51, 82),
                                selectedBorderColor: const Color.fromARGB(255, 238, 51, 82),
                                selectedColor: Colors.white,
                                isSelected: [_selections2[index]],
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Text(_lang[index],
                                        style: const TextStyle(fontSize: 12)),
                                  )
                                ],
                                onPressed: (pressIndex) {
                                  setState(() {
                                    if (_selections2[index] == true) {
                                      _selections2[index] = false;
                                    } else {
                                      _selections2[index] = true;
                                    }
                                  });
                                },
                              );
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: RowButtons(
                width: w,
                height: h,
                onPressedContinue: () {
                  selectedGenres(context);
                  selectedLanguage(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const SuccessPage();
                    },
                  ));
                },
                onPressedBack: () {
                  Auth().signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const SignIn();
                    },
                  ));
                }),
          )
        ],
      ),
    );
  }

  Future<void> selectedGenres(BuildContext context) async {
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
      // Handle error appropriately
    }
  }

  Future<void> selectedLanguage(BuildContext context) async {
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
      // Handle error appropriately
    }
  }
}
