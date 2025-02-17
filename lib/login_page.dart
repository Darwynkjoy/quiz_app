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
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            Text("Login",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
            Text("Welcome back",style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 50,),
            TextField(
              cursorColor: Colors.blue,
              controller: emailController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 2,color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 2,color: Colors.white),
                ),
                  label: Text("Email"),labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Example@email.com",hintStyle: TextStyle(fontSize: 15,color: Colors.grey)),
            ),
            SizedBox(height: 20,),
            TextField(
              cursorColor: Colors.blue,
              controller: passwordController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 2,color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 2,color: Colors.white),
                ),
                  label: Text("Password"),labelStyle: TextStyle(color: Colors.blue),
                  hintText: "Enter your password",hintStyle: TextStyle(fontSize: 15,color: Colors.grey)),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(onPressed: (){}, child: Text("Forgot Password ?",style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold),)),
              ],
            ),
            Center(
              child: SizedBox(
                height: 45,
                width: 300,
                child: ElevatedButton(onPressed: (){}, child: Text("Login",style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold),))),
            ),
            Divider(color: Colors.white,),
          ],
        ),
      ),
    );
  }
}