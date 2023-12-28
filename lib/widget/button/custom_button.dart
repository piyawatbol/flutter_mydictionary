import 'package:flutter/material.dart';

import '../autext/auto_text.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final VoidCallback ontap;
  final double? width;
  final double? height;
  const CustomButton(
      {required this.ontap, this.title, this.width, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Set the border radius here
            ),
          ),
        ),
        onPressed: ontap,
        child: AutoText(
          "${title}",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
