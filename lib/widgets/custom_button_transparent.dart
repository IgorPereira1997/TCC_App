import 'package:flutter/material.dart';

class CustomTransparentButton extends StatelessWidget {
  const CustomTransparentButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(150, 40)),
          backgroundColor: MaterialStateProperty.all(
              const Color(0xFF0C2365).withOpacity(0.05)),
          shadowColor: MaterialStateProperty.all(
              const Color(0xFF0C2365).withOpacity(0.05)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide.none),
          ),
        ),
        onPressed: onTap,
        child: Text(text),
      );
}
