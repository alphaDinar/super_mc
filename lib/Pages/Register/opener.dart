import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:super_mc/Firebase/firebaseAuthService.dart';

class Opener extends StatefulWidget {
  const Opener({super.key});

  @override
  State<Opener> createState() => _OpenerState();
}

class _OpenerState extends State<Opener> {
  final FirebaseAuthService _fireAuth = FirebaseAuthService();

  @override
  void initState() {
    super.initState();

    _fireAuth.isLoggedIn().then((res) {
      if (res) {
        // Navigator.pushNamed(context, '/splash');
         Future.delayed(Duration(seconds: 3), () {
          Navigator.pushNamed(context, '/splash');
        });
      } else {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pushNamed(context, '/splash');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/fix');
          },
          child: Image.asset('images/super.png'),
        ),
      ),
    );
  }
}
