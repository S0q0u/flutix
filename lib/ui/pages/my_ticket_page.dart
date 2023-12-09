part of 'pages.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isUsedButtonActive = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void toggleButtons() {
    setState(() {
      isUsedButtonActive = !isUsedButtonActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    final screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
            child: isUsedButtonActive
                ? TicketList(
                    userData: userData,
                    screenSize: screenSize,
                    controller: _scrollController)
                : TicketList(
                    userData: userData,
                    screenSize: screenSize,
                    controller: _scrollController)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                if (!isUsedButtonActive) {
                  toggleButtons();
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(196, 50),
                backgroundColor: isUsedButtonActive
                    ? const Color(0xFFFFDF00)
                    : const Color(0xFFFFDF00),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              child: Text(
                'Upcoming',
                style: TextStyle(
                  color: isUsedButtonActive ? Colors.black : Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isUsedButtonActive) {
                  toggleButtons();
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(196, 50),
                backgroundColor: !isUsedButtonActive
                    ? const Color(0xFFFFDF00)
                    : const Color(0xFFFFDF00),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              child: Text(
                'Used',
                style: TextStyle(
                  color: !isUsedButtonActive ? Colors.black : Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TicketList extends StatelessWidget {
  const TicketList(
      {super.key,
      required this.userData,
      required this.screenSize,
      required this.controller});

  final UserData userData;
  final Size screenSize;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TicketData>(context, listen: false)
          .getTicketsFromFirestore(userData.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Data is still loading
          return Padding(
            padding: EdgeInsets.fromLTRB(
                screenSize.width / 3,
                screenSize.height / 2.5,
                screenSize.width / 3,
                screenSize.height / 2.5),
            child: const CircularProgressIndicator(
              color: Color(0xFFFFDF00),
            ),
          );
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
          return RawScrollbar(
            controller: controller,
            thumbColor: const Color(0xFFFFDF00),
            thumbVisibility: true,
            trackVisibility: false,
            child: ListView.builder(
                controller: controller,
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 16.0, bottom: 2.0),
                    child: TicketTile(
                        width: screenSize.width,
                        ticket: tickets[index],
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return TicketDetailPage(ticket: tickets[index]);
                            },
                          ));
                        }),
                  );
                }),
          );
        }
      },
    );
  }
}
