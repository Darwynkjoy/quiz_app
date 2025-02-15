import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState()=> _loginPageState();
}
class _loginPageState extends State<LoginPage>{
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login",style: TextStyle(fontSize: 30,color: Colors.blue),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                  label: Text("Email"),labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Example@email.com",hintStyle: TextStyle(fontSize: 15,color: Colors.grey)),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                  label: Text("Password"),labelStyle: TextStyle(color: Colors.blue),
                  hintText: "enter your password",hintStyle: TextStyle(fontSize: 15,color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }
}