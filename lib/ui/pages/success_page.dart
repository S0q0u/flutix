part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your account preferance has \n been saved!',
              style: TextStyle(
                color: Color.fromARGB(255, 248, 30, 67),
                fontFamily: 'Raleway',
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 248, 30, 67),
                  width: 5,
                ),
                image: DecorationImage(
                  image: userData.data!.profile != ""
                      ? NetworkImage(userData.data!.profile!)
                      : const AssetImage('assets/Profile.png')
                          as ImageProvider<Object>,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 80),
            const Text(
              'Welcome,',
              style: TextStyle(
                color: Color.fromARGB(255, 248, 30, 67),
                fontFamily: 'Raleway',
                fontSize: 24,
              ),
            ),
            Text(
              userData.data!.nama!,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return const Home();
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
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    Auth().signOut();
                    return const SignIn();
                  },
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 248, 30, 67), width: 1),
                ),
              ),
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: const Text(
                  'Back',
                  style: TextStyle(
                    color: Color.fromARGB(255, 248, 30, 67),
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
