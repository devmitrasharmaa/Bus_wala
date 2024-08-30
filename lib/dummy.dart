import 'package:Paytm/homepage.dart';
import 'package:flutter/material.dart';

class dummy extends StatefulWidget {
  const dummy({super.key});

  @override
  State<dummy> createState() => _dummyState();
}

class _dummyState extends State<dummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 42, 114),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Stack(
            children: [
              Image.asset('assets/images/screen.jpg'),
              Positioned(
                bottom: 60,
                left: 105,
                right: 105,
                child: SizedBox(
                  height: 65,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40))),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 2, 42, 114))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const HomePage();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                  position: offsetAnimation, child: child);
                            },
                            transitionDuration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: Container(
                        // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(CupertinoIcons.ticket_fill),
                            Text(
                              'Buy Bus Ticket',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
