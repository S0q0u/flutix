part of './widgets.dart';

class LaunchApp extends StatelessWidget {
  const LaunchApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: checkFirstLaunch(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(child: Text("Failed to load"));
        } else {
          return snapshot.data!;
        }
      },
    );
  }

  Future<Widget> checkFirstLaunch(BuildContext context) async {
    Shared saveData = Shared();
    await saveData.open();
    bool isFirstLaunch = saveData.file.getBool('firstLaunch') ?? true;

    if (isFirstLaunch) {
      await saveData.file.setBool('firstLaunch', false);
      return const SplashPage();
    } else {
      if (!context.mounted) {
        return const Center(
          child: Text("Error Build"),
        );
      }
      return checkAuthenticationState(context);
    }
  }

  Future<Widget> checkAuthenticationState(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      UserData userData = Provider.of<UserData>(context, listen: false);
      userData.userId = user.uid;
      await userData.getData();
      return const Home();
    } else {
      return const SignIn();
    }
  }
}
