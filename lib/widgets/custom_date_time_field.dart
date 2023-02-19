import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class BirthDateField extends StatefulWidget {
  const BirthDateField({
    Key? key,
    required this.choosedIcon,
    required this.labelText,
    required this.controller,
    this.validator,
    required this.enableSuggestions,
    required this.autocorrect,
    required this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
    this.initialValue,
    this.onTap,
    this.autoValidate,
    this.enabled,
  }) : super(key: key);

  final IconData? choosedIcon;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String)? onChanged;
  final Function()? onTap;
  final String? initialValue;
  final TextEditingController controller;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool? enabled;
  final AutovalidateMode? autoValidate;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  BirthDateFieldState createState() => BirthDateFieldState();
}

class BirthDateFieldState extends State<BirthDateField> {
  final DateTime _minimumDate = DateTime(1900, 1, 1);
  final DateTime _maximumDate = DateTime.now();

  final brazilianDateFormat = DateFormat('dd/MM/yyyy', "pt_BR");

  @override
  void initState() {
    super.initState();
    //initializeDateFormatting('pt_BR', null);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Localizations.override(
          context: context,
          locale: const Locale("pt", "BR"),
          child: SizedBox(
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
                    labelText: widget.labelText,
                  ),
                  enableSuggestions: widget.enableSuggestions,
                  autocorrect: widget.autocorrect,
                  keyboardType: widget.keyboardType,
                  onChanged: widget.onChanged,
                  onSaved: widget.onSaved,
                  enabled: widget.enabled,
                  validator: widget.validator,
                  readOnly: true,
                  initialValue: widget.initialValue,
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: _maximumDate,
                      firstDate: _minimumDate,
                      lastDate: _maximumDate,
                      locale: const Locale("pt", "BR"),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        widget.controller.text =
                            brazilianDateFormat.format(selectedDate);
                      });
                    }
                    if (widget.onTap != null) {
                      widget.onTap!();
                    }
                  },
                  autovalidateMode: widget.autoValidate,
                  inputFormatters: widget.inputFormatters,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
