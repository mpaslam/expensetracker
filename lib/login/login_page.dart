import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneymate/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        if (userCredential.user!.emailVerified) {
          print("User logged in: ${userCredential.user!.uid}");
          // Only navigate if email is verified
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else {
          print("User's email is not verified.");
          // Display a message to the user or handle as needed.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Your email is not verified. Please verify your email before logging in.")),
          );
        }
      } else {
        print("Login failed.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed. Check your Detials")),
        );
      }
    } catch (e) {
      // Handle login errors
      print("Login error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login failed. Add valid Detials.")),
      );
    }
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      // Sign out the user before signing in with Google
      await _auth.signOut();
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in process
        print("Google Sign-In canceled by user.");
        return;
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;
      final AdditionalUserInfo? additionalUserInfo =
          userCredential.additionalUserInfo;

      print('Signed in with Google:');
      print('User ID: ${user?.uid}');
      print('Email: ${user?.email}');
      print('Display Name: ${user?.displayName}');
      print('Provider ID: ${additionalUserInfo?.providerId}');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (error) {
      print('Sign in with Google failed: $error');
      // Handle the error
    }
  }

  Future<void> _forgotPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset email sent. Check your inbox.")),
      );
    } catch (e) {
      print("Forgot Password error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Password reset failed. Check your email address.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email',
                  // border: OutlineInputBorder(),
                  fillColor: Colors.tealAccent),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  // border: OutlineInputBorder(),
                  fillColor: Colors.tealAccent),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: signInWithGoogle,
              child: Text(
                'Sign in with Google',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                // Change the background color of the button
                primary: Colors.white, // Change this color to the desired color
              ),
            ),
            TextButton(
                onPressed: () {
                  _forgotPassword();
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
