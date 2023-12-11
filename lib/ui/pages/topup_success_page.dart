part of 'pages.dart';

class TopUpSuccessPage extends StatelessWidget {
  const TopUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserClass user = Provider.of<UserData>(context, listen: false).data!;
    return Scaffold(
      backgroundColor: const Color(0xFF393E46),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You have Successfully',
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 30, 67),
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'top-up your balance',
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 30, 67),
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: const Color.fromARGB(255, 248, 30, 67),
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Row(
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
                                child: Image.network(user.profile!),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'My Wallet',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 248, 30, 67),
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Rp. ${NumberFormat("#,##0", "id_ID").format(user.wallet)}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 248, 30, 67),
                                  fontFamily: 'Roboto',
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 2,
            thickness: 1,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 165),
              color: const Color(0xFF393E46),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 248, 30, 67),
                      foregroundColor: const Color.fromARGB(255, 238, 51, 82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Container(
                      width: 270,
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: const Text(
                        'My Wallet',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Home();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color.fromARGB(255, 238, 51, 82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 248, 30, 67),
                          width: 2,
                        ),
                      ),
                    ),
                    child: Container(
                      width: 270,
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          color: Color(0xFFFFDF00),
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
          ),
        ],
      ),
    );
  }
}
