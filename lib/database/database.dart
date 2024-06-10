import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gsheets/gsheets.dart';
import 'package:habitmonitoring/database/constants.dart';

import '../secrets/env.dart';

class Database {
  final gsheet = GSheets(Env.key);
  Database._();
  static final database = Database._();
  late final String name;
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  addToUserMentorList() async {
    print(user!.email);
    final userExists = await firebaseFirestore
        .collection("userMentorPairList")
        .doc(user!.email)
        .get();
    if (!userExists.exists) {
      firebaseFirestore
          .collection("userMentorPairList")
          .doc(user!.email)
          .set({"mentor": name, "mentee": user!.email});
    }
  }

  addHabitToFirebase({
    required String name,
  }) async {}

  getStatusByHabitName({required column}) async {
    final snapShot = await gsheet.spreadsheet(Env.key2);
    final usersheet = snapShot.worksheetByTitle(user!.email.toString());
  }

  updateStatusInGoogleSheet() {}
  addHabitToGoogleSheets(String habitName) async {
    final snapShot = await gsheet.spreadsheet(Env.key2);

    final usersheet = snapShot.worksheetByTitle(user!.email.toString()) ??
        await snapShot.addWorksheet(user!.email.toString());
    final habitNameAndEmail =
        "${user!.displayName}\n$habitName\n${user!.email}";
    final habitNumber = await firebaseFirestore
        .collection("habitNumbers")
        .doc(user!.email)
        .collection("habits")
        .doc("habitNumber")
        .get();
    usersheet.values
        .insertValue(habitNameAndEmail, column: habitNumber["column"], row: 0);
    firebaseFirestore
        .collection("habitNumbers")
        .doc(user!.email)
        .collection("habits")
        .doc("habitNumber")
        .set({"column": habitNumber["column"] + 1});
  }

  setName(String name) {
    this.name = name;
  }
}
