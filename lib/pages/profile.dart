import 'package:flutter/material.dart';
import 'package:moneymate/provider/provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
          onPressed: () {
            Provider.of<ProviderClass>(context, listen: false).signOut(context);
          },
          child: Text('logout')),
    );
  }
}
