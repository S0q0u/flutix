part of 'pages.dart';

class PlaceAndTimePick extends StatefulWidget {
  const PlaceAndTimePick({super.key});

  @override
  State<PlaceAndTimePick> createState() => _PlaceAndTimePickState();
}

class _PlaceAndTimePickState extends State<PlaceAndTimePick> {
  final List<bool> _selectionsCinema = List.generate(6, (index) => false);
  final List<bool> _selectionsDay = List.generate(7, (index) => false);
  final List<bool> _selectionsTime = List.generate(8, (index) => false);

  final List<String> _location = [
    'BIG MALL PREMIERE',
    'BIG MALL XXI',
    'SCP PREMIERE',
    'SCP XXI',
    'PLAZA MULIA CGV',
    'CITY CENTRUM XXI',
  ];

  final List<String> _day = [
    'SENIN',
    'SELASA',
    'RABU',
    'KAMIS',
    'JUMAT',
    'SABTU',
    'MINGGU',
  ];

  final List<String> _time = [
    '08:00',
    '10.00',
    '12.00',
    '14.00',
    '16:00',
    '18.00',
    '20.00',
    '22.00',
  ];

  final ScrollController _scrollContollerOne = ScrollController();
  final ScrollController _scrollContollerTwo = ScrollController();
  final ScrollController _scrollContollerThree = ScrollController();

  bool uploadPressed = false;
  bool backPressed = false;
  bool checkSelected = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Ticket ticket = Provider.of<TicketData>(context, listen: false).ticket!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          ticket.film.title!,
          style: const TextStyle(
            fontFamily: 'Raleway',
            color: Colors.black,
            //fontSize: 15,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: width,
                    margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Cinema',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    //width: w,
                    height: 120,
                    child: RawScrollbar(
                      controller: _scrollContollerOne,
                      thumbVisibility: true,
                      trackVisibility: false,
                      thickness: 4,
                      thumbColor: const Color.fromRGBO(253,1,120, 1),
                      //radius: const Radius.circular(20),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return LayoutBuilder(builder: (context, constraints) {
                            return Container(
                              margin: const EdgeInsets.only(left: 10, bottom: 15),
                              child: ToggleButtons(
                                //color: Colors.black,
                                //borderColor: const Color(0xFF969696),
                                //borderWidth: 1,
                                borderRadius: BorderRadius.circular(10),
                                // fillColor: const Color.fromARGB(255, 238, 51, 82),
                                // selectedBorderColor: const Color(0xFF969696),
                                // selectedColor: const Color.fromRGBO(253,1,120, 1),
                                //renderBorder: true,
                                isSelected: [_selectionsCinema[index]],
                                children: [
                                  Container(
                                    width: 100,
                                    height: 250,
                                    color: _selectionsCinema[index]
                                        ? const Color.fromRGBO(253,1,120, 1)
                                        : const Color.fromRGBO(34, 35, 53, 1),
                                    child: Center(
                                      child: Column(
                                        // Mengganti dengan Row untuk menambahkan ikon dan teks secara horizontal
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.place,
                                            // color: _selectionsCinema[index]
                                            //     ? Colors.white
                                            //     : Colors.pink
                                            color: Colors.white,
                                          ),
                                          const SizedBox(height: 7),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              _location[index],
                                              style: const TextStyle(
                                                fontFamily: 'Raleway',
                                                fontSize: 10,
                                                // color: _selectionsCinema[index]
                                                //     ? Colors.white
                                                //     : Colors.black,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                onPressed: (pressIndex) {
                                  setState(() {
                                    if (_selectionsCinema[index] == true) {
                                      _selectionsCinema[index] = false;
                                    } else {
                                      for (int i = 0;
                                      i < _selectionsCinema.length;
                                      i++) {
                                        _selectionsCinema[i] = false;
                                      }
                                      _selectionsCinema[index] = true;
                                    }
                                  });
                                },
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),

                  // Konten Scroll 2
                  Container(
                    width: width,
                    margin: const EdgeInsets.only(left: 10, bottom: 10, top: 25),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Date',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 100,
                    child: RawScrollbar(
                      controller: _scrollContollerTwo,
                      thumbVisibility: true,
                      trackVisibility: false,
                      thickness: 4,
                      thumbColor: const Color.fromRGBO(253,1,120, 1),
                      //radius: const Radius.circular(20),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return LayoutBuilder(builder: (context, constraints) {
                            return Container(
                              margin: const EdgeInsets.only(left: 10, bottom: 15),
                              child : ToggleButtons(
                                borderRadius: BorderRadius.circular(10),
                                isSelected: [_selectionsDay[index]],
                                children: [
                                  Container(
                                    width: 80,
                                    height: 200,
                                    color: _selectionsDay[index]
                                        ? const Color.fromRGBO(253,1,120, 1)
                                        : const Color.fromRGBO(34, 35, 53, 1),
                                    child: Center(
                                      child: Column(
                                        // Mengganti dengan Row untuk menambahkan ikon dan teks secara horizontal
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _day[index],
                                            style: const TextStyle(
                                              fontFamily: 'Raleway',
                                              fontSize: 12,
                                              // color: _selectionsDay[index]
                                              //     ? Colors.black
                                              //     : Colors.white,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 7),
                                          Text(
                                            "0${index + 1}", // Menampilkan angka 1 sampai 7
                                            style: const TextStyle(
                                              fontFamily: 'Raleway',
                                              fontSize: 12,
                                              // color: _selectionsDay[index]
                                              //     ? Colors.black
                                              //     : Colors.white,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                onPressed: (pressIndex) {
                                  setState(() {
                                    if (_selectionsDay[index] == true) {
                                      _selectionsDay[index] = false;
                                    } else {
                                      for (int i = 0;
                                      i < _selectionsDay.length;
                                      i++) {
                                        _selectionsDay[i] = false;
                                      }
                                      _selectionsDay[index] = true;
                                    }
                                  });
                                },
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),

                  // Konten Scroll 3
                  Container(
                    width: width,
                    margin: const EdgeInsets.only(left: 10, bottom: 10, top: 25),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Screen Time',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 60,
                    child: RawScrollbar(
                      controller: _scrollContollerThree,
                      thumbVisibility: true,
                      trackVisibility: false,
                      thickness: 4,
                      thumbColor: const Color.fromRGBO(253,1,120, 1),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return LayoutBuilder(builder: (context, constraints) {
                            return Container(
                              margin: const EdgeInsets.only(left: 10, bottom: 15),
                              child : ToggleButtons(
                                borderRadius: BorderRadius.circular(10),
                                isSelected: [_selectionsTime[index]],
                                children: [
                                  Container(
                                    width: 100,
                                    height: 60,
                                    color: _selectionsTime[index]
                                        ? const Color.fromRGBO(253,1,120, 1)
                                        : const Color.fromRGBO(34, 35, 53, 1),
                                    child: Center(
                                      child: Text(
                                        _time[index],
                                        style: const TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                                onPressed: (pressIndex) {
                                  setState(() {
                                    if (_selectionsTime[index] == true) {
                                      _selectionsTime[index] = false;
                                    } else {
                                      for (int i = 0;
                                      i < _selectionsTime.length;
                                      i++) {
                                        _selectionsTime[i] = false;
                                      }
                                      _selectionsTime[index] = true;
                                    }
                                  });
                                },
                              ),

                            );
                          });
                        },
                      ),
                    ),
                  ),

                  // const SizedBox(height: 50),
                  //
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     foregroundColor: const Color.fromARGB(255, 238, 51, 82),
                  //     backgroundColor: const Color.fromARGB(255, 248, 30, 67),
                  //     padding: const EdgeInsets.symmetric(horizontal: 115.0),
                  //   ),
                  //   onPressed: () {
                  //     late String cinema;
                  //     late String time;
                  //     List<bool> check = [false, false, false];
                  //     for (int i = 0; i < _selectionsCinema.length; i++) {
                  //       if (_selectionsCinema[i] == true) {
                  //         cinema = _location[i];
                  //         check[0] = true;
                  //         break;
                  //       }
                  //     }
                  //     for (int i = 0; i < _selectionsDay.length; i++) {
                  //       if (_selectionsDay[i] == true) {
                  //         time = _day[i];
                  //         check[1] = true;
                  //         break;
                  //       }
                  //     }
                  //     for (int i = 0; i < _selectionsTime.length; i++) {
                  //       if (_selectionsTime[i] == true) {
                  //         time += ", ${_time[i]}";
                  //         check[2] = true;
                  //         break;
                  //       }
                  //     }
                  //     if (!check.contains(false)) {
                  //       ticket.cinema = cinema;
                  //       ticket.time = time;
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //         builder: (context) {
                  //           return const Seat();
                  //         },
                  //       ));
                  //     } else {
                  //       setState(() => checkSelected = true);
                  //     }
                  //   },
                  //   child: const Text(
                  //     "Continue",
                  //     style: TextStyle(
                  //         fontFamily: 'Raleway',
                  //         color: Colors.white,
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold
                  //     ),
                  //   ),
                  // ),
                  //
                  //
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //   child: Visibility(
                  //     visible: checkSelected,
                  //     child: const Align(
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         'Please Select First!',
                  //         style: TextStyle(
                  //           fontFamily: 'Raleway',
                  //           fontSize: 15,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ),


          Container(
            //color: Colors.orange,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    'Select Your Seat',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(34, 35, 53, 1),
                  ),
                  width: 60,
                  height: 60,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      late String cinema;
                      late String time;
                      List<bool> check = [false, false, false];
                      for (int i = 0; i < _selectionsCinema.length; i++) {
                        if (_selectionsCinema[i] == true) {
                          cinema = _location[i];
                          check[0] = true;
                          break;
                        }
                      }
                      for (int i = 0; i < _selectionsDay.length; i++) {
                        if (_selectionsDay[i] == true) {
                          time = _day[i];
                          check[1] = true;
                          break;
                        }
                      }
                      for (int i = 0; i < _selectionsTime.length; i++) {
                        if (_selectionsTime[i] == true) {
                          time += ", ${_time[i]}";
                          check[2] = true;
                          break;
                        }
                      }
                      if (!check.contains(false)) {
                        ticket.cinema = cinema;
                        ticket.time = time;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const Seat();
                          },
                        ));
                      } else {
                        setState(() => checkSelected = true);
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
