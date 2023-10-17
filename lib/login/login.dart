import 'package:flutter/material.dart';
import 'package:moneymate/login/registration.dart';
import 'package:moneymate/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  // final Calculation calc = Calculation();
  @override
  Widget build(BuildContext context) {
    getsaveddata(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                    hintText: 'Email or Phone number',
                    border: OutlineInputBorder(),
                    fillColor: Colors.blue),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    fillColor: Colors.blue),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registor(),
                        ));
                  },
                  child: Text('New user')),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent[900], // Background color
                  );
                  savedata();
                  getsaveddata(context);
                },
                child: Text('Sign in'),
              )
            ],
          ),
        ),
      ),
    );
  }

  savedata() async {
//sharedpreference
    final sharedprefs = await SharedPreferences.getInstance();
//save data
    await sharedprefs.setString('username', username.text);
    await sharedprefs.setString('password', password.text);
  }

  getsaveddata(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    final user = sharedprefs.getString('username');
    final pass = sharedprefs.getString('password');

    if (user == 'aslam' || user == '9876543210' && pass == '12345') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    } else {}
  }
}
