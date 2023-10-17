import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:moneymate/cal.dart';
import 'package:moneymate/pages/expense.dart';
import 'package:moneymate/pages/income.dart';
import 'package:moneymate/pages/profile.dart';
import 'package:moneymate/pages/transfer.dart';
import 'package:moneymate/provider/provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  // Calculation obj = Calculation();
  List<Returnvalue> transactions = [];

  List<String> calender = [
    'January',
    'February',
    'March',
    'April',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  get selectedDate => null;

  @override
  Widget build(BuildContext context) {
    print('');
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheigt = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   leading: CircleAvatar(
      //       backgroundColor: Colors.white,
      //       radius: 22,
      //       child: CircleAvatar(
      //         backgroundColor: Colors.white,
      //         radius: 25,
      //         child: CircleAvatar(
      //           backgroundImage: AssetImage('assets/batman.png'),
      //           radius: 28,
      //         ),
      //       )),
      //   title: Center(
      //     child: SizedBox(
      //         width: screenWidth / 2.5,
      //         child: DropdownButtonFormField(
      //           alignment: Alignment.center,
      //           icon: const Icon(Icons.keyboard_arrow_down_rounded),
      //           iconSize: 30,
      //           isExpanded: true,
      //           hint: const Text(
      //             'Calender',
      //             style: TextStyle(
      //               fontSize: 15,
      //             ),
      //           ),
      //           decoration: const InputDecoration(border: InputBorder.none),
      //           dropdownColor: Colors.white,
      //           items: calender
      //               .map((e) => DropdownMenuItem(
      //                     value: e,
      //                     child: Text(
      //                       e,
      //                       style: const TextStyle(fontSize: 14),
      //                     ),
      //                   ))
      //               .toList(),
      //           onChanged: (v) {
      //             selectedDate == v as String;
      //           },
      //         )),
      //   ),
      //   actions: [
      //     const Icon(
      //       Icons.notifications,
      //       size: 40,
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                height: screenheigt / 2.1,
                width: screenWidth,
                decoration: BoxDecoration(
                    color: Colors.purple[400],
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(25))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 15, top: 50, bottom: 23),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenheigt / 13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 22,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 22,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/batman.png'),
                                    radius: 20,
                                  ),
                                )),
                            // const CircleAvatar(
                            //   radius: 20,
                            //   backgroundImage: AssetImage('assets/batman.png'),
                            // ),
                            SizedBox(
                              width: screenWidth / 3,
                              height: 40,
                              child: DropdownButtonFormField(
                                alignment: Alignment.center,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
                                iconSize: 30,
                                isExpanded: true,
                                hint: const Text(
                                  'Calender',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                dropdownColor: Colors.white,
                                items: calender
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (v) {
                                  selectedDate == v as String;
                                },
                              ),
                            ),
                            const Icon(
                              Icons.notifications,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                      const Text(
                        'Account Balance ',
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox(
                          child: Consumer<ProviderClass>(
                            builder: (context, value, child) {
                              return Text(
                                '\$${value.balance}',
                                style: const TextStyle(
                                    fontSize: 48, fontWeight: FontWeight.w700),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                Returnvalue? updated = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Incomepage()));

                                if (updated != null) {
                                  Provider.of<ProviderClass>(context,
                                          listen: false)
                                      .addIncome(updated.enteredincome);
                                  Provider.of<ProviderClass>(context,
                                          listen: false)
                                      .addlist(updated);
                                }
                              },
                              child: Container(
                                height: 80,
                                width: 164,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Wrap(
                                      runAlignment: WrapAlignment.center,
                                      spacing: 10,
                                      children: [
                                        SizedBox(
                                            height: 48,
                                            width: 48,
                                            child: Image.asset(
                                                'assets/Group1.png')),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Income',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Consumer<ProviderClass>(
                                              builder: (context, value, child) {
                                                return Text(
                                                  '\$${value.income}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                );
                                              },
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                Returnvalue? updated = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Expense()));

                                if (updated != null) {
                                  Provider.of<ProviderClass>(context,
                                          listen: false)
                                      .addExpence(updated.enteredincome);
                                  Provider.of<ProviderClass>(context,
                                          listen: false)
                                      .addlist(updated);
                                }
                              },
                              child: Container(
                                height: 80,
                                width: 164,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Wrap(
                                      runAlignment: WrapAlignment.center,
                                      spacing: 10,
                                      children: [
                                        SizedBox(
                                            height: 48,
                                            width: 48,
                                            child: Image.asset(
                                                'assets/Group2.png')),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Expenses',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Consumer<ProviderClass>(
                                              builder: (context, value, child) {
                                                return Text(
                                                  '\$${value.expence}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                );
                                              },
                                            )
                                          ],
                                        )
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: screenheigt / 28,
                width: screenWidth,
                // color: Color.fromARGB(255, 123, 120, 120),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Today',
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Week',
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Month',
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Year',
                            style: TextStyle(color: Colors.black),
                          )),
                      Consumer<ProviderClass>(builder: (context, value, child) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              value.cleardata();
                            },
                            child: Text('clear'));
                      })
                    ]),
              ),
            ),
            SizedBox(
              height: screenheigt / 25,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Transaction',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 32,
                        width: 78,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color.fromARGB(255, 212, 205, 244)),
                        child: const Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 115, 63, 246)),
                        ),
                      )
                    ]),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: screenheigt / 2.4,
                width: screenWidth,
                child: Consumer<ProviderClass>(
                  builder: (BuildContext context, value, Widget? child) {
                    return ListView.separated(
                      itemCount: value.transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = value.transactions[index];
                        switch (transaction.type) {
                          case 'income':
                            return ListTile(
                              leading: Allicons(transaction.cat),
                              title: Text(transaction.cat,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              subtitle: Text(transaction.discription),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '+\$ ${transaction.enteredincome}',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(transaction.time)
                                ],
                              ),
                            );
                          case 'expense':
                            return ListTile(
                              leading: Allicons(transaction.cat),
                              title: Text(transaction.cat,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              subtitle: Text(transaction.discription),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '-\$ ${transaction.enteredincome}',
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(transaction.time)
                                ],
                              ),
                            );
                          case 'transfer':
                            return ListTile(
                              leading: Allicons(transaction.cat),
                              title: Text(transaction.cat,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              subtitle: Text(transaction.discription),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '-\$ ${transaction.enteredincome}',
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(transaction.time)
                                ],
                              ),
                            );
                        }
                        return null;
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        icon: Icons.add, backgroundColor: Colors.purple,
        activeIcon: Icons.close,
        // buttonSize: 56.0,
        visible: true,
        closeManually: false,
        renderOverlay: true,
        curve: Curves.slowMiddle,
        children: [
          SpeedDialChild(
            child: Icon(Icons.attach_money),
            backgroundColor: Colors.green,
            label: 'Add Income',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Incomepage(),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.camera_alt),
            backgroundColor: Colors.red,
            label: 'Add Expense',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Expense(),
                ),
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.swap_horiz),
            backgroundColor: Colors.blue,
            label: 'Transfer',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Transfer(),
                ),
              );
            },
          ),
        ],
      ),
      // floatingActionButtonLocation: ExpandableFab.location,
      // floatingActionButton: ExpandableFab(
      //   child: const Icon(Icons.add),
      //   backgroundColor: Colors.deepPurple,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {},
      //       backgroundColor: Colors.green,
      //       child: const Icon(Icons.incomplete_circle_rounded),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {},
      //       backgroundColor: Colors.green,
      //       child: const Icon(Icons.incomplete_circle_rounded),
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {},
      //       backgroundColor: Colors.green,
      //       child: const Icon(Icons.incomplete_circle_rounded),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: const Icon(
                  Icons.home,
                ),
                color: Colors.black,
                onPressed: () {}),
            IconButton(
              icon: const Icon(
                Icons.swap_horiz_sharp,
              ),
              color: Colors.black,
              onPressed: () async {
                Returnvalue? updated = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Transfer()));

                if (updated != null) {
                  Provider.of<ProviderClass>(context, listen: false)
                      .addExpence(updated.enteredincome);
                  Provider.of<ProviderClass>(context, listen: false)
                      .addlist(updated);
                }
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.incomplete_circle_rounded,
              ),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
              ),
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          ],
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //   height: screenheigt / 15,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       IconButton(
      //         icon: const Icon(
      //           Icons.home,
      //         ),
      //         color: Colors.black,
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(
      //           Icons.swap_horiz_sharp,
      //         ),
      //         color: Colors.black,
      //         onPressed: () {
      //           Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => Incomepage()))
      //               .then((updatedtranfer) {
      //             if (updatedtranfer != null && updatedtranfer is Returnvalue) {
      //               transactions.add(updatedtranfer);
      //               // expence += updatedtranfer.enteredcash;
      //               // balance -= updatedtranfer.enteredcash;
      //             }
      //           });
      //         },
      //       ),
      //       IconButton(
      //         icon: const Icon(
      //           Icons.incomplete_circle_rounded,
      //         ),
      //         color: Colors.black,
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: const Icon(
      //           Icons.delete_forever_outlined,
      //         ),
      //         color: Colors.black,
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget Allicons(String category) {
    switch (category) {
      case 'salary':
        return Image.asset('assets/salary.png');
      // case 'passive income':
      //   return Image.asset('assets/food.png');
      case 'Shopping':
        return Image.asset('assets/shopping.png');
      case 'Food':
        return Image.asset('assets/food.png');
      case 'subscription':
        return Image.asset('assets/subscription.png');
      case 'transportation':
        return Image.asset('assets/transportation.png');
      default:
        return Image.asset('assets/food.png');
    }
  }
}
