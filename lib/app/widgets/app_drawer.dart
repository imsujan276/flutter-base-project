import 'package:flutter/material.dart';

/// custom app drawer for sidebar
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        // color: Colors.grey[50],
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 60,
              ),
              title: Text(
                "Title",
                maxLines: 1,
              ),
              subtitle: Text(
                "This is subtile",
                maxLines: 1,
              ),
              // onTap: () {
              //   Navigator.of(context).popAndPushNamed("/");
              // },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(
                'Logout',
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
