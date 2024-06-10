import 'package:flutter/widgets.dart';


import 'database/auth/authentication.dart';
import 'home_page.dart';
import 'login_page.dart';


class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final Authentication _authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _authentication.authStateChanges,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
