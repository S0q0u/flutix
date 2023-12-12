part of 'pages.dart';

class TopUpSuccessPage extends StatelessWidget {
  const TopUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserClass user = Provider.of<UserData>(context, listen: false).data!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color.fromRGBO(87,163,67, 1),
                    size: 80,
                  ),

                  SizedBox(height: 20),

                  const Text(
                    'You have Successfully',
                    style: TextStyle(
                      //color: Color.fromARGB(255, 248, 30, 67),
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'top-up your balance',
                    style: TextStyle(
                      //color: Color.fromARGB(255, 248, 30, 67),
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 80),

                  const Text(
                    'My Wallet',
                    style: TextStyle(
                      color: Color.fromRGBO(253,1,120, 1),
                      fontFamily: 'Raleway',
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Rp. ${NumberFormat("#,##0", "id_ID").format(user.wallet)}",
                    style: const TextStyle(
                      //color: Color.fromARGB(255, 248, 30, 67),
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  //SizedBox(height: 60),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 20),
            //color: const Color(0xFF393E46),
            child: ElevatedButton(
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
                backgroundColor: Color.fromRGBO(253,1,120, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Container(
                width: 270,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: const Text(
                  'Close',
                  style: TextStyle(
                    //color: Color(0xFFFFDF00),
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
