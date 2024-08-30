import 'package:Paytm/ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _from = TextEditingController();
  final TextEditingController _to = TextEditingController();
  final TextEditingController _money = TextEditingController();
  final TextEditingController _route = TextEditingController();
  String selectedOption = 'BRTS';
  bool showStateTextbox = false;

  bool isSwitched = true;
  final ValueNotifier<int> _selectedPassengerCount = ValueNotifier<int>(1);

  void _handleOptionChange(String option) {
    setState(() {
      selectedOption = option;
      selectedOption == 'AMTS'
          ? showStateTextbox = true
          : showStateTextbox = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 58, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Clickable box button to buy daily pass for bus
                InkWell(
                  highlightColor: Colors.white,
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      transitionDuration: const Duration(milliseconds: 300),
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return Center(
                          child: ScaleTransition(
                            scale: CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOutCirc,
                            ),
                            child: AlertDialog(
                              title: const Text('Not Available'),
                              content: const Text(
                                  "I'm working on it, hope to get it done soon"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Okay'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Return'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      shape: badges.BadgeShape.square,
                      borderRadius: BorderRadius.circular(5),
                      badgeColor: const Color.fromRGBO(37, 194, 124, 1),
                      elevation: 0,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    ),
                    badgeContent: const Text('New Launch',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .2)),
                    position: badges.BadgePosition.custom(
                      start: 29,
                      top: -7,
                    ),
                    badgeAnimation: const badges.BadgeAnimation.size(toAnimate: true),
                    onTap: () {
                      print('asdfsadfs');
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 17, bottom: 17),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 225, 224, 224),
                            width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 3,
                          ),
                          // Image icon at left
                          Image.asset(
                            'assets/images/bus_icon.png',
                            alignment: Alignment.center,
                            height: 72,
                            width: 72,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          // Text following the image
                          const Expanded(
                            flex: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Buy Daily Manpasand Pass',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Unlimited travel on all AMTS buses\ntoday',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          const Flexible(
                            flex: 4,
                            child: Column(
                              children: [
                                Icon(Icons.arrow_forward_ios_outlined,
                                    size: 20),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 19),

                // Left-aligned text below the box button
                const Text(
                  'Buy New Ticket',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 19,
                      fontWeight: FontWeight.w800),
                ),

                const SizedBox(height: 19),
                Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 225, 224, 224), width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 48,
                          child: badges.Badge(
                            badgeStyle: badges.BadgeStyle(
                              shape: badges.BadgeShape.square,
                              borderRadius: BorderRadius.circular(5),
                              badgeColor: const Color.fromRGBO(37, 194, 124, 1),
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                            ),
                            badgeContent: const Text('New',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.2)),
                            position: badges.BadgePosition.custom(
                              end: 5,
                              top: -3,
                            ),
                            badgeAnimation:
                                const badges.BadgeAnimation.size(toAnimate: true),
                            onTap: () {
                              print('asdfsadfs');
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 1),
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(228, 237, 248, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        _handleOptionChange('BRTS');
                                        print(selectedOption);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black, backgroundColor: selectedOption == 'BRTS'
                                            ? Colors.white
                                            : const Color.fromRGBO(228, 237, 248, 1),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3)),
                                        ),
                                      ),
                                      child: const Text(
                                        'BRTS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  // Add space between buttons
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        _handleOptionChange('AMTS');
                                        print(selectedOption);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black, backgroundColor: selectedOption == 'AMTS'
                                            ? Colors.white
                                            : const Color.fromRGBO(228, 237, 248, 1),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3)),
                                        ),
                                      ),
                                      child: const Text(
                                        'AMTS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Two input text boxes for 'from' and 'to' location input
                        TextField(
                          textCapitalization: TextCapitalization.words,
                          controller: _from,
                          decoration: const InputDecoration(
                            labelText: 'From',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),

                        const SizedBox(height: 16),

                        TextField(
                          textCapitalization: TextCapitalization.words,
                          controller: _to,
                          decoration: const InputDecoration(
                            labelText: 'To',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),

                        const SizedBox(height: 16),
                        const Text(
                          'Passenger',
                          style: TextStyle(
                              color: Color.fromARGB(255, 123, 123, 123),
                              fontSize: 17),
                        ),
                        ValueListenableBuilder<int>(
                          valueListenable: _selectedPassengerCount,
                          builder: (context, value, child) {
                            return DropdownButton<int>(
                              key: ValueKey<int>(_selectedPassengerCount.value),
                              value: value,
                              onChanged: (newValue) {
                                _selectedPassengerCount.value = newValue!;
                              },
                              items: List.generate(
                                5,
                                (index) => DropdownMenuItem(
                                  value: index + 1,
                                  child: Text(
                                    '${index + 1} Adult${index > 0 ? 's' : ''}',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        // Scroll button for selecting the number of passengers
                        const SizedBox(height: 10),
                        TextField(
                          controller: _money,
                          decoration: const InputDecoration(
                            labelText: 'Enter Fare(₹)',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                          ),
                        ),
                        const SizedBox(height: 25),
                        if (showStateTextbox)
                          TextField(
                            controller: _route,
                            decoration: const InputDecoration(
                              labelText: 'Enter Route/Bus Number',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                            ),
                          ),
                        const Text(
                          'ⓘ All bus tickets will be valid for 3 hours post booking',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),

                        const SizedBox(height: 16),

                        // Option to fast forward payment with a toggle button
                        Row(
                          children: [
                            const Icon(Icons.fast_forward_rounded),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                              flex: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Fast Forward',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    'Pay using Paytm Wallet Balance',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: CupertinoSwitch(
                                  activeColor: Colors.blue,
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  }),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // Proceed to pay button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(20)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return Ticket(selectedOption, _from.text,
                                      _to.text, _money.text, _route.text);
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin =
                                      0.0; // Start the fade from fully transparent (invisible)
                                  const end =
                                      1.0; // End the fade at fully opaque (visible)
                                  var tween = Tween(begin: begin, end: end);
                                  var fadeAnimation = animation.drive(tween);
                                  return FadeTransition(
                                    opacity: fadeAnimation,
                                    child: child,
                                  );
                                },
                                transitionDuration: const Duration(milliseconds: 300),
                              ),
                            );
                          },
                          child: const Text(
                            'Proceed to Pay',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    )),

                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.question_answer_sharp),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 20,
                      child: Text(
                        "How to buy Bus tickets?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 17,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
