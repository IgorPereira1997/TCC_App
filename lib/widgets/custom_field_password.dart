import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFieldPassword extends StatefulWidget {
  const CustomFieldPassword({
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
  State<CustomFieldPassword> createState() => _CustomFieldPasswordState();
}

class _CustomFieldPasswordState extends State<CustomFieldPassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
              color: Colors.white,
              child: TextFormField(
                controller: widget.controller,
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
                      widget.choosedIcon,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(
                        _obscureText
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        color: Colors.grey,
                        size: 17,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  labelText: widget.labelText,
                ),
                obscureText: _obscureText,
                obscuringCharacter: '•',
                enableSuggestions: widget.enableSuggestions,
                autocorrect: widget.autocorrect,
                keyboardType: widget.keyboardType,
                onChanged: widget.onChanged,
                onSaved: widget.onSaved,
                enabled: widget.enabled,
                validator: widget.validator,
                readOnly: widget.readOnly ?? false,
                initialValue: widget.initialValue,
                onTap: widget.onTap,
                autovalidateMode: widget.autoValidate,
                inputFormatters: widget.inputFormatters,
              )),
        ),
      );
}
