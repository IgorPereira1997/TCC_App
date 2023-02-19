import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.labelText,
    required this.items,
    required this.controller,
    this.choosedIcon,
  }) : super(key: key);

  final String labelText;
  final List<String> items;
  final IconData? choosedIcon;
  final TextEditingController controller;

  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  String? _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.controller.text.isNotEmpty
        ? widget.controller.text
        : widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: Colors.white,
          child: InputDecorator(
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
                  widget.choosedIcon ?? Icons.arrow_drop_down,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              labelText: widget.labelText,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _dropdownValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    _dropdownValue = newValue;
                  });
                  widget.controller.text = newValue ?? '';
                },
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
