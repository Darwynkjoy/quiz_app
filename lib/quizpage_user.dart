import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/database.dart';
import 'package:quiz_app/home_user.dart';
class QuizpageUser extends StatefulWidget {
  final String name;
  const QuizpageUser({super.key,required this.name});

  @override
  State<QuizpageUser> createState() => _QuizpageUserState();
}

class _QuizpageUserState extends State<QuizpageUser> {
  bool Answer = false;
  bool option2 = false;
  bool option3 = false;
  bool option4 = false;

  Stream<QuerySnapshot>? FlutterStream;
  PageController questionsPage=PageController();
  int? _currentPage=0;

  getontheload()async{
    if(widget.name=="Flutter"){
      FlutterStream=await FlutterDatabase.getflutterDetatils();
      }
    else if(widget.name=="Mern"){
        FlutterStream=await MernDatabase.getMernDetatils();
      }
    else if(widget.name=="Python"){
        FlutterStream=await PythonDatabase.getPythonDetatils();
      }
    else if(widget.name=="Java"){
        FlutterStream=await JavaDatabase.getJavaDetatils();
      }
    else{
      FlutterStream=await CDatabase.getCDetatils();
    }
    setState(() {
    });
  }

  @override
  void initState(){
    super.initState();
    getontheload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AllQuestionDetails()
      )
    );
  }

  Widget AllQuestionDetails(){
    return StreamBuilder(stream: FlutterStream,
    builder: (context,AsyncSnapshot<QuerySnapshot>snapshots){
      int totalQuestions = snapshots.data!.docs.length;
      double progressValue = (_currentPage! + 1) / totalQuestions;
      if(snapshots.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      if(snapshots.hasError){
        return Text("an error has occured ${snapshots.error}");
      }
      if(!snapshots.hasData || snapshots.data!.docs.isEmpty){
        return Center(child: Text("Data is not available"),);
      }
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
                    width: 270,
                    lineHeight: 16,
                    percent: progressValue.clamp(0.0, 1.0),
                    animation: true,
                    animateFromLastPercent: true,
                    animationDuration: 500,
                    progressColor: Colors.amber,
                    backgroundColor: Colors.amber.shade50,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    trailing: Text(" ${_currentPage! +1}/${snapshots.data!.docs.length}",style: TextStyle(fontSize: 18,color: Colors.blue),),
                    )
                ],
              ),
            Text("${widget.name}",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                controller: questionsPage,
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context,index){
                  DocumentSnapshot questions=snapshots.data!.docs[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 60,
                              lineWidth: 6,
                              percent: .6,
                              progressColor: Colors.blueAccent,
                              backgroundColor: Colors.grey.shade50,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: Text("20s",style: TextStyle(color: Colors.white),),
                              ),
                            Text("${questions["question"]}",
                            style: TextStyle(fontSize: 20,color: Colors.white),
                            )
                          ],
                        ),
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(Colors.transparent)
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${questions["answer"]}",style: TextStyle(fontSize: 20,color: Colors.white),),
                            Spacer(),
                            Checkbox(
                              shape: CircleBorder(),
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: Answer,
                              onChanged: (bool? newValue) { 
                                setState(() {
                                  Answer = newValue!;
                                });
                              },
                            ),
                          ],
                        ))),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(Colors.transparent)
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${questions["option2"]}",style: TextStyle(fontSize: 20,color: Colors.white),),
                            Spacer(),
                            Checkbox(
                              shape: CircleBorder(),
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: option2,
                              onChanged: (bool? newValue) { 
                                setState(() {
                                  option2 = newValue!;
                                });
                              },
                            ),
                          ],
                        ))),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(Colors.transparent)
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${questions["option3"]}",style: TextStyle(fontSize: 20,color: Colors.white),),
                            Spacer(),
                            Checkbox(
                              shape: CircleBorder(),
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: option3,
                              onChanged: (bool? newValue) { 
                                setState(() {
                                  option3 = newValue!;
                                });
                              },
                            ),
                          ],
                        ))),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(Colors.transparent)
                        ),
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${questions["option4"]}",style: TextStyle(fontSize: 20,color: Colors.white),),
                            Spacer(),
                            Checkbox(
                              shape: CircleBorder(),
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: option4,
                              onChanged: (bool? newValue) { 
                                setState(() {
                                  option4 = newValue!;
                                });
                              },
                            ),
                          ],
                        ))),
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
                          if (_currentPage! < snapshots.data!.docs.length - 1) {
                              questionsPage.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomeUser()),
                            );
                          }
                        },
                        child: Text("Next",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))),
                      ],
                    );
                  }),
                ),
              ],
            );
      }
    );
  }
}