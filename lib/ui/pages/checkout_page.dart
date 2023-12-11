part of './pages.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    TicketData ticketData = Provider.of<TicketData>(context, listen: false);
    UserData userData = Provider.of<UserData>(context);
    int price = 200000 * ticketData.ticket!.seats.length;
    Ticket ticket = ticketData.ticket!;
    Color payColor = userData.data!.wallet! < price
        ? Colors.red
        : Color.fromARGB(255, 248, 30, 67);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 330,
                      child: Image.network(
                        ticket.film.backdropUrl!,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 10,

                      // Tombol Back
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const ShapeDecoration(
                          color: Color.fromARGB(255, 223, 128, 144),
                          shape: CircleBorder(),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          iconSize: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF393E46),
                              Color(0xFF393E46),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                // Kontainer "movie detail"
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          ticket.film.title!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 248, 30, 67),
                            fontFamily: 'Raleway',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Center(
                          child: Text(
                            ticket.film.genres!.join(", "),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        color: const Color.fromARGB(255, 248, 30, 67),
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cinema',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 248, 30, 67),
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Date & Time',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 248, 30, 67),
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                'Seat(s)',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 248, 30, 67),
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ticket.cinema,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 248, 30, 67),
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                ticket.time,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 248, 30, 67),
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                ticket.seats.join(", "),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 248, 30, 67),
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        color: const Color.fromARGB(255, 248, 30, 67),
                        height: 1,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Price',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 248, 30, 67),
                                    fontFamily: 'Raleway',
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  '${ticketData.ticket!.seats.length}x200,000',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 248, 30, 67),
                                    fontFamily: 'Raleway',
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Rp. ${NumberFormat("#,##0", "id_ID").format(price)}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 248, 30, 67),
                                    fontFamily: 'Raleway',
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),

                // Kontainer "user wallet"
                Container(
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, -1),
                    )
                  ]),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: const Color.fromARGB(255, 248, 30, 67),
                                width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.pink,
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                            userData.data!.profile!),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'My Wallet',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 248, 30, 67),
                                          fontFamily: 'Raleway',
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        "Rp. ${NumberFormat("#,##0", "id_ID").format(userData.data!.wallet!)}",
                                        style: TextStyle(
                                          color: payColor,
                                          fontFamily: 'Roboto',
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Fungsi yang akan dijalankan ketika ikon diklik
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return const MyWalletPage();
                                    },
                                  ));
                                },
                                child: ClipOval(
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.pink,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Tombol "Confirm Order"
                      Container(
                        margin: const EdgeInsets.fromLTRB(45, 20, 45, 5),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (!(payColor == Colors.red)) {
                              await ticketData.addToFirestore(
                                  userData.id!,
                                  ticket.film.title!,
                                  ticket.film.thumbnailUrl!,
                                  ticket.film.backdropUrl!,
                                  ticket.cinema,
                                  ticket.time,
                                  ticket.film.genres!,
                                  ticket.film.rating!,
                                  ticket.seats,
                                  price);
                              await userData.updateField(
                                  "wallet", userData.data!.wallet! - price);
                              if (!context.mounted) return;
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) {
                                  return const OrderSuccessPage();
                                },
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                color: payColor,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 270,
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(
                              'Confirm Order',
                              style: TextStyle(
                                color: payColor,
                                fontFamily: 'Raleway',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(
                          visible: payColor == Colors.red,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Not Enough Balance!',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 15,
                                color: Colors.red,
                              ),
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
        ],
      ),
    );
  }
}
