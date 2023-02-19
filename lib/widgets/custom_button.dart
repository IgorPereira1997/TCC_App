import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.choosenColor,
    this.choosenFontWeight,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color? choosenColor;
  final FontWeight? choosenFontWeight;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(150, 40)),
          backgroundColor:
              MaterialStateProperty.all(choosenColor ?? Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.transparent)),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: choosenFontWeight ?? FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
