import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/login_page.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

TextEditingController emailController=TextEditingController();
bool isLoading=false;
String? errorMessage;

Future <void> _sendForgotPasswordResetEmail()async{
    setState(() {
      isLoading=true;
      errorMessage=null;
    });
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: emailController.text.trim(),
      );
      setState(() {
        isLoading=false;
      });
      _ShowDialog("Password reset email sent!.please check your inbox");
  } on FirebaseAuthException catch(e){
    setState(() {
      isLoading=false;
    });
    _ShowDialog(e.message ?? "an error occurred");
  }
  }

  void _ShowDialog(String message){
    showDialog(context: context, builder: (context)=>
      AlertDialog(
        title: Text("Notification"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("OK"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Triv",
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: "io",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
        leading: IconButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage())),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80,),
            Text(
              "Forgot password ?",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
            '''Oops ! Forgot your password ?\nNo worries, it happens! Just enter your email, and we’ll help you reset it in no time.''',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 30,),
            TextField(
              cursorColor: Colors.blue,
              controller: emailController,
              style: TextStyle(color: Colors.white),
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
            SizedBox(height: 40,),
            Center(
              child: SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        if(emailController.text.trim().isNotEmpty){
                        _sendForgotPasswordResetEmail();
                        }
                        else{ ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Email should not be empty"),
                              backgroundColor: Colors.red,
                            ));
                        }
                      },
                      child: Text(
                        "Submit",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Login",
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
