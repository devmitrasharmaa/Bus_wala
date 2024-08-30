import 'package:Paytm/dummy.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool acceptedGuidelines = prefs.getBool('accepted_guidelines') ?? false;

  runApp(BusTicketBookingApp(acceptedGuidelines: acceptedGuidelines));
}

class BusTicketBookingApp extends StatelessWidget {
  final bool acceptedGuidelines;

  const BusTicketBookingApp({super.key, required this.acceptedGuidelines});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: acceptedGuidelines ? const dummy() : const GuidelinesScreen(),
    );
  }
}

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Guidelines'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                    "-Buskar is an educational clone app developed solely for educational and learning purposes. The app is intended to serve as a demonstration and learning tool, allowing users to explore and experiment with various features commonly found in similar applications.\n\nBuskar is intended for educational and non-commercial use only. Any misuse or involvement in any form of illegal activity through the app is strictly prohibited.\n\nThe creator and owner of Buskar shall not be held responsible for any unlawful or unethical use of the app by users. Users are solely responsible for their actions while using the app.\n\nBuskar may include content, images, and features that are subject to copyright or intellectual property rights. Users are required to respect all copyright and intellectual property laws when using the app.\n\nAll use of Buskar is at the user's own risk. The app is provided on an 'awaien' basis without any warranties or guarantees. The creator and owner of the app disclaim any liability for any damages or losses incurred while using the app.\n\n Users are expected to comply with all applicable laws, regulations, and guidelines while using Buskar. Any illegal activities or actions that violate the terms of use are strictly prohibited.\n\nIf you have any questions or concerns regarding Buskar, please contact us at t.me/Buskarappbot\n\nLast updated: 09-09-2023"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('accepted_guidelines', true);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const dummy()),
                    );
                  },
                  child: const Text('Accept'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text('Reject'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
