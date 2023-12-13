part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context, listen: false);
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 248, 30, 67),
                      ),
                      child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(userData.data!.profile!)),
                    ),
                    const SizedBox(height: 200),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Text(
                        userData.data!.nama!,
                        style: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Daftar menu profile
        Container(
          color: Colors.white,
          child: Column(
            children: [
              const Divider(
                  height: 0,
                  color: Color(0xFF888888),
                  thickness:
                      0.2), // Garis atas sebelum "Edit Profile" (dengan ketebalan 2)
              MenuItem(
                Icons.person,
                'Edit Profile',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const EditProfilePage();
                    },
                  ));
                },
              ),
              const Divider(
                  height: 0,
                  color: Color(0xFF888888),
                  thickness: 0.2), // Garis bawah
              MenuItem(
                Icons.account_balance_wallet,
                'Wallet',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const MyWalletPage();
                    },
                  ));
                },
              ),
              const Divider(
                  height: 0,
                  color: Color(0xFF888888),
                  thickness: 0.2), // Garis bawah
              MenuItem(
                Icons.star,
                'Rate Flutix',
                onPressed: () {},
              ),
              const Divider(
                  height: 0,
                  color: Color(0xFF888888),
                  thickness: 0.2), // Garis bawah
              MenuItem(
                Icons.help,
                'Help',
                onPressed: () {},
              ),
              const Divider(
                  height: 0,
                  color: Color(0xFF888888),
                  thickness: 0.2), // Garis bawah
              MenuItem(
                Icons.exit_to_app_outlined,
                'Sign Out',
                onPressed: () async {
                  await Auth().signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
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
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const MenuItem(this.icon, this.label, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: const Color.fromARGB(255, 238, 51, 82),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: const Color.fromARGB(255, 248, 30, 67),
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
