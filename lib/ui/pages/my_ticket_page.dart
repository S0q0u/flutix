part of 'pages.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'My Ticket',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<TicketData>(context, listen: false).getTicketsFromFirestore(userData.id!),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Error occurred
              debugPrint("Load failed: ${snapshot.error}");
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
                  'No Ticket available.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            } else {
              // Data is available
              List<Ticket> tickets = snapshot.data as List<Ticket>;
              return ListView.builder(
                //controller: controller,
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle the tap event for the Container
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return TicketDetailPage(ticket: tickets[index]);
                        },
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      width: double.infinity,
                      height: 100,
                      color: Color.fromRGBO(34, 35, 53, 1),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  tickets[index].film.thumbnailUrl!),
                                  fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  //tickets[index].film.title,
                                  tickets[index].film.title!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 10),

                                Text(
                                  //tickets[index].film.title,
                                  '${tickets[index].time}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),

                                Text(
                                  //tickets[index].film.title,
                                  '${tickets[index].cinema}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          )
                        ],
                      ),
                    ),

                  );
                }
              );
            }
          }
        ),
      ),
    );
  }
}
