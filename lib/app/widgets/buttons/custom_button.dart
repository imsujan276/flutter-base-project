import 'package:flutter/material.dart';

/// custom text button widget
class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    required this.label,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: new Text(
        label,
        textAlign: TextAlign.center,
      ),
      onPressed: onPressed,
      // style: TextButton.styleFrom(
      //   primary: Colors.purple, // foreground/text
      //   // backgroundColor: Colors.amber, // background
      //   // textStyle: TextStyle(
      //   //     fontSize: Constants.defaultFontSize),
      // ),
    );
  }
}

/// custom raised/elevated button widget
class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    required this.label,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50,
      child: ElevatedButton(
        child: new Text(
          label,
          textAlign: TextAlign.center,
        ),
        onPressed: onPressed,
        // style: ElevatedButton.styleFrom(
        //   primary: Themes.GREY, // background
        //   onPrimary: Themes.BLACK, // foreground/text
        //   onSurface: Themes.GREY, // disabled
        //   textStyle: TextStyle(
        //       fontWeight: FontWeight.normal,
        //       fontSize: Constants.defaultFontSize),
        // ),
      ),
    );
  }
}

/// custom outlined button widget
class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton({
    required this.label,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: new Text(label, textAlign: TextAlign.center),
      onPressed: onPressed,
      // style: OutlinedButton.styleFrom(
      //   primary: Colors.white, // foreground
      //   onSurface: Colors.grey, // disabled
      //   backgroundColor: Colors.teal, // background
      // ),
    );
  }
}
