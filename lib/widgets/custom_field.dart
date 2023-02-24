import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.choosedIcon,
    //required this.hintText,
    required this.labelText,
    this.controller,
    this.validator,
    required this.enableSuggestions,
    required this.autocorrect,
    required this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
    this.initialValue,
    this.readOnly,
    this.onTap,
    this.autoValidate,
    this.enabled,
  }) : super(key: key);

  final IconData? choosedIcon;
  //final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String)? onChanged;
  final Function()? onTap;
  final String? initialValue;
  final TextEditingController? controller;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool? readOnly;
  final bool? enabled;
  final AutovalidateMode? autoValidate;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
              color: Colors.white,
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
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
                enableSuggestions: enableSuggestions,
                autocorrect: autocorrect,
                keyboardType: keyboardType,
                onChanged: onChanged,
                onSaved: onSaved,
                enabled: enabled,
                validator: validator,
                readOnly: readOnly ?? false,
                initialValue: initialValue,
                onTap: onTap,
                autovalidateMode: autoValidate,
                inputFormatters: inputFormatters,
              )),
        ),
      );
}
