

import 'status.dart';

class Habit {
  final String habitName;
  List<Status> thisweekStatus = [
    Status.unattended,
    Status.unattended,
    Status.unattended,
    Status.unattended,
    Status.unattended,
    Status.unattended,
    Status.unattended
  ];
  final String devoteeName;
  final int column;
  final String mentorName;
  Habit(
      {required this.habitName,
      required this.mentorName,
      required this.devoteeName,
      required this.column}) {
       
          
      }

  factory Habit.fromJson(Map<String, dynamic> map) {
    return Habit(
        habitName: map["habitName"],
        mentorName: map["mentorName"],
        devoteeName: map["devoteeName"],
        column: map["column"]);
  }

  toJson() {
    return {
      "habitName": habitName,
      "mentorName": mentorName,
      "devoteeName": devoteeName,
      "column": column
    };
  }
}
