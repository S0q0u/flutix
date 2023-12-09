part of './services.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> regis(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Extract the user ID from the userCredential
      String userId = userCredential.user?.uid ?? '';

      // Return a map with 'success' and 'userId' keys
      return {'success': true, 'userId': userId};
    } catch (e) {
      // Return a map with 'success' key set to false
      return {'success': false};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      final userId = user?.uid;

      return {'success': true, 'userId': userId};
    } catch (e) {
      return {'success': false, 'userId': null};
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> uploadImage(XFile? imageFile) async {
    if (imageFile == null) {
      return ''; // Handle the case where imageFile is null
    }
    try {
      String fileName = basename(imageFile.path);
      Reference ref = FirebaseStorage.instance.ref().child(fileName);
      UploadTask task = ref.putFile(File(imageFile.path));
      TaskSnapshot snapshot = await task;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      debugPrint('Error uploading image: $e');
      return ''; // Handle the error appropriately for your application
    }
  }
}
