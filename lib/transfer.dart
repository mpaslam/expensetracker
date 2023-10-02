import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymate/cal.dart';

// ignore: must_be_immutable
class Transfer extends StatelessWidget {
  Transfer({super.key});

  TextEditingController discriptiontext = TextEditingController();

  TextEditingController transfer = TextEditingController();

  TextEditingController fromtext = TextEditingController();

  TextEditingController totext = TextEditingController();

  bool light = true;

  String describtion = '';

  String cat = '';

  //String to = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheigt = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(0, 119, 255, 1),
        elevation: 0,
        title: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            'Transfer',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 119, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 110,
                        ),
                        Text(
                          'How much?',
                          style: TextStyle(
                              color: Color.fromRGBO(252, 252, 252, 1),
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 80,
                          width: 350,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '\$0',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 64),
                                focusedBorder: InputBorder.none,
                              ),
                              controller: transfer,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            SizedBox(height: 130),
            Container(
                width: screenWidth,
                height: screenheigt / 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.blue,
                                  hintText: 'From',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                controller: fromtext,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth / 2.5,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: Colors.blue,
                                  hintText: 'To',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                controller: totext,
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/Frame 342.png'),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        controller: discriptiontext,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: 4, // Specify the rotation angle in radians
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.attach_file_sharp),
                          ),
                        ),
                        const Text('Add attachment'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 345,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            final enteredincome =
                                double.tryParse(transfer.text);
                            describtion = discriptiontext.text;
                            cat = '${fromtext.text} to ${totext.text}';

                            DateFormat('HH:mm').format(DateTime.now());
                            if (enteredincome != null) {
                              Returnvalue obj = Returnvalue(
                                  enteredincome: enteredincome,
                                  cat: cat,
                                  discription: describtion,
                                  time: DateFormat('HH:mm')
                                      .format(DateTime.now()),
                                  type: 'transfer',
                                  wallet: '');
                              Navigator.pop(context, obj);
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
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),

                            backgroundColor: Color.fromRGBO(127, 61, 255, 1),

                            // Background color
                          ),
                          child: Text('Continue'),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
