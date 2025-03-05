import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/home_user.dart';
import 'package:quiz_app/quizpage_user.dart';
class FinishpageUser extends StatefulWidget {
  final String name;
  final int totalQuestions;
  final int score;
  const FinishpageUser({super.key,required this.name,required this.totalQuestions,required this.score});

  @override
  State<FinishpageUser> createState() => _FinishpageUserState();
}

class _FinishpageUserState extends State<FinishpageUser> {

  @override
  Widget build(BuildContext context) {
    double percentage = widget.score / widget.totalQuestions;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Quiz result",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
            Container(
              height: 300,
              width: 300,
              child: Lottie.asset(
                percentage >= 0.5 ? "assets/images/trophy.json" : "assets/images/fail.json",
              ),
            ),
            Text(
              percentage >= 0.5 
                ? "Congratulations!" 
                : "Don't give up!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
            Text("Your score",style: TextStyle(fontSize: 25,color: Colors.white38),),
            Text(
        "${widget.score}/${widget.totalQuestions}",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: percentage >= 0.8  
              ? Colors.green
              : percentage >= 0.5  
                  ? Colors.amber
                  : percentage >= 0.3  
                      ? Colors.orange
                      : Colors.red, 
        ),
      ),
      Text(
        percentage >= 0.8 
            ? "Fantastic job!" 
            : percentage >= 0.5 
                ? "You did a good job" 
                : percentage >= 0.3
                ? "Better luck next time"
                : "Improve on next time",
        style: TextStyle(fontSize: 18, color: Colors.white38),
      ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 160,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(Colors.blue)
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>QuizpageUser(name: widget.name)));
                    },
                    child: Text(
                            "Try again",
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )),
                        
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(Colors.blue)
                      ),
                      onPressed: () {
                        Navigator.pop(context, MaterialPageRoute(builder: (context)=>HomeUser()));
                      },
                      child: Text(
                              "Go to home",
                              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}