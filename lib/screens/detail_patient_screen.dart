import 'package:flutter/material.dart';

class FiveDropDowns extends StatefulWidget {
  @override
  _FiveDropDownsState createState() => _FiveDropDownsState();
}

class _FiveDropDownsState extends State<FiveDropDowns> {
  List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? _selectedItem1;
  String? _selectedItem2;
  String? _selectedItem3;
  String? _selectedItem4;
  String? _selectedItem5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // First dropdown menu
            Column(
              children: [
                DropdownButton<String>(
                  value: _selectedItem1,
                  items: _dropdownItems
                      .map(
                        (value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ),
                      )
                      .toList(),
                  hint: Text('Select an item'),
                  onChanged: (value) {
                    setState(() {
                      _selectedItem1 = value;
                    });
                  },
                ),
                if (_selectedItem1 != null && _selectedItem1!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 16),
                      DropdownButton<String>(
                        value: _selectedItem2,
                        items: _dropdownItems
                            .map(
                              (value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ),
                            )
                            .toList(),
                        hint: Text('Select an item'),
                        onChanged: (value) {
                          setState(() {
                            _selectedItem2 = value;
                          });
                        },
                      ),
                      if (_selectedItem2 != null && _selectedItem2!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 32),
                            DropdownButton<String>(
                              value: _selectedItem3,
                              items: _dropdownItems
                                  .map(
                                    (value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ),
                                  )
                                  .toList(),
                              hint: Text('Select an item'),
                              onChanged: (value) {
                                setState(() {
                                  _selectedItem3 = value;
                                });
                              },
                            ),
                            if (_selectedItem3 != null &&
                                _selectedItem3!.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: 48),
                                  DropdownButton<String>(
                                    value: _selectedItem4,
                                    items: _dropdownItems
                                        .map(
                                          (value) => DropdownMenuItem(
                                            child: Text(value),
                                            value: value,
                                          ),
                                        )
                                        .toList(),
                                    hint: Text('Select an item'),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedItem4 = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ),
                    ],
                  ),
              ],
            ),
            // Remaining dropdown menus
            DropdownButton<String>(
              value: _selectedItem5,
              items: _dropdownItems
                  .map(
                    (value) => DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),
                  )
                  .toList(),
              hint: Text('Select an item'),
              onChanged: (value) {
                setState(() {
                  _selectedItem5 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
