part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your account preference has \n been saved!',
                style: GoogleFonts.raleway(
                  color: Color.fromARGB(255, 248, 30, 67),
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Container(
                width: 150,
                height: 150,
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
              const SizedBox(height: 50),
              Text(
                'Welcome,',
                style: GoogleFonts.raleway(
                  color: Color.fromARGB(255, 248, 30, 67),
                  fontSize: 25,
                ),
              ),
            Text(
              userData.data!.nama!,
              style: GoogleFonts.raleway(
                  color: Colors.black,
                  fontSize: 24,
                ),
            ),
            const SizedBox(height:90),
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
                  alignment: Alignment.center,
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
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
                      return const UserProfile();
                    },
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 248, 30, 67),
                      width: 1,
                    ),
                  ),
                ),
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Text(
                    'Back',
                    style: GoogleFonts.raleway(
                      color: Color.fromARGB(255, 248, 30, 67),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
