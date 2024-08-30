import 'dart:async';

import 'package:Paytm/qrcode.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'countdown.dart';

// ignore: must_be_immutable
class Ticket extends StatefulWidget {
  String _selectedOption, _from_address, _to_address, _moneyGiven, _route;
  Ticket(this._selectedOption, this._from_address, this._to_address,
      this._moneyGiven, this._route, {super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  Future<bool> _onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Warning'),
        content: const Text(
            'Are you sure you want to go back? Any unsaved changes will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Go Back Anyway'),
          ),
        ],
      ),
    );

    if (shouldPop == true) {
      timer.cancel();
      Navigator.pop(context, true); // Manually pop the screen
    }
    return Future.value(false); // Prevent automatic pop
  }

  static int hours = 2;
  static int minutes = 51;
  static int seconds = 59;
  final _longPressGestureRecognizer = LongPressGestureRecognizer();
  // ignore: unused_field
  final bool _isHovering = false;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    widget._selectedOption == "AMTS" ? hours = 1 : hours = 2;
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          if (minutes > 0) {
            minutes--;
            seconds = 59;
          } else {
            if (hours > 0) {
              hours--;
              minutes = 59;
              seconds = 59;
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
    _longPressGestureRecognizer.dispose();
    super.dispose();
  }

  final DateTime currentDateTime =
      DateTime.now().subtract(const Duration(minutes: 7));
  String get formattedDateTime =>
      DateFormat('dd MMM yyyy, hh:mm a').format(currentDateTime);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 8),
            child: Column(children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back), onPressed: _onWillPop),
                    ),
                    Expanded(
                      flex: 25,
                      child: Image.asset(
                          height: 35, width: 60, "assets/images/paytm.png"),
                    ),
                    Expanded(
                        flex: 6,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Help",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(8, 15, 8, 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 211, 235, 253),
                  border: Border.all(
                      color: const Color.fromARGB(255, 225, 224, 224), width: 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color.fromARGB(255, 204, 204, 204))),
                      child: ClipOval(
                        child: widget._selectedOption == 'AMTS'
                            ? Image.asset('assets/images/amts.png')
                            : Image.asset('assets/images/janmarg.jpg'),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          flex: 10,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {});
                              },
                              onLongPressEnd: (_) {
                                setState(() {});
                              },
                              child: Tooltip(
                                message: widget._from_address,
                                child: Text(
                                  widget._from_address,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Expanded(
                            flex: 3, child: Icon(Icons.arrow_forward_outlined)),
                        Flexible(
                          flex: 10,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {});
                              },
                              onLongPressEnd: (_) {
                                setState(() {});
                              },
                              child: Tooltip(
                                message: widget._to_address,
                                child: Text(
                                  widget._to_address,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        child: widget._selectedOption == 'BRTS'
                            ? const Text(
                                'AC',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              )
                            : Text("Local • Non AC • Bus No. ${widget._route}",
                                style: const TextStyle(fontWeight: FontWeight.w500))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("1 Adult Ticket",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 2, left: 7, bottom: 1),
                        width: 72,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: const Color.fromARGB(255, 204, 204, 204))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Image.asset(
                                'assets/images/boy.png',
                                height: 35,
                                width: 35,
                              ),
                            ),
                            const Expanded(
                              flex: 5,
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 25),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹${widget._moneyGiven}",
                          style: const TextStyle(
                              fontSize: 38, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.verified_sharp,
                          size: 48,
                          color: Color.fromARGB(255, 15, 180, 21),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'TICKET BOOKED SUCCESSFULLY',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: .8),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      formattedDateTime,
                      style:
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      thickness: 1,
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Your Ticket is Valid for',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CountdownUnit(value: hours, label: 'HOURS '),
                              CountdownUnit(
                                  value: minutes, label: 'MINUTES     '),
                              CountdownUnit(value: seconds, label: 'SECONDS'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: const EdgeInsets.all(18)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return scanQR(
                                              widget._from_address,
                                              widget._to_address,
                                              hours,
                                              minutes,
                                              seconds,
                                              formattedDateTime);
                                        },
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin =
                                              0.0; // Start the fade from fully transparent (invisible)
                                          const end =
                                              1.0; // End the fade at fully opaque (visible)
                                          var tween =
                                              Tween(begin: begin, end: end);
                                          var fadeAnimation =
                                              animation.drive(tween);
                                          return FadeTransition(
                                            opacity: fadeAnimation,
                                            child: child,
                                          );
                                        },
                                        transitionDuration:
                                            const Duration(milliseconds: 250),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'View your Tickets',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                      color: const Color.fromARGB(255, 0, 123, 223),
                      width: double.infinity, // Adjust the width as needed
                    ),
                    Container(
                      height: 10,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color.fromARGB(255, 0, 76, 137),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      width: double.infinity, // Adjust the width as needed
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
