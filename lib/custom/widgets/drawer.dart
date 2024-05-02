import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          SizedBox(height: 60),
          CircleAvatar(
            radius: 45,

            // child: Image.asset("assets/splash_screen/quotify_logo.png"),
          ),
          SizedBox(height: 10),
          Text("Welcome To Quotify!"),
          SizedBox(height: 10),
          Text("Prince Patel"),
          SizedBox(height: 10),
          Divider(thickness: 2),
        ],
      ),
    );
  }
}
