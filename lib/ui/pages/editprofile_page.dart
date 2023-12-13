part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool uploadPressed = false;
  //bool backPressed = false;

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
      appBar: AppBar(
        //backgroundColor: selectedTheme.primaryColor,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      //backgroundColor: const Color(0xFF393E46),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [

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
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 22.0,
                      ),
                      hintStyle: const TextStyle(
                          color: Color(0xFFFFFFFF), fontSize: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 30, 67),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 30, 67),
                        ), // Mengubah warna border saat dalam fokus
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
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
                        color: Color.fromARGB(255, 248, 30, 67),
                        fontSize: 22.0,
                      ),
                      hintStyle: const TextStyle(
                          color: Color(0xFFFFFFFF), fontSize: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 30, 67),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 248, 30, 67),
                        ), // Mengubah warna border saat dalam fokus
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color.fromARGB(255, 248, 30, 67),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordHidden = !_isPasswordHidden;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
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
                                border: Border.all(
                                  color: const Color.fromARGB(255, 248, 30, 67),
                                ),
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
                                border: Border.all(
                                  color: const Color.fromARGB(255, 248, 30, 67),
                                ),
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
                            color: Colors.black,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // Mengambil gambar dari galeri
                            final ImagePicker _picker = ImagePicker();
                            XFile? image = await _picker.pickImage(source: ImageSource.gallery);

                            if (image != null) {
                              // Mendapatkan path gambar dari XFile
                              // String imagePath = image.path;
                              setState(() {
                                imagePath = image.path;
                              });

                              // Meng-upload gambar dan mendapatkan URL gambar yang diunggah
                              String imageUrl = await Auth().uploadImage(image);

                              // Mengupdate field 'profile' di Firestore dengan URL gambar baru
                              await Provider.of<UserData>(context, listen: false)
                                  .updateField("profile", imageUrl);

                              // Setelah sukses, perbarui state lokal jika diperlukan
                              setState(() {
                                // Jika ingin mengganti gambar lokal di aplikasi, gunakan line berikut
                                // imagePath = imageUrl;
                                uploadPressed = !uploadPressed;
                              });
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: uploadPressed
                                ? const Color.fromARGB(255, 238, 51, 82)
                                : Color.fromRGBO(253,1,120, 1),
                            foregroundColor:
                                const Color.fromARGB(255, 238, 51, 82),
                            side: BorderSide(
                              width: 1,
                              color: uploadPressed
                                  ? const Color.fromARGB(255, 238, 51, 82)
                                  : const Color.fromARGB(255, 248, 30, 67),
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
                                    ? Colors.white
                                    : Colors.white,
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
                    foregroundColor: const Color.fromARGB(255, 238, 51, 82),
                    backgroundColor: const Color.fromRGBO(253,1,120, 1),
                    padding: const EdgeInsets.symmetric(horizontal: 138.0),
                  ),
                  // onPressed: () async {
                  //   if (_passwordController.text.isEmpty) {
                  //     await userData.updateFieldName("nama", _nameController.text);
                  //     if (imagePath != "") {
                  //       await userData.updateField("profile", imagePath);
                  //     }
                  //     if (!context.mounted) return;
                  //     Navigator.of(context).pop();
                  //   } else {
                  //     await userData.updateField("nama", _nameController.text);
                  //     if (imagePath != "") {
                  //       await userData.updateField("profile", imagePath);
                  //     }
                  //     await userData.changePassword(_passwordController.text);
                  //     if (!context.mounted) return;
                  //     Navigator.of(context).pop();
                  //   }
                  // },
                  onPressed: () async {
                    await userData.updateFieldName("nama", _nameController.text);

                    if (imagePath != "") {
                      await userData.updateField("profile", imagePath);
                    }

                    if (_passwordController.text.isNotEmpty) {
                      await userData.changePassword(_passwordController.text);
                    }

                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                  },

                  child: const Text(
                    "Update",
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
