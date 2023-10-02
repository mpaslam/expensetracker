// import 'dart:convert';

// import 'package:moneymate/cal.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future<void> saveReturnvaluesToSharedPreferences(
//     List<Returnvalue> Returnvalues) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final List<String> ReturnvaluesStringList = Returnvalues.map((Returnvalue) {
//     return json.encode(Returnvalue.toJson());
//   }).toList();
//   await prefs.setStringList('ReturnvaluesKey', ReturnvaluesStringList);
// }

// Future<List<Returnvalue>> getReturnvaluesFromSharedPreferences() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final List<String> ReturnvaluesStringList =
//       prefs.getStringList('ReturnvaluesKey') ?? [];
//   return ReturnvaluesStringList.map((ReturnvalueString) {
//     return Returnvalue.fromJson(json.decode(ReturnvalueString));
//   }).toList();
// }
