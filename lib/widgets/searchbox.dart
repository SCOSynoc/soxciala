import 'package:flutter/material.dart';
import 'package:soxciala/AuthBloc/Login/auth_state.dart';
import 'package:soxciala/utlis/helper.dart';

import '../models/Users.dart';
import 'followButton.dart';

class SearchBox extends StatefulWidget {
  final UsersFetched states;

  SearchBox({super.key, required this.states});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _searchController = TextEditingController();
   List<Users> _suggestions = [];

  List<Users> _filteredSuggestions = [];

  @override
  void initState() {

    setState(() {
      _suggestions = widget.states.users;
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: MediaQuery.of(context).size.width < 800 ? 6 : 12,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _filteredSuggestions = _suggestions
                      .where((suggestion) =>
                      suggestion.userName.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                  Helper.searchList.value = _suggestions
                      .where((suggestion) =>
                      suggestion.userName.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}