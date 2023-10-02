import 'package:flutter/material.dart';
import 'package:moneymate/login.dart';
import 'package:moneymate/provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
          onPressed: () async {
            ProviderClass log = ProviderClass();
            log.logout();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
                (route) => false);
          },
          child: Text('logout')),
    );
  }
}
