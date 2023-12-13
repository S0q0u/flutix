part of 'pages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> navMenu = [
      const TicketPage(),
      const Movies(),
      const ProfilePage()
    ];
    return Scaffold(
        appBar: _index == 1
            ? AppBar(
                toolbarHeight: 80,
                title: const HomeAppBarTitle(),
                backgroundColor: Colors.white,
                //backgroundColor: Color.fromRGBO(253,1,120, 1),
                elevation: 0,
                automaticallyImplyLeading: false,
              )
            : null,
        body: navMenu[_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //backgroundColor: const Color.fromARGB(255, 22, 23, 35),
          backgroundColor: const Color.fromRGBO(34, 35, 53, 1),
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color.fromRGBO(253,1,120, 1),
          currentIndex: _index,
          // onTap: ,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number_sharp),
              label: "Ticket",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
        ));
  }
}

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // UserData userDataListen = Provider.of<UserData>(context);
    UserData userData = Provider.of<UserData>(context, listen: true);
    return Row(
      children: [
        Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFF000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                image: DecorationImage(
                  image: NetworkImage(userData.data!.profile!),
                  fit: BoxFit.cover,
                ))),
        const SizedBox(width: 10),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userData.data!.nama!,
                    style: const TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      // fontWeight: FontWeight.w500
                      fontWeight: FontWeight.bold,
                    ),
                    //textAlign: TextAlign.left,
                  ),
                  Text(
                    "Rp. ${NumberFormat("#,##0", "id_ID").format(userData.data!.wallet)}",
                    //"Rp. ${NumberFormat("#,##0", "id_ID").format(userDataListen.data!.wallet)}",
                    style: const TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontFamily: "Roboto",
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      //fontWeight: FontWeight.w400
                    ),
                    //textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset(
                'assets/logo3.png',
                height: 65,
                width: 65,
                fit: BoxFit.fill,
              ),
            )
          ],
        )),

        // Container(
        //   margin: const EdgeInsets.only(left: 15, right: 15),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding: const EdgeInsets.only(top: 5, bottom: 5),
        //         child: Text(
        //           userData.data!.nama!,
        //           style: const TextStyle(
        //               color: Color(0xFF1E1E1E),
        //               fontFamily: "Inter",
        //               fontSize: 12,
        //               fontStyle: FontStyle.normal,
        //               fontWeight: FontWeight.w500),
        //           textAlign: TextAlign.left,
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.only(top: 5, bottom: 5),
        //         child: Text(
        //           "Rp. ${NumberFormat("#,##0", "id_ID").format(userData.data!.wallet)}",
        //           style: const TextStyle(
        //               color: Color(0xFF1E1E1E),
        //               fontFamily: "Roboto",
        //               fontSize: 12,
        //               fontStyle: FontStyle.normal,
        //               fontWeight: FontWeight.w400),
        //           textAlign: TextAlign.left,
        //         ),
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
