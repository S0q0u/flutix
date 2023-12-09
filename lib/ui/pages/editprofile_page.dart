part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool uploadPressed = false;
  bool backPressed = false;

  String imagePath = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    UserData userData = Provider.of<UserData>(context, listen: false);
    _nameController.text = userData.data!.nama!;
  }

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF393E46),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFDF00),
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Input Username",
                      labelText: "Username",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: const TextStyle(
                        color: Color(0xFFFFDF00),
                        fontSize: 22.0,
                      ),
                      hintStyle: const TextStyle(
                          color: Color(0xFFFFFFFF), fontSize: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(color: Color(0xFFFFDF00)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(
                            color: Color(
                                0xFFFFDF00)), // Mengubah warna border saat dalam fokus
                      ),
                    ),
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                    onChanged: (String value) {},
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _isPasswordHidden,
                    decoration: InputDecoration(
                      hintText: "Input New Password",
                      labelText: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: const TextStyle(
                        color: Color(0xFFFFDF00),
                        fontSize: 22.0,
                      ),
                      hintStyle: const TextStyle(
                          color: Color(0xFFFFFFFF), fontSize: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(color: Color(0xFFFFDF00)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(
                            color: Color(
                                0xFFFFDF00)), // Mengubah warna border saat dalam fokus
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xFFFFDF00),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                    onChanged: (String value) {},
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    (imagePath.isNotEmpty)
                        ? Padding(
                            padding: const EdgeInsets.only(right: 56.0),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(imagePath),
                                    fit: BoxFit.cover),
                                border:
                                    Border.all(color: const Color(0xFFFFDF00)),
                                borderRadius: BorderRadius.circular(
                                    70), // Menjadikan container menjadi bulat
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 56.0),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(userData.data!.profile!),
                                    fit: BoxFit.cover),
                                border:
                                    Border.all(color: const Color(0xFFFFDF00)),
                                borderRadius: BorderRadius.circular(
                                    70), // Menjadikan container menjadi bulat
                              ),
                            ),
                          ),
                    Column(
                      children: [
                        const Text(
                          "Pick a Photo!",
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 13,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            XFile? file = await Provider.of<UserData>(context,
                                    listen: false)
                                .getImage();
                            imagePath = await Auth().uploadImage(file);
                            setState(() {
                              uploadPressed = !uploadPressed;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: uploadPressed
                                ? const Color(0xFFDAA520)
                                : const Color(0xFF393E46),
                            foregroundColor: const Color(0xFFDAA520),
                            side: BorderSide(
                              width: 1,
                              color: uploadPressed
                                  ? const Color(0xFFDAA520)
                                  : const Color(0xFFFFDF00),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            'Upload',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: uploadPressed
                                    ? const Color(0xFF000000)
                                    : const Color(0xFFFFDF00),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFDAA520),
                    backgroundColor: const Color(0xFFFFDF00),
                    padding: const EdgeInsets.symmetric(horizontal: 138.0),
                  ),
                  onPressed: () async {
                    if (_passwordController.text.isEmpty) {
                      await userData.updateField("nama", _nameController.text);
                      if (imagePath != "") {
                        await userData.updateField("profile", imagePath);
                      }
                      if (!context.mounted) return;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const ProfilePage();
                        },
                      ));
                    } else {
                      await userData.updateField("nama", _nameController.text);
                      if (imagePath != "") {
                        await userData.updateField("profile", imagePath);
                      }
                      await userData.changePassword(_passwordController.text);
                      if (!context.mounted) return;
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const ProfilePage();
                        },
                      ));
                    }
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      backPressed = !backPressed;
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backPressed
                        ? const Color(0xFFDAA520)
                        : const Color(0xFF393E46),
                    foregroundColor: const Color(0xFFDAA520),
                    side: BorderSide(
                      width: 1,
                      color: backPressed
                          ? const Color(0xFFDAA520)
                          : const Color(0xFFFFDF00),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 149.0),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: backPressed
                            ? const Color(0xFF000000)
                            : const Color(0xFFFFDF00),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
