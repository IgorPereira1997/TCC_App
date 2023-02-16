import 'package:flutter/material.dart';

class FiveDropDowns extends StatefulWidget {
  const FiveDropDowns({super.key});

  @override
  FiveDropDownsState createState() => FiveDropDownsState();
}

class FiveDropDownsState extends State<FiveDropDowns> {
  List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
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
                  items: dropdownItems
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  hint: const Text('Select an item'),
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
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        value: _selectedItem2,
                        items: dropdownItems
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        hint: const Text('Select an item'),
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
                            const SizedBox(width: 32),
                            DropdownButton<String>(
                              value: _selectedItem3,
                              items: dropdownItems
                                  .map(
                                    (value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              hint: const Text('Select an item'),
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
                                  const SizedBox(width: 48),
                                  DropdownButton<String>(
                                    value: _selectedItem4,
                                    items: dropdownItems
                                        .map(
                                          (value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          ),
                                        )
                                        .toList(),
                                    hint: const Text('Select an item'),
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
              items: dropdownItems
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              hint: const Text('Select an item'),
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
