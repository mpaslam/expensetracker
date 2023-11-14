import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneymate/cal.dart';
import 'package:moneymate/login/login_page.dart';

class ProviderClass extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  double balance = 0;
  double income = 0;
  double expence = 0;

  List<Returnvalue> transactions = [];
  OperationModel? valuere;

  void signOut(BuildContext context) {
    FirebaseAuth.instance.signOut().then((value) {
      income = 0;
      expence = 0;
      balance = 0;
      transactions = [];
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
          (route) => false);
    });
    notifyListeners();
  }

  Future<OperationModel?> fetchDocument() async {
    DocumentSnapshot document = await firestore
        .collection('collection')
        .doc(auth.currentUser?.email)
        .get();
    // List<String> listString = prefs.getStringList('transcation') ?? [];

    if (document.exists) {
      final data = document.data() as Map<String, dynamic>;
      print(data);
      notifyListeners();

      return OperationModel.fromjson(data);
    } else {
      print('Document does not exist');
      return null;
    }
  }

  void addIncome(double addedincome) {
    income += addedincome;
    balance += addedincome;
    notifyListeners();
  }

  void addExpence(num expenceValue) {
    expence += expenceValue;
    balance -= expenceValue;
    notifyListeners();
  }
  Future<void> initializeDataFromFirestore() async {
    final operationModel = await fetchDocument();
    if (operationModel != null) {
      income = operationModel.income;
      expence = operationModel.expense;
      balance = operationModel.totalbalance;
      transactions = operationModel.returnvalue;
      notifyListeners();
    }
  }

  Future<void> addlist() async {
    OperationModel operationModel = OperationModel(
        returnvalue: transactions,
        income: income,
        expense: expence,
        totalbalance: balance);

    firestore
        .collection('collection')
        .doc(auth.currentUser!.email)
        .set(operationModel.toJson(), SetOptions(merge: true));
    notifyListeners();
  }

  void cleardata() async {
    // prefs = await SharedPreferences.getInstance();
    // await prefs.remove('balance');
    // await prefs.remove('income');
    // await prefs.remove('expense');
    // await prefs.remove('transcation');
    transactions = [];
    notifyListeners();
  }
}
