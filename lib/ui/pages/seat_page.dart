part of 'pages.dart';

class Seat extends StatefulWidget {
  const Seat({super.key});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  final List<bool> _selections = List.generate(54, (index) => false);
  final List<bool> _reservations = List.generate(54, (index) => false);
  final List<List<String>> _seat = [[], []];
  bool checkSelected = false;

  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    for (var i = 65; i < 74; i++) {
      _seat[0].addAll(
          List.generate(3, (index) => "${String.fromCharCode(i)}${index + 1}"));
      _seat[1].addAll(
          List.generate(3, (index) => "${String.fromCharCode(i)}${index + 4}"));
    }
    _reservations[0] = true;
    _reservations[30] = true;
    _reservations[40] = true;
    super.initState();
  }

  void seatToggle(int index) {
    setState(() {
      _reservations[index]
          ? null
          : (_selections[index]
              ? _selections[index] = false
              : _selections[index] = true);
    });
  }

  List<String> getSelectedSeats() {
    List<String> selectedSeats = [];

    for (int i = 0; i < _selections.length; i++) {
      if (_selections[i]) {
        selectedSeats.add(_seat[i ~/ 27][i % 27]);
      }
    }

    return selectedSeats;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height - 190;
    Ticket ticket = Provider.of<TicketData>(context, listen: false).ticket!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const SeatAppbar(),
        toolbarHeight: 100,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: width,
                height: 45,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  width: width * 3 / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 248, 30, 67),
                  ),
                  child: const Icon(Icons.laptop_sharp),
                ),
              ),
              Container(
                width: width,
                height: height * 7 / 10 + 45,
                margin: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width,
                      height: 45,
                      child: const Headtitle(
                        text: "Pick your Seat !",
                        size: 12.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width / 2 - 20,
                          height: height * 7 / 10,
                          child: Scrollbar(
                            controller: _scrollController,
                            child: GridView.builder(
                              controller: _scrollController,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.5,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                crossAxisCount: 3,
                              ),
                              itemCount: 27,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 2, left: 2),
                                      color: const Color.fromARGB(
                                          255, 248, 30, 67),
                                    ),
                                    Container(
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                          color: _reservations[index]
                                              ? const Color(0xFF969696)
                                              : Colors.white,
                                          border: Border.all(
                                              color: const Color(0xFF969696),
                                              width: 1)),
                                      child: ToggleButtons(
                                        fillColor: const Color(0xFFDAA520),
                                        selectedColor: Colors.black,
                                        isSelected: [_selections[index]],
                                        children: [
                                          Text(_seat[0][index],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400))
                                        ],
                                        onPressed: (pressIndex) {
                                          seatToggle(index);
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 2 - 20,
                          height: height * 7 / 10,
                          child: Scrollbar(
                            controller: _scrollController2,
                            child: GridView.builder(
                              controller: _scrollController2,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.5,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                crossAxisCount: 3,
                              ),
                              itemCount: 27,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 2, left: 2),
                                      color: const Color.fromARGB(
                                          255, 248, 30, 67),
                                    ),
                                    Container(
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                          color: _reservations[index + 27]
                                              ? const Color(0xFF969696)
                                              : Colors.white,
                                          border: Border.all(
                                              color: const Color(0xFF969696),
                                              width: 1)),
                                      child: ToggleButtons(
                                        fillColor: const Color(0xFFDAA520),
                                        selectedColor: Colors.black,
                                        isSelected: [_selections[index + 27]],
                                        children: [
                                          Text(_seat[1][index],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400))
                                        ],
                                        onPressed: (pressIndex) {
                                          seatToggle(index + 27);
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SeatInfo(
                        color: Colors.white,
                        text: "Available",
                      ),
                      SeatInfo(
                        color: Color(0xFF969696),
                        text: "Unavailabe",
                      ),
                      SeatInfo(
                        color: Color(0xFFDAA520),
                        text: "Selected",
                      ),
                    ],
                  ),
                  RowButtons(
                      width: width,
                      height: height,
                      onPressedBack: () => Navigator.pop(context),
                      onPressedContinue: () {
                        List<String> selectedSeats = getSelectedSeats();

                        if (selectedSeats.isNotEmpty) {
                          ticket.seats = selectedSeats;
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const CheckoutPage();
                            },
                          ));
                        } else {
                          setState(() => checkSelected = true);
                        }
                      }),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              visible: checkSelected,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Pleaase Select First!',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    color: Color(0xffDAA520),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeatInfo extends StatelessWidget {
  const SeatInfo({super.key, required color, required text})
      : _color = color,
        _text = text;

  final Color _color;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1), color: _color),
        ),
        Text(
          _text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 248, 30, 67),
              fontFamily: "Raleway",
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

class SeatAppbar extends StatelessWidget {
  const SeatAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Ticket ticket = Provider.of<TicketData>(context, listen: false).ticket!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          width: 53,
          height: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(ticket.film.thumbnailUrl!),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 29, bottom: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.film.title!,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Color.fromARGB(255, 248, 30, 67),
                    fontFamily: "Raleway",
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  ticket.film.genres!.join(", "),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Raleway",
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "${ticket.cinema} - ${ticket.time}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Raleway",
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }
}
