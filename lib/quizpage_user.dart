import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/database.dart';
import 'package:quiz_app/finishpage_user.dart';
import 'package:quiz_app/home_user.dart';

class QuizpageUser extends StatefulWidget {
  final String name;
  const QuizpageUser({super.key, required this.name});

  @override
  State<QuizpageUser> createState() => _QuizpageUserState();
}

class _QuizpageUserState extends State<QuizpageUser> {
  Stream<QuerySnapshot>? FlutterStream;
  PageController questionsPage = PageController();
  int _currentPage = 0;
  int score = 0;
  String? _selectedAnswer;
  bool _isAnswered = false;
  String? _correctAnswer;

  getontheload() async {
    if (widget.name == "Flutter") {
      FlutterStream = await FlutterDatabase.getflutterDetatils();
    } else if (widget.name == "Mern") {
      FlutterStream = await MernDatabase.getMernDetatils();
    } else if (widget.name == "Python") {
      FlutterStream = await PythonDatabase.getPythonDetatils();
    } else if (widget.name == "Java") {
      FlutterStream = await JavaDatabase.getJavaDetatils();
    } else {
      FlutterStream = await CDatabase.getCDetatils();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AllQuestionDetails(),
      ),
    );
  }

  Widget AllQuestionDetails() {
    return StreamBuilder(
      stream: FlutterStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshots.hasError) {
          return Text("An error has occurred: ${snapshots.error}");
        }
        if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
          return Center(child: Text("Data is not available"));
        }

        int totalQuestions = snapshots.data!.docs.length;
        double progressValue = (_currentPage + 1) / totalQuestions;

        return Column(
          children: [
           Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          backgroundColor: const Color.fromARGB(255, 51, 51, 51),
                          title: Text("Would you like to exit the quiz? Your progress may not be saved.",style: TextStyle(color: Colors.white,fontSize: 18),),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeUser()));
                            },
                            child: Text("Yes",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),)),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("No",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),))
                          ],
                        );
                      });
                    },
                    icon: Icon(Icons.close, color: Colors.white),
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        CircleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                  ),
                  LinearPercentIndicator(
                    width: 250,
                    lineHeight: 16,
                    percent: progressValue.clamp(0.0, 1.0),
                    animation: true,
                    animateFromLastPercent: true,
                    animationDuration: 500,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.amber.shade50,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    trailing: Text(" ${_currentPage +1}/${snapshots.data!.docs.length}",style: TextStyle(fontSize: 18,color: Colors.blue),),
                    )
                ],
              ),
            Text(
              "${widget.name}",
              style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                    _selectedAnswer = null;
                    _isAnswered = false;
                  });
                },
                controller: questionsPage,
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot questions = snapshots.data!.docs[index];
                  _correctAnswer = questions["answer"];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                      padding: EdgeInsets.all(10),
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 51, 51, 51),
                        ),
                        child: Center(
                          child: Text("${questions["question"]}",style: TextStyle(fontSize: 20,color: Colors.white),
                          ),
                        ),
                    ),
                      ...["option1", "option2", "option3", "option4"].map((option) {
                        String optionValue = questions[option];
                        bool isSelected = _selectedAnswer == optionValue;
                        bool isCorrect = optionValue == _correctAnswer;

                        Color borderColor = Colors.white;
                        Icon? icon;

                        if (_isAnswered) {
                          if (isSelected && isCorrect) {
                            borderColor = Colors.green;
                            icon = Icon(Icons.check, color: Colors.green); 
                          } else if (isSelected && !isCorrect) {
                            borderColor = Colors.red;
                            icon = Icon(Icons.close, color: Colors.red); 
                          } else if (isCorrect) {
                            borderColor = Colors.green;
                            icon = Icon(Icons.check, color: Colors.green); 
                          }
                        }

                        return GestureDetector(
                          onTap: () {
                            if (!_isAnswered) {
                              setState(() {
                                _selectedAnswer = optionValue;
                                _isAnswered = true;
                                if (isCorrect) {
                                  score++; 
                                }
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: borderColor, width: 2),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  optionValue,
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                ),
                                if (_isAnswered && icon != null) icon, 
                              ],
                            ),
                          ),
                        );
                      }).toList(),

                      SizedBox(
                      height: 50,
                      width: double.infinity,
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
                          if (_currentPage < snapshots.data!.docs.length - 1) {
                              questionsPage.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => FinishpageUser(name: widget.name,totalQuestions: totalQuestions,score: score,)),
                            );
                          }
                        },
                        child: Text(
                                (_currentPage + 1 == snapshots.data!.docs.length) ? "Finish" : "Next",
                                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            )),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
