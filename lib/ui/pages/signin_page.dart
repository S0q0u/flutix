part of 'pages.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  bool _isPasswordHidden = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  bool loginFailed = false;
  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/logo2.png',
                          scale: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Welcome Back, \nExplorer!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    width: double.infinity,
                    height: 60,
                    child: TextFormField(
                      autocorrect: true,
                      controller: _ctrlEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email masih kosong';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 223, 128, 144),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors
                                .pink, // Warna outline saat dalam keadaan fokus
                            width: 2.0, // Lebar garis
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    width: double.infinity,
                    height: 69,
                    child: Stack(
                      children: [
                        TextFormField(
                          autocorrect: true,
                          controller: _ctrlPassword,
                          obscureText: !_isPasswordHidden,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password masih kosong';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: _togglePasswordVisibility,
                              child: Icon(
                                _isPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 223, 128, 144),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors
                                    .pink, // Warna outline saat dalam keadaan fokus
                                width: 2.0, // Lebar garis
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Visibility(
                      visible: loginFailed,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Incorrect Email or Password',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            color: Color.fromARGB(255, 248, 30, 67),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                            child: Text(
                              'Continue to Sign In',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                        Container(
                          child: FloatingActionButton(
                            onPressed: () {
                              handleSubmit();
                            },
                            mini: true,
                            backgroundColor: const Color.fromRGBO(34, 35, 53, 1),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start fresh now?",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 233, 33, 66),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return false;
    UserData userData = Provider.of<UserData>(context, listen: false);
    final email = _ctrlEmail.value.text;
    final password = _ctrlPassword.value.text;
    Map<String, dynamic> loginSucces = await Auth().login(email, password);

    setState(() {
      if (loginSucces['success']) {
        loginFailed = false;
      } else {
        loginFailed = true;
      }
    });

    if (!loginFailed) {
      userData.userId = loginSucces['userId'];
      await userData.getData();
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const Home();
        },
      ));
    }
    return true;
  }
}
