part of './pages.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 248, 30, 67),
        ),
      ),
    );
  }
}
