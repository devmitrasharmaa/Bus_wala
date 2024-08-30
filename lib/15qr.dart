import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String imageUrl;

  const ImageDialog({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.fromLTRB(13, 10, 13, 60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Dialog(
          shadowColor: Colors.transparent,
          insetPadding: const EdgeInsets.fromLTRB(2, 9, 2, 25),
          child: Container(
            child: Image.asset(
              imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
