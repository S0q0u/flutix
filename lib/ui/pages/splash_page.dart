part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashPage> {
  bool signinPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              width: 600,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo2.png"),
                  scale: 2,
                ),
              ),
            ),
            Text("New Experience",
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            const SizedBox(height: 15),
            Text(
              "Watch new movie",
              style: GoogleFonts.raleway(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              "much easier than any before",
              style: GoogleFonts.raleway(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40,),
            Expanded(
              child: Align(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color.fromARGB(255, 227, 0, 106),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const SignUp();
                    }));
                  },
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already has an account? ",
                  style: GoogleFonts.raleway(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      signinPressed = !signinPressed;
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignIn();
                    }));
                  },
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      color: signinPressed
                          ? Color.fromARGB(255, 227, 0, 106)
                          : const Color.fromARGB(255, 227, 0, 106),
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 80),
          ],
        )
      ),
    );
  }
}
