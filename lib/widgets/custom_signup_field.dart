import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
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
  }) : super(key: key);

  final IconData? choosedIcon;
  //final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final TextEditingController controller;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final TextInputType keyboardType;

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
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      choosedIcon,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  //hintText: hintText,
                  labelText: labelText,
                ),
                obscureText: obscureText,
                obscuringCharacter: '•',
                enableSuggestions: enableSuggestions,
                autocorrect: autocorrect,
                keyboardType: keyboardType,
                onChanged: (value) {
                  print(
                      'Controlller name: ${controller.hashCode}; Value: ${controller.text}');
                },
                onSaved: (String? value) {},
                validator: validator)),
      ),
    );
  }
}
