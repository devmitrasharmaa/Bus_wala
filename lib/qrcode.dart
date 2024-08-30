import 'dart:async';
import 'dart:math';
import 'package:Paytm/qr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '15qr.dart';
import 'countdown.dart';

// ignore: camel_case_types, must_be_immutable
class scanQR extends StatefulWidget {
  String _from_address, _to_address, _formattedDateTime;
  int hr, min, sec;
  scanQR(this._from_address, this._to_address, this.hr, this.min, this.sec,
      this._formattedDateTime, {super.key});

  @override
  State<scanQR> createState() => _scanQRState();
}

String getRandomString(List<String> strings) {
  final Random random = Random();
  final int randomIndex = random.nextInt(strings.length);
  return strings[randomIndex];
}

String generateRandomNumbers() {
  final random = Random();
  String numbersString = '';
  for (int i = 0; i < 11; i++) {
    var randomNumber = random.nextInt(10);
    numbersString += randomNumber.toString();
  }
  print(numbersString);
  return numbersString;
}

class _scanQRState extends State<scanQR> {
  String randomString = getRandomString(qr);
  String randomNumbers = generateRandomNumbers();
  String randomNumbers1 = generateRandomNumbers();

  bool _isExpanded = false;
  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  late Timer timer;

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.sec > 0) {
          widget.sec--;
        } else {
          if (widget.min > 0) {
            widget.min--;
            widget.sec = 59;
          } else {
            if (widget.hr > 0) {
              widget.hr--;
              widget.min = 59;
              widget.sec = 59;
            } else {
              timer.cancel(); // Countdown is finished
            }
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_outlined)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      flex: 6,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Color.fromARGB(255, 222, 238, 255),
                        child: Icon(
                          CupertinoIcons.ticket_fill,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 20,
                      child: Text(
                        '1 QR Ticket',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Help",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )))
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget._from_address,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Expanded(flex: 3, child: Icon(Icons.arrow_forward_sharp)),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget._to_address,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  'Scan this QR at Entry & Exit Points',
                  style:
                      TextStyle(letterSpacing: .2, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ImageDialog(
                          imageUrl:
                              'assets/images/qr.jpg', // Replace with your asset image path
                        );
                      },
                    );
                  },
                  child: Container(
                    child: QrImageView(
                      data: randomString,
                      version: QrVersions.auto,
                      size: 265.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Your Ticket is Valid for',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountdownUnit(value: widget.hr, label: 'HOURS  '),
                    CountdownUnit(value: widget.min, label: 'MINUTES    '),
                    CountdownUnit(value: widget.sec, label: 'SECONDS'),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 210, 210, 210), width: 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        title: const Text(
                          'Ticket Details',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        trailing: Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                      ),
                      if (_isExpanded)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Issued On',
                                              style: TextStyle(fontSize: 14),
                                            ))),
                                    Expanded(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              widget._formattedDateTime,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Order ID',
                                              style: TextStyle(fontSize: 14),
                                            ))),
                                    Expanded(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              randomNumbers,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    const Expanded(
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Order Item ID',
                                              style: TextStyle(fontSize: 14),
                                            ))),
                                    Expanded(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              randomNumbers1,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: const Row(
                                  children: [
                                    Expanded(
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Ticket Type',
                                              style: TextStyle(fontSize: 14),
                                            ))),
                                    Expanded(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '1 Adult',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.only(top: 10, bottom: 30),
                                child: const Row(
                                  children: [
                                    Expanded(
                                        child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Bus Service Type',
                                              style: TextStyle(fontSize: 14),
                                            ))),
                                    Expanded(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '(AC)',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
