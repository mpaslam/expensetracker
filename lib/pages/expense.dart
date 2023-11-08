import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymate/cal.dart';
import 'package:moneymate/provider/provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Expense extends StatelessWidget {
  Expense({super.key});

  bool light = true;

  final TextEditingController incometext = TextEditingController();

  final TextEditingController discriptiontext = TextEditingController();

  String cat1 = '';

  String discription = '';

  @override
  Widget build(BuildContext context) {
    List<String> category = [
      'subscription',
      'Food',
      'transportation',
      'Shopping',
    ];

    List<String> wallet = ['Wallet', 'fd'];
    String? p;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheigt = MediaQuery.of(context).size.height;
    final pv = Provider.of<ProviderClass>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.red[900],
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 77),
          child: Text(
            'Income',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'How Much?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: screenheigt / 8,
                  width: screenWidth,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '\$0',
                          hintStyle: TextStyle(color: Colors.black),
                          focusedBorder: InputBorder.none,
                        ),
                        cursorColor: Colors.black,
                        controller: incometext,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      )),
                ),
              ],
            ),
          ),
          Container(
            height: screenheigt / 1.6,
            width: screenWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 85,
                    width: 370,
                    child: DropdownButtonFormField(
                        hint: const Text('category'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        dropdownColor: Colors.white,
                        items: category
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                  ),
                                ))
                            .toList(),
                        onChanged: (v) {
                          cat1 = v as String;
                        }),
                  ),
                ),
                SizedBox(
                  height: 85,
                  width: 370,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Describtion',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    controller: discriptiontext,
                  ),
                ),
                SizedBox(
                  height: 85,
                  width: 370,
                  child: DropdownButtonFormField(
                      hint: const Text('Wallet'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      dropdownColor: Colors.white,
                      items: wallet
                          .map((a) => DropdownMenuItem(
                                value: a,
                                child: Text(
                                  a,
                                ),
                              ))
                          .toList(),
                      onChanged: (v) {
                        p == v as String;
                      }),
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.attachment,
                            size: 33,
                            color: Colors.black45,
                          )),
                      const Text(
                        'Add attachment',
                        style: TextStyle(color: Colors.black45, fontSize: 22),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: 370,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Repeat',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Repeat transaction',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                      Switch(
                          value: light,
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            light = value;
                          })
                    ],
                  ),
                ),
                SizedBox(
                    width: 370,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {
                          final enteredincome =
                              double.tryParse(incometext.text);
                          discription = discriptiontext.text;

                          if (enteredincome != null) {
                            Returnvalue obj = Returnvalue(
                                enteredincome: enteredincome,
                                cat: cat1,
                                discription: discription,
                                time:
                                    DateFormat('HH:mm').format(DateTime.now()),
                                type: 'expense',
                                wallet: '');
                                 pv.transactions.add(obj);
                            Navigator.pop(context, obj);
                            //pv.addlist(obj);
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Invalid Number'),
                                  content: const Text(
                                      'Please enter a valid number.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(fontSize: 25),
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
