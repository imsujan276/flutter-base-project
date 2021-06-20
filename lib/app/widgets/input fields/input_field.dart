import 'package:flutter_base_project/app/constants/constants.dart';
import 'package:flutter_base_project/app/constants/theme_data.dart';
import 'package:flutter/material.dart';

/// custom text input field widget
class InputField extends StatelessWidget {
  const InputField(
      {this.label,
      this.hintText,
      this.obscureText = false,
      this.textInputType,
      this.icon,
      this.validator,
      this.onFieldSubmitted,
      this.onChanged,
      this.controller,
      this.autovalidateMode});

  final IconData? icon;
  final String? hintText;
  final TextInputType? textInputType;
  final bool obscureText;
  final validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final String? label;
  final controller;
  final autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return (new Container(
      margin: new EdgeInsets.only(
          bottom: Constants.defaultPadding, top: Constants.defaultPadding - 10),
      child: TextFormField(
        controller: controller ?? null,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        decoration: new InputDecoration(
          contentPadding: icon != null
              ? EdgeInsets.fromLTRB(0, 0, 10, 0)
              : EdgeInsets.fromLTRB(10, 0, 10, 0),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Themes.GREY)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Themes.GREY),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Themes.GREY),
          ),
          prefixIcon: icon != null ? new Icon(icon) : null,
          labelText: label ?? null,
          hintText: hintText ?? null,
          hintStyle: const TextStyle(
              color: Themes.GREY, fontSize: Constants.defaultFontSize),
          // suffixIcon: Icon(Icons.remove_red_eye_outlined),
        ),
        validator: validator ?? null,
        onFieldSubmitted: onFieldSubmitted ?? null,
        onChanged: onChanged ?? null,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.text,
      ),
    ));
  }
}
