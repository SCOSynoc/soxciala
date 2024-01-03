import 'package:flutter/material.dart';

import 'common_textfeild.dart';

class MultiSelectDropdown extends StatefulWidget {
  const MultiSelectDropdown({super.key});

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
   List<String> _selectedItems = [];
  List<String> _allItems = [];
  TextEditingController controller = TextEditingController();
  bool show = false;

  void _toggleItem(String item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(

        children: <Widget>[
          ListTile(
            subtitle: DropdownButtonHideUnderline(
              child: Column(
                children: [
                  CommonTextField(
                    controller: controller, hintText:_selectedItems.isEmpty ?"" : " @ ${_selectedItems.join(", ")}",
                    onChanged: (String value) {

                    }, obscureText: false,),
                  Visibility(
                    visible: show,
                    child: DropdownButton(
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_selectedItems.isEmpty ?"" : " @ ${_selectedItems.join(", ")}"),
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                      items: _allItems.map((item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (selectedItem) {
                        _toggleItem(selectedItem!);
                      },
                      value: null,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          // Text("Selected Items: ${_selectedItems.join(", ")}"),
        ],
      ),
    );
  }
}

