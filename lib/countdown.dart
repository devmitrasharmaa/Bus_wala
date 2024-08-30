import 'package:flutter/material.dart';

class CountdownUnit extends StatelessWidget {
  final int value;
  final String label;

  const CountdownUnit({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              value.toString().padLeft(2, '0') +
                  (label == 'SECONDS' ? ' ' : ':'),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: const TextStyle(
                wordSpacing: 5,
                fontSize: 11,
                letterSpacing: -0.2,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
