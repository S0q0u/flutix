part of 'pages.dart';

class MyWalletPage extends StatefulWidget {
  const MyWalletPage({Key? key}) : super(key: key);

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  final ScrollController _scrollController = ScrollController();
  int?
      selectedTopUpIndex; // Variabel untuk menyimpan indeks top-up yang dipilih

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> amounts = List.generate(10, (index) => 50000 * (index + 1));
    UserData userDataListen = Provider.of<UserData>(context);
    UserData userData = Provider.of<UserData>(context, listen: false);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: selectedTheme.primaryColor,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'My Wallet',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Kontainer "user wallet"
          Container(
            // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin:
                const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            padding: const EdgeInsets.all(10),
            height: 160,
            color: const Color.fromRGBO(34, 35, 53, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Rp. ${NumberFormat("#,##0", "id_ID").format(userDataListen.data!.wallet)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Available Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          // Container untuk daftar top-up
          Container(
            width: width,
            margin: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
            alignment: Alignment.topLeft,
            child: const Text(
              'Top Up',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Raleway',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                final formattedAmount =
                    NumberFormat("#,##0", "id_ID").format(50000 * (index + 1));
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTopUpIndex = index;
                    });
                  },
                  child: Container(
                    color: selectedTopUpIndex == index
                        ? const Color.fromRGBO(253, 1, 120, 1) // Warna terpilih
                        : Colors.white,
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: selectedTopUpIndex == index
                              ? Colors.white
                              : Colors.green,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Rp. $formattedAmount',
                          style: TextStyle(
                            color: selectedTopUpIndex == index
                                ? Colors.white // Text color when selected
                                : Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Tombol "Confirm Top-Up"
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () async {
                await userData.updateField("wallet",
                    userData.data!.wallet! + amounts[selectedTopUpIndex!]);
                if (!context.mounted) return;
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const TopUpSuccessPage();
                  },
                ));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    // if (states.contains(MaterialState.pressed)) {
                    //   return const Color.fromRGBO(34, 35, 53, 1); // Warna saat tombol ditekan
                    // }
                    return const Color.fromRGBO(
                        253, 1, 120, 1); // Warna default
                  },
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: Container(
                //width: 270,
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: const Text(
                  'Confirm Top-Up',
                  style: TextStyle(
                    // color: Color(0xFF393E46),
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Container(
          //   margin: EdgeInsets.all(10),
          //   child: ElevatedButton.icon(
          //     onPressed: () async {
          //       await userData.updateField("wallet",
          //           userData.data!.wallet! + amounts[selectedTopUpIndex!]);
          //       if (!context.mounted) return;
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) {
          //           return const TopUpSuccessPage();
          //         },
          //       ));
          //     },
          //     style: ElevatedButton.styleFrom(
          //       //backgroundColor: selectedTheme.primaryColor,
          //       minimumSize:
          //       const Size(250, 50), // Atur lebar dan tinggi button
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 10,
          //         horizontal: 16,
          //       ), // Padding di sekitar icon dan teks
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(
          //           15.0, // Mengatur radius untuk membuat button rounded
          //         ),
          //       ),
          //     ),
          //     icon: const Icon(
          //       Icons.add,
          //       color: Colors.white,
          //     ),
          //     label: const Text(
          //       'Confirm Top-Up',
          //       style: TextStyle(
          //         color: Color(0xFF393E46),
          //         fontFamily: 'Raleway',
          //         fontSize: 13,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
