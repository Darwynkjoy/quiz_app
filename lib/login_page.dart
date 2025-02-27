import 'package:flutter/material.dart';
import 'package:quiz_app/create_account.dart';
import 'package:quiz_app/forgot_password.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Log in to track your progress and continue your quiz journey.",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Spacer(),
            TextField(
              cursorColor: Colors.blue,
              controller: emailController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.white),
                  ),
                  label: Text("Email"),
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Example@email.com",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            Spacer(),
            TextField(
              cursorColor: Colors.blue,
              controller: passwordController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.white),
                  ),
                  label: Text("Password"),
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                    },
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Spacer(),
            Center(
              child: SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
            Spacer(),
            Row(
              children: [
                Flexible(
                    child: Divider(
                  color: Colors.white,
                )),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "don't have an account ?",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Flexible(
                    child: Divider(
                  color: Colors.white,
                )),
              ],
            ),
            Spacer(),
            Center(
              child: SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccount()));
                      },
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
