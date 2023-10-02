import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:moneymate/cal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderClass extends ChangeNotifier {
  double balance = 0;
  double income = 0;
  double expence = 0;

  List<Returnvalue> transactions = [];

  late SharedPreferences prefs;

  ProviderClass() {
    load();
    dataload();
  }
  Future<void> load() async {
    prefs = await SharedPreferences.getInstance();
    balance = prefs.getDouble('balance') ?? 0;
    income = prefs.getDouble('income') ?? 0;
    expence = prefs.getDouble('expense') ?? 0;
    //login = prefs.getBool('login') ?? false;
    notifyListeners();
  }

  Future<void> dataload() async {
    prefs = await SharedPreferences.getInstance();
    List<String> listString = prefs.getStringList('transcation') ?? [];

    transactions = listString
        .map((datas) => Returnvalue.fromJson(json.decode(datas)))
        .toList();
    print('hh');
  }

  void addIncome(double addedincome) {
    income += addedincome;
    balance += addedincome;
    prefs.setDouble('balance', balance);
    prefs.setDouble('income', income);
    notifyListeners();
  }

  void addExpence(num expenceValue) {
    expence += expenceValue;
    balance -= expenceValue;
    prefs.setDouble('balance', balance);
    prefs.setDouble('income', expence);
    notifyListeners();
  }

  Future<void> addlist(Returnvalue details) async {
    prefs = await SharedPreferences.getInstance();
    transactions.add(details);
    final JsonTransaction =
        transactions.map((Jt) => json.encode(Jt.goMap())).toList();
    prefs.setStringList('transcation', JsonTransaction);

    notifyListeners();
  }

  void cleardata() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('balance');
    await prefs.remove('income');
    await prefs.remove('expense');
    await prefs.remove('transcation');
    transactions = [];
    load();
    notifyListeners();
  }

  // bool isLoggedIn = false;

  //bool get isLoggedIn => isLoggedIn;

  void login() async {
    // isLoggedIn = true;
    await prefs.setBool('username', true);
    notifyListeners();
  }

  void logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');

    // _isLoggedIn = false;
    notifyListeners();
  }
}
