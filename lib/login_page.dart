import 'package:flutter/material.dart';


import 'database/auth/authentication.dart';
import 'database/database.dart';
import 'login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool customTileExpanded = false;
  String mentor = "";
  @override
  Widget build(BuildContext context) {
    final auth = Authentication();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            width: 200 * size.height / 857,
            height: 200 * size.height / 857,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black45)),
            child: CircleAvatar(
              radius: 200 * size.height / 857,
              backgroundImage: const AssetImage("images/prabhupada.jpeg"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Let's get you in,",
              style: TextStyle(fontSize: 20 * size.width / 373),
            ),
          ),
          Center(
              child: customButton(
                  text: "Sign in with Google",
                  imagePath: "images/google.png",
                  size: size,
                  onPressed: () {
                    if (mentor != "") {
                      auth.signInWithGoogle();
                      Database.database.setName(mentor);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please select a mentor")));
                    }
                  })),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.0 * size.height / 857,
                horizontal: 40 * size.width / 372.7273),
            child: ExpansionTile(
              title: const Text("Select your mentor"),
              trailing: Icon(
                customTileExpanded
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down_circle,
              ),
              onExpansionChanged: (bool expanded) {
                setState(() {
                  customTileExpanded = expanded;
                });
              },
              leading: Image.asset("images/mentor.png"),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            mentor = "Mathuranath Prabhu";
                          },
                          child: const Text("Mathuranath Prabhu")),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            mentor = "Shreesha Govind Prabhu";
                          },
                          child: const Text("Shreesha Govind Prabhu")),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            mentor = "Sandesh Prabhu";
                          },
                          child: const Text("Sandesh Prabhu")),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
