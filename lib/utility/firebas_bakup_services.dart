// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// User? userDetails;
// class FirebasBakupServices{
//   final auth=FirebaseAuth.instance;
//   var googleSignIn;
//   signInWithGoogle()async{
//     googleSignIn=GoogleSignIn();
//     print("CALL🫤;");
//     try{
//       final GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();
//       if(googleSignInAccount != null){
//         final GoogleSignInAuthentication googleSignInAuthentication=
//             await googleSignInAccount.authentication;
//         final AuthCredential authCredential= GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//         await auth.signInWithCredential(authCredential);
//       }
//       // GoogleAuthProvider _provider=GoogleAuthProvider();
//       // auth.signInWithProvider(_provider);
//
//     }catch (e){
//       print("EEEEEEEEEEEEEEEEEEEEEEE");
//     }
//
//   }
//   signOut()async{
//     print("okok");
//     // Sign out from Google
//     await googleSignIn.signOut();
//
//     // Sign out from Firebase
//     await auth.signOut();
//     userDetails=null;
//
//     print("SignOut");
//   }
//
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

User? userDetails;

class FirebaseBackupServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    print("Attempting Google Sign-In...");
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        UserCredential userCredential = await auth.signInWithCredential(authCredential);
        userDetails = userCredential.user;
        print("Google Sign-In successful, User: ${userDetails?.email}");
      } else {
        print("Google Sign-In aborted by user");
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
    }
  }

  Future<void> signOuttf() async {
    print("Attempting Sign-Out...");
    try {
      if (_googleSignIn != null) {
        await _googleSignIn.signOut();
        print("Signed out from Google");
      }
      await auth.signOut();
      userDetails = null;
      print("Signed out from Firebase");
    } catch (e) {
      print("Error during Sign-Out: $e");
    }
  }
}