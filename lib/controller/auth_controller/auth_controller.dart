import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uzyio/constants/end_points.dart';
import 'package:uzyio/constants/loading_animation.dart';
import 'package:uzyio/core/bindings/bindings.dart';
import 'package:uzyio/core/common/global_instance.dart';
import 'package:uzyio/services/user/user_services.dart';
import 'package:uzyio/view/screens/auth/login.dart';
import 'package:uzyio/view/screens/my_nav_bar/my_nav_bar.dart';

// class AuthController extends GetxController {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   //  -------------- Google Authentication ------------------

//   Future<void> googleAuth() async {
//     try {
//       // String fcm = await fcmToken.getToken() ?? "";
//       showLoadingDialog();
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser == null) {
//         hideLoadingDialog();
//         log('User canceled the Google sign-in process');
//         return;
//       }

//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser.authentication;

//       if (googleAuth?.accessToken == null) {
//         // isGoogleAuthLoading.value = false;
//         hideLoadingDialog();
//         log('Google authentication access token is null');
//         return;
//       }

//       // var auth = googleUser.id;

//       final credential = await GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       // auth =
//       // await FirebaseAuth.instance.signInWithCredential(credential);
//       await auth.signInWithCredential(credential);
//       // as FirebaseAuth;

//       socialLoginMethod(
//         name: "${auth.currentUser?.displayName}",
//         email: "${auth.currentUser?.email}",
//         profileUrl: "${auth.currentUser?.photoURL}",
//       );

//       log(
//         'User signed in: ${auth.currentUser?.displayName}, ${auth.currentUser?.email}',
//       );
//       log('Google Auth Id: ${auth.currentUser?.uid}');

//       // Get.to(() => MyNavBar(selectedIndex: 2), binding: HomeBindings());
//       displayToast(msg: "User logged in successfully.");

//       // Check if the user data is stored in Firestore or not.

//       // final doc = await userCollection.doc(auth.currentUser?.uid).get();

//       // document is exists
//       // if (doc.exists) {
//       //   hideLoadingDialog();

//       //   Get.offAll(() => HomeScreen(), binding: PlanBindings());
//       //   log('Document exists, user info not updated');
//       // }
//       // document doesn't exists
//       // else {
//       //   await saveUserToFirestore(
//       //     model: UserModel(
//       //       bio: "",
//       //       fullName: auth.currentUser?.displayName.toString(),
//       //       email: auth.currentUser?.email.toString(),
//       //       fcmToken: fcm,
//       //       authType: 'socail_auth',
//       //       profileImage: profileDefaultImage,
//       //       createdAt: DateTime.now(),
//       //     ),
//       //   );

//       //   hideLoadingDialog();

//       //   Get.offAll(() => HomeScreen(), binding: PlanBindings());

//       //   log("Document doesn't exist");
//       // }
//       hideLoadingDialog();
//     } catch (e) {
//       hideLoadingDialog();
//       log('An error occurred during Google sign-in: $e');
//     }
//   }

//   // LOGIN POST API

//   Future<void> socialLoginMethod({
//     required String name,
//     required String email,
//     required String profileUrl,
//   }) async {
//     log("Try Called Social signUp method");
//     try {
//       Map<String, dynamic> body = {
//         "name": name,
//         "email": email,
//         "profile": profileUrl,
//       };

//       final response = await apiService.post(
//         postAuthURL,
//         body,
//         true,
//         showResult: true,
//         successCode: 200,
//       );

//       if (response != null) {
//         final token = response['token'];

//         if (token != null && token.isNotEmpty) {
//           log("API Token id: $token");
//           Get.to(() => MyNavBar(selectedIndex: 2), binding: HomeBindings());
//         }
//       }
//     } catch (e) {
//       hideLoadingDialog();
//       log('Error while hiting auth Api:-> $e');
//     }
//   }
// }

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  // -------------------- CHECK TOKEN ON APP START --------------------
  Future<void> checkLoginStatus() async {
    final token = await getToken();

    if (token != null && token.isNotEmpty) {
      await UserService.instance.getUserInformation();
      log("User already logged in — Token: $token");
      Get.offAll(() => MyNavBar(selectedIndex: 2), binding: HomeBindings());
    } else {
      log("No token found — Navigate to Login");
      Get.offAll(() => LoginPage());
    }
  }

  // -------------------- SAVE TOKEN FUNCTION --------------------
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_token", token);
    log("TOKEN SAVED SUCCESSFULLY: $token");
  }

  // -------------------- GET TOKEN FUNCTION --------------------
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_token");
  }

  // -------------------- CLEAR TOKEN (ON LOGOUT) --------------------
  Future<void> userLoggedOut() async {
    showLoadingDialog();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("user_token");
    Get.offAll(() => LoginPage());
    hideLoadingDialog();
    log("TOKEN REMOVED — USER LOGGED OUT");
  }

  // -------------------- GOOGLE AUTH --------------------
  Future<void> googleAuth() async {
    try {
      showLoadingDialog();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        hideLoadingDialog();
        log('User canceled Google sign-in');
        return;
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      if (googleAuth?.accessToken == null) {
        hideLoadingDialog();
        log('Google access token is NULL');
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await auth.signInWithCredential(credential);

      await socialLoginMethod(
        name: auth.currentUser?.displayName ?? "",
        email: auth.currentUser?.email ?? "",
        profileUrl: auth.currentUser?.photoURL ?? "",
      );

      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();
      log('Google sign-in error: $e');
    }
  }

  // -------------------- SOCIAL LOGIN API --------------------
  Future<void> socialLoginMethod({
    required String name,
    required String email,
    required String profileUrl,
  }) async {
    log("Calling Social SignUp API...");

    try {
      Map<String, dynamic> body = {
        "name": name,
        "email": email,
        "profile": profileUrl,
        "fcm_token": "$getFcmToken",
      };

      final response = await apiService.post(
        postAuthURL,
        body,
        false,
        showResult: false,
        successCode: 200,
      );

      if (response != null) {
        final token = response['token'];

        if (token != null && token.isNotEmpty) {
          log("API Token id: $token");

          // ---------- SAVE TOKEN ----------
          await saveToken(token);
          await UserService.instance.getUserInformation();

          // ---------- NAVIGATE TO HOME ----------
          Get.offAll(() => MyNavBar(selectedIndex: 2), binding: HomeBindings());
          displayToast(msg: "User logged in successfully.");
        }
      }
    } catch (e) {
      hideLoadingDialog();
      log('Error while hitting auth API: $e');
    }
  }
}
