import 'package:flutter/material.dart';
import 'package:quiz_app/login_page.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _createAccountState();
}

class _createAccountState extends State<CreateAccount> {
  TextEditingController nameContoller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            SizedBox(height: 100,),
            Text(
              "Create account",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign up to start playing and test your knowledge !",
              style: TextStyle(fontSize: 20, color: Colors.white),
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
                  label: Text("Re-enter password"),
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Re-enter your password",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            Spacer(),
            Center(
              child: SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Create account",
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
                    "have an account ?",
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
