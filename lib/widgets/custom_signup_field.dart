import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatefulWidget {
  const CustomField({
    Key? key,
    required this.choosedIcon,
    //required this.hintText,
    required this.labelText,
    required this.controller,
    this.validator,
    required this.obscureText,
    required this.enableSuggestions,
    required this.autocorrect,
    required this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
  }) : super(key: key);

  final IconData? choosedIcon;
  //final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String)? onChanged;
  final TextEditingController controller;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Material(
            color: Colors.white,
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    widget.choosedIcon,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                //hintText: hintText,
                labelText: widget.labelText,
              ),
              obscureText: widget.obscureText,
              obscuringCharacter: '•',
              enableSuggestions: widget.enableSuggestions,
              autocorrect: widget.autocorrect,
              keyboardType: widget.keyboardType,
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              validator: widget.validator,
              inputFormatters: widget.inputFormatters,
            )),
      ),
    );
  }
}
