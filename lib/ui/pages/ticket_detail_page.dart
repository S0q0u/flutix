part of './pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;
  const TicketDetailPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF12302F),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Container(
              width: 393,
              height: 758,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Color(0xFF393E46),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 10),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    width: 393,
                    height: 257.49,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(ticket.film.backdropUrl!),
                        fit: BoxFit.fill,
                      ),
                      border: const Border(
                        bottom: BorderSide(
                          width: 35,
                        ),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 13,
                    top: 15,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: const Color.fromARGB(255, 248, 30, 67),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 66,
                    top: 412,
                    child: Text(
                      'Cinema',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 284,
                    top: 412,
                    child: Text(
                      ticket.cinema,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 66,
                    top: 439,
                    child: Text(
                      'Date & Time',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 244,
                    top: 439,
                    child: Text(
                      ticket.time,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 66,
                    top: 466,
                    child: Text(
                      'Seat(s)',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 23,
                    top: 532,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 556,
                    child: Text(
                      Provider.of<UserData>(context).data!.nama!,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 23,
                    top: 583,
                    child: Text(
                      'Price',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 23,
                    top: 611,
                    child: Text(
                      "Rp. ${NumberFormat("#,##0", "id_ID").format(ticket.harga)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 23,
                    top: 701,
                    child: Text(
                      'Order ID ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 227,
                    top: 696,
                    child: Text(
                      ticket.id,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 260,
                    top: 466,
                    child: Text(
                      ticket.seats.join(", "),
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 66,
                    top: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ticket.film.title!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 248, 30, 67),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ticket.film.genres!.join(", "),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    left: 242,
                    top: 367,
                    child: Text(
                      '4/5',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 66,
                    top: 394,
                    child: Container(
                      width: 260,
                      height: 1,
                      color: const Color.fromARGB(255, 248, 30, 67),
                    ),
                  ),
                  Positioned(
                    top: 512,
                    child: Container(
                      width: 395,
                      height: 1,
                      color: const Color.fromARGB(255, 248, 30, 67),
                    ),
                  ),
                  const Positioned(
                    left: 23,
                    top: 532,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 118,
                    top: 364,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          size: 23,
                          color: Colors.pink,
                        ),
                        Icon(
                          Icons.star,
                          size: 23,
                          color: Colors.pink,
                        ),
                        Icon(
                          Icons.star,
                          size: 23,
                          color: Colors.pinkAccent,
                        ),
                        Icon(
                          Icons.star,
                          size: 23,
                          color: Colors.pink,
                        ),
                        Icon(
                          Icons.star,
                          size: 23,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    left: 227,
                    top: 532,
                    child: SizedBox(
                      width: 119,
                      height: 163,
                      child: Icon(
                        Icons.qr_code,
                        size: 119,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
