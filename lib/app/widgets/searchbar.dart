import 'package:flutter_base_project/app/constants/theme_data.dart';
import 'package:flutter/material.dart';

/// custom search bar widget
class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.hintText,
    required this.onSubmitted,
    required this.controller,
  });

  final String hintText;
  final ValueChanged<String> onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Themes.WHITE,
      margin: EdgeInsets.all(15.0),
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: TextField(
          onSubmitted: onSubmitted,
          style: TextStyle(height: 1.0),
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0.0),
            hintText: "$hintText",
            prefixIcon: Icon(
              Icons.search,
              color: Themes.BLACK,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Themes.BLACK, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Themes.BLACK, width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
