part of './pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;
  const TicketDetailPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Ticket',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    ticket.film.backdropUrl!,
                    fit: BoxFit.cover,
                    width: width,
                  ),
                ),
              ),



              Text(
                ticket.film.title!,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Raleway",
                  //fontSize: 20,
                  fontSize: width * 0.06,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 5),

              Text(
                ticket.film.genres!.join(", "),
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Raleway",
                  fontSize: width * 0.04,
                  fontStyle: FontStyle.normal,
                  //fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < 5; i++)
                    Icon(
                      Icons.star,
                      color: i < (ticket.film.rating ?? 0).round()? Colors.yellow : Colors.grey,
                      size: width * 0.04,
                      // ? Color.fromARGB(255, 248, 30, 67)
                    ),
                  Text(
                    '\t\t${(ticket.film.rating ?? 0).round()}/5',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: width * 0.04,
                    ),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 1, // Lebar garis
                color: Colors.black.withOpacity(0.5),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cinema',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Raleway",
                      fontSize: width * 0.04,
                      fontStyle: FontStyle.normal,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Text(
                      ticket.cinema,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Raleway",
                        fontSize: width * 0.04,
                        fontStyle: FontStyle.normal,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date & Time',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Raleway",
                      fontSize: width * 0.04,
                      fontStyle: FontStyle.normal,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Text(
                      ticket.time,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Raleway",
                        fontSize: width * 0.04,
                        fontStyle: FontStyle.normal,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seat(s)',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Raleway",
                      fontSize: width * 0.04,
                      fontStyle: FontStyle.normal,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Text(
                      ticket.seats.join(", "),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Raleway",
                        fontSize: width * 0.04,
                        fontStyle: FontStyle.normal,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              //SizedBox(height: 10),

              Container(
                //color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Raleway",
                              fontSize: width * 0.04,
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Provider.of<UserData>(context).data!.nama!,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Raleway",
                              fontSize: width * 0.04,
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 20),

                          Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Raleway",
                              fontSize: width * 0.04,
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Rp. ${NumberFormat("#,##0", "id_ID").format(ticket.harga)}",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Raleway",
                              fontSize: width * 0.04,
                              fontStyle: FontStyle.normal,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ),
                    Icon(
                      Icons.qr_code_2_sharp,
                      size: width * 0.4,
                    ),
                    // Container(
                    //   //color: Colors.blue,
                    //   alignment: Alignment.centerRight,
                    //   child: Icon(
                    //     Icons.qr_code_2_sharp,
                    //     size: width * 0.4,
                    //   ),
                    // )
                  ],
                ),
              ),

              //SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Raleway",
                      fontSize: width * 0.04,
                      fontStyle: FontStyle.normal,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Text(
                      ticket.id,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Raleway",
                        fontSize: width * 0.04,
                        fontStyle: FontStyle.normal,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
