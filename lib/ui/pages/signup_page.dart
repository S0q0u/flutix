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
  final TextEditingController _ctrlConf = TextEditingController();
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
    _ctrlConf.dispose();
    super.dispose();
  }

  String imagePath = '';
  
  Future<void> _browseFile() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
        source: ImageSource
            .gallery); 

    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Your Account",
          style: TextStyle(
            fontFamily: 'Raleway',
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
                      radius: 40,
                      backgroundImage: (imagePath.isNotEmpty)
                          ? NetworkImage(imagePath)
                          : null,
                      child: (imagePath.isEmpty)
                          ? const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.black,
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          _browseFile();
                        },
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                          controller: _ctrlNama,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama masih kosong';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
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
                            labelText: 'Email Address',
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
                            vertical: 10, horizontal: 30),
                        width: double.infinity,
                        height: 69,
                        child: Stack(
                          children: [
                            TextFormField(
                              autocorrect: true,
                              controller: _ctrlConf,
                              obscureText: !_isPasswordHidden,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm Password masih kosong';
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
                                labelText: 'Confirm Password',
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
                            horizontal: 30, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                                child: Text(
                              'Continue to Sign Up',
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                            Container(
                              child: FloatingActionButton(
                                onPressed: () {
                                  handleSubmit();
                                },
                                mini: true,
                                backgroundColor:
                                    const Color.fromRGBO(34, 35, 53, 1),
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
    final confPass = _ctrlConf.value.text;
    bool _loading = false;

    setState(() => _loading = true);
    if (password != confPass) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Registrasi Gagal'),
            content: const Text('Password dan Confirm Password tidak cocok.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      setState(() => _loading = false);
      return;
    }

    final UserData userData = Provider.of<UserData>(context, listen: false);
    final Auth _auth = Auth(); // Buat instance dari class Auth

    try {
      Map<String, dynamic> registrationSuccess =
          await _auth.regis(email, password, confPass);

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
    } catch (e) {
      // Tampilkan error dialog=
      return AlertDialog(
        title: const Text('Registrasi Error'),
        content: Text(e.toString()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
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
