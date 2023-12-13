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
          // const SizedBox(height: 40),
          const Text("New Experience",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          const SizedBox(height: 15),
          const Text(
            "Watch new movie",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const Text(
            "much easier than any before",
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Align(
              // alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // foregroundColor: const Color(0xFFDAA520),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color(0xFFFD0178),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUp();
                  }));
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      fontFamily: 'Raleway',
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
              const Text(
                "Already has an account? ",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              InkWell(
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Raleway',
                    color: signinPressed
                        ? Color.fromARGB(255, 227, 0, 106)
                        : const Color(0xFFFD0178),
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 80),
        ],
      )),
    );
  }
}
