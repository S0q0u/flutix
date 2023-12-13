// ignore_for_file: prefer_const_constructors

part of 'pages.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Ticket ticket = Provider.of<TicketData>(context).ticket!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have succesfuly\nbought the ticket!',
              style: TextStyle(
                color: const Color.fromARGB(255, 248, 30, 67),
                fontFamily: 'Raleway',
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 70),
            Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15), // Radius sudut kiri atas
                      topRight: Radius.circular(15), // Radius sudut kanan atas
                    ),
                    child: Image.network(
                      ticket.film.backdropUrl!,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 30, // Geser teks ke atas sejauh
                    left: 0,
                    right: 0,
                    child: Text(
                      ticket.film.title!,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return TicketDetailPage(
                      ticket: ticket,
                    );
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 248, 30, 67),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Container(
                width: 300,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  'My Ticket',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return const Home();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: const Color.fromARGB(255, 248, 30, 67), width: 1),
                ),
              ),
              child: Container(
                width: 300,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 248, 30, 67),
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
