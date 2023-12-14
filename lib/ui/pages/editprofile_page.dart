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
    double width = MediaQuery.of(context).size.width;
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  (imagePath.isNotEmpty)
                      ? Container(
                    //margin: EdgeInsets.only(left: 20),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: const Color.fromRGBO(253,1,120, 1),
                      ),
                      //borderRadius: BorderRadius.circular(70),
                    ),
                  )
                      : Container(
                    //margin: EdgeInsets.only(left: 20),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(userData.data!.profile!),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: const Color.fromRGBO(253,1,120, 1),
                      ),
                      //borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Pick a Photo!",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () async {
                      // Mengambil gambar dari galeri
                      final ImagePicker _picker = ImagePicker();
                      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

                      if (image != null) {
                        setState(() {
                          imagePath = image.path;
                        });

                        String imageUrl = await Auth().uploadImage(image);

                        await Provider.of<UserData>(context, listen: false)
                            .updateImage("profile", imageUrl);

                        setState(() {
                          uploadPressed = !uploadPressed;
                        });
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: uploadPressed
                          ? const Color.fromRGBO(253,1,120, 1)
                          : Color.fromRGBO(253, 1, 120, 1),
                      foregroundColor: const Color.fromARGB(255, 238, 51, 82),
                      side: BorderSide(
                        width: 1,
                        color: uploadPressed
                            ? const Color.fromRGBO(253,1,120, 1)
                            : const Color.fromRGBO(253,1,120, 1),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      'Upload',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: uploadPressed ? Colors.white : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Input Username",
                        labelText: "Username",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(
                          color: Color.fromRGBO(253,1,120, 1),
                          fontSize: 22.0,
                        ),
                        hintStyle: const TextStyle(
                            color: Color(0xFFFFFFFF), fontSize: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(253,1,120, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(253,1,120, 1),
                          ), // Mengubah warna border saat dalam fokus
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String value) {},
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: _isPasswordHidden,
                      decoration: InputDecoration(
                        hintText: "Input New Password",
                        labelText: "Password",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: const TextStyle(
                          color: Color.fromRGBO(253,1,120, 1),
                          fontSize: 22.0,
                        ),
                        hintStyle: const TextStyle(
                            color: Color(0xFFFFFFFF), fontSize: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(253,1,120, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(253,1,120, 1),
                          ), // Mengubah warna border saat dalam fokus
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color.fromRGBO(253,1,120, 1),
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
                  const SizedBox(height: 20),
                ],
              ),
            )
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            width: width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 238, 51, 82),
                backgroundColor: const Color.fromRGBO(253,1,120, 1),
              ),
              onPressed: () async {
                await userData.updateFieldName("nama", _nameController.text);

                if (imagePath != "") {
                  await userData.updateImage("profile", imagePath);
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
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
