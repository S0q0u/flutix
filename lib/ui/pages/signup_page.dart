part of 'pages.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String idDocument = '';

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final TextEditingController _ctrlNama = TextEditingController();
  bool _isPasswordHidden = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  @override
  void dispose() {
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    _ctrlNama.dispose();
    super.dispose();
  }

  String imagePath = '';
  bool textFieldEmptyEmail = false;
  bool textFieldEmptyPassword = false;
  bool textFieldEmptyNama = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    bool isButtonPressed = false;
    return Scaffold(
      // backgroundColor: const Color(0xff393e46),
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/logo2.png',
                              scale: 5,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Text(
                                "Welcome to Flutix \nLet's start our journey",
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
                              return 'Nama masih kosong';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Nama',
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
                            vertical: 20, horizontal: 30),
                        width: double.infinity,
                        height: 93,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              width: 20,
                            ),
                            (imagePath.isNotEmpty)
                                ? Container(
                                    width: 98.84,
                                    height: 93,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 248, 30, 67),
                                      ),
                                      borderRadius: BorderRadius.circular(70),
                                    ),
                                  )
                                : Container(
                                    width: 98.84,
                                    height: 93,
                                    decoration: BoxDecoration(
                                      // color: Colors
                                      //     .grey, // Ganti dengan warna latar belakang yang sesuai
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 248, 30, 67),
                                      ),
                                      borderRadius: BorderRadius.circular(70),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.person_add,
                                        size:
                                            40, // Sesuaikan dengan ukuran yang diinginkan
                                        color: Colors
                                            .grey, // Sesuaikan dengan warna ikon yang diinginkan
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: const Text(
                                    'Pick a Photo!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      decoration: TextDecoration.none,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      height: 1.175,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () async {
                                    XFile? file = await Provider.of<UserData>(
                                            context,
                                            listen: false)
                                        .getImage();
                                    imagePath = await Auth().uploadImage(file);

                                    setState(() {});
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    side: const BorderSide(
                                        color: Color.fromARGB(255, 248, 30, 67),
                                        width: 2.0),
                                    fixedSize: const Size(200, 37.64),
                                  ),
                                  child: const Text(
                                    'Upload',
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      height: 1.175,
                                      color: Color.fromARGB(255, 248, 30, 67),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          handleSubmit();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(330, 40),
                        ).merge(
                          ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  isButtonPressed = true;
                                  return const Color.fromARGB(255, 248, 30, 67);
                                } else {
                                  isButtonPressed = false;
                                  return const Color.fromARGB(255, 233, 33, 66);
                                }
                              },
                            ),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.175,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            height: 1.175,
                            color: Color(0xff000000),
                          ),
                          children: [
                            const TextSpan(
                              text: 'Already has an account?',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                height: 1.175,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign In',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 248, 30, 67),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      return const SignIn();
                                    },
                                  ));
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _ctrlEmail.value.text;
    final password = _ctrlPassword.value.text;
    final UserData userData = Provider.of<UserData>(context, listen: false);

    Map<String, dynamic> registrationSuccess =
        await Auth().regis(email, password);

    if (registrationSuccess['success']) {
      String uid = registrationSuccess['userId'];
      // Jika registrasi berhasil, arahkan pengguna ke halaman profil

      userData.userId = uid;
      await userData.addUserToFirestore(
          uid, _ctrlEmail.text, _ctrlNama.text, imagePath);
      await userData.getData();

      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const UserProfile();
        },
      ));
    }
    // Jika registrasi gagal, tampilkan AlertDialog
    else {
      if (!context.mounted) return;
      dialog("Registrasi Gagal");
    }
  }

  void dialog(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup AlertDialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
