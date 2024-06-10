import 'package:flutter/material.dart';
import 'package:habitmonitoring/database/database.dart';
import 'database/auth/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}
//remove addHabitDialogSincehabits are already decided
class _HomePageState extends State<HomePage> {
  final tE = TextEditingController();
  @override
  void initState() {
    Database.database.addToUserMentorList();
    super.initState();
  }

  OutlineInputBorder textFieldKa = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Color.fromARGB(255, 199, 197, 197),
      width: 1,
    ),
  );

  addHabitDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Habit"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: tE,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.task_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Habit Name",
                      hintText: 'Habit Name',
                      border: textFieldKa,
                      enabledBorder: textFieldKa,
                      focusedBorder: textFieldKa),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () async {
                    if (tE.text != "") {
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Habit name cannot be empty")));
                    }
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(color: Color.fromARGB(255, 255, 191, 0)),
                  )),
            ],
          );
        });
  }

  final a = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("My Habits"),
      ),
      floatingActionButton: ElevatedButton.icon(
          icon: const Icon(Icons.add),
          onPressed: () {
            print(a.currentUser);
            addHabitDialog();
          },
          label: const Text("Add Habit")),
      body: const SingleChildScrollView(
        child: Column(children: []),
      ),
    );
  }
}
