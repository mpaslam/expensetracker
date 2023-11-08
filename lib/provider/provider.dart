import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:moneymate/cal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderClass extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  double balance = 0;
  double income = 0;
  double expence = 0;

  List<Returnvalue> transactions = [];
  OperationModel? valuere;

  late SharedPreferences prefs;

  ProviderClass() {
    //  load();
    //  dataload();
    // fetchDocument();
  }
  // Future<void> load() async {
  //   prefs = await SharedPreferences.getInstance();
  //   balance = prefs.getDouble('balance') ?? 0;
  //   income = prefs.getDouble('income') ?? 0;
  //   expence = prefs.getDouble('expense') ?? 0;
  //   //login = prefs.getBool('login') ?? false;
  //   notifyListeners();
  // }

  // Future<void> dataload() async {
  //   prefs = await SharedPreferences.getInstance();
  //   List<String> listString = prefs.getStringList('transcation') ?? [];

  //   transactions = listString
  //       .map((datas) => Returnvalue.fromJson(json.decode(datas)))
  //       .toList();
  //   print('hh');
  // }
  List<String> value = ['shabeeb', 'azlam'];

  Future<OperationModel?> fetchDocument() async {
    DocumentSnapshot document = await firestore
        .collection('collection')
        .doc(auth.currentUser!.email)
        .get();
    // List<String> listString = prefs.getStringList('transcation') ?? [];

    if (document.exists) {
      final data = document.data() as Map<String, dynamic>;
      print(data);

      return OperationModel.fromjson(data);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  void addIncome(double addedincome) {
    income += addedincome;
    balance += addedincome;
    // OperationModel.instance.income += addedincome;
    // OperationModel.instance.totalbalance = addedincome;
//     prefs.setDouble('balance', balance);
//     prefs.setDouble('income', income);
// //
    // firestore
    //     .collection('collection')
    //     .doc(auth.currentUser!.email)
    //     .set(OperationModel.instance.toJson());
    notifyListeners();
  }

  void addExpence(num expenceValue) {
    expence += expenceValue;
    balance -= expenceValue;
    // prefs.setDouble('balance', balance);
    // prefs.setDouble('income', expence);

    // firestore
    //     .collection('collection')
    //     .doc(auth.currentUser!.email)
    //     .set({'expense': expence, 'balance': balance});
    notifyListeners();
  }

  Future<void> addlist() async {
    // prefs = await SharedPreferences.getInstance();
    // transactions.add();
    // final jsonTransaction =
    //     transactions.map((Jt) => json.encode(Jt.goMap())).toList();

    OperationModel operationModel = OperationModel(
        returnvalue: transactions, income: income, expense: expence);

    // prefs.setStringList('transcation', jsonTransaction);

    firestore
        .collection('collection')
        .doc(auth.currentUser!.email)
        .set(operationModel.toJson());
    notifyListeners();
  }

  void cleardata() async {
    // prefs = await SharedPreferences.getInstance();
    // await prefs.remove('balance');
    // await prefs.remove('income');
    // await prefs.remove('expense');
    // await prefs.remove('transcation');
    transactions = [];
    // load();
    notifyListeners();
  }

  // bool isLoggedIn = false;

  //bool get isLoggedIn => isLoggedIn;

  void login() async {
    // isLoggedIn = true;
    // await prefs.setBool('username', true);
    notifyListeners();
  }

  void logout() async {
    // prefs = await SharedPreferences.getInstance();
    // await prefs.remove('username');

    // _isLoggedIn = false;
    notifyListeners();
  }
}
