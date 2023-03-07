import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final List<int> values = [0, 1, 2, 3, 4, 8, 9];
  final Function(int) onChanged;
  final int? initialValue;

  CustomRadio({
    Key? key,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  @override
  CustomRadioState createState() => CustomRadioState();
}

class CustomRadioState extends State<CustomRadio> {
  late int _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? widget.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.values.map((value) {
          return Column(
            children: [
              Text('$value'),
              Radio<int>(
                value: value,
                groupValue: _selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                  widget.onChanged(newValue!);
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
