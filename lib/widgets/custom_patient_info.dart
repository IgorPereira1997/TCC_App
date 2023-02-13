import 'package:flutter/material.dart';

class CustomPatientButton extends StatefulWidget {
  const CustomPatientButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  State<CustomPatientButton> createState() => _CustomPatientButtonState();

  static fromMap(Map<String, dynamic> data) {}
}

class _CustomPatientButtonState extends State<CustomPatientButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(400, 40)),
          //backgroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.white;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.transparent)),
          ),
        ),
        onPressed: widget.onTap,
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
