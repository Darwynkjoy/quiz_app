import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/login_page.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  void pusher(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => pusher(context));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset("assets/images/quiz.json",width: 150,height: 150,fit: BoxFit.cover)),
          RichText(
          text: TextSpan(
            text: "Triv",
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: "io",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ],
          ),
        ),
        ],
      ),
    );
  }
}
