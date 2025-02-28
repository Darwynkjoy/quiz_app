import 'package:flutter/material.dart';
import 'package:quiz_app/database.dart';
class EditQuiz extends StatefulWidget {
  final String id;
  final String question;
  final String answer;
  final String option2;
  final String option3;
  final String option4;

  const EditQuiz(
    {super.key,
    required this.id,
    required this.question,
    required this.answer,
    required this.option2,
    required this.option3,
    required this.option4}
    );
  @override
  State<EditQuiz> createState() => _EditQuizState();
  }

class _EditQuizState extends State<EditQuiz> {
  late TextEditingController questionController=TextEditingController();
  late TextEditingController answerController=TextEditingController();
  late TextEditingController wrongController1=TextEditingController();
  late TextEditingController wrongController2=TextEditingController();
  late TextEditingController wrongController3=TextEditingController();

  @override
  void initState(){
    super.initState();
    questionController = TextEditingController(text: widget.question);
    answerController = TextEditingController(text: widget.answer);
    wrongController1 = TextEditingController(text: widget.option2);
    wrongController2 = TextEditingController(text: widget.option3);
    wrongController3 = TextEditingController(text: widget.option4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("${widget}",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: false,
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter the question ?",style: TextStyle(fontSize: 18,color: Colors.white),),
            SizedBox(height: 5,),
            SizedBox(
              height: 100,
              child: TextField(
                cursorColor: Colors.blue,
                controller: questionController,
                style: TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 5,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2, color: Colors.white),
                  ),
                  labelText: "Question",
                  labelStyle: TextStyle(color: Colors.blue,fontSize: 17),
                  hintText: "Enter the Question",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  ),
                ),
              ),
              Spacer(),
              Text("Enter the answer",style: TextStyle(fontSize: 18,color: Colors.white),),
              SizedBox(height: 5,),
              TextField(
                cursorColor: Colors.blue,
                controller: answerController,
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
                    label: Text("Answer"),
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 255, 8)),
                    hintText: "Enter the answer",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
              ),
              SizedBox(height: 10,),
              Text("Enter the option 2",style: TextStyle(fontSize: 18,color: Colors.white),),
              SizedBox(height: 5,),
              TextField(
                cursorColor: Colors.blue,
                controller: wrongController1,
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
                    label: Text("Option 2"),
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Enter the Wrong answer",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
              ),
              SizedBox(height: 10,),
              Text("Enter the option 3",style: TextStyle(fontSize: 18,color: Colors.white),),
              SizedBox(height: 5,),
              TextField(
                cursorColor: Colors.blue,
                controller: wrongController2,
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
                    label: Text("Option 3"),
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Enter the Wrong answer",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
              ),
              SizedBox(height: 10,),
              Text("Enter the option 4",style: TextStyle(fontSize: 18,color: Colors.white),),
              SizedBox(height: 5,),
              TextField(
                cursorColor: Colors.blue,
                controller: wrongController3,
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
                    label: Text("Option 4"),
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: "Enter the Wrong answer",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                child: SizedBox(
                    height: 45,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: ()async{
                          Map<String,dynamic> updateInfo={
                            "question":questionController.text,
                            "answer":answerController.text,
                            "option2":wrongController1.text,
                            "option3":wrongController2.text,
                            "option4":wrongController3.text,
                            "id":widget.id,
                          };
                          if(questionController.text.isNotEmpty && answerController.text.isNotEmpty 
                          && wrongController1.text.isNotEmpty && wrongController2.text.isNotEmpty 
                          && wrongController3.text.isNotEmpty){
                           await FlutterDatabase.updateflutterDetails(widget.id, updateInfo);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Question updated successfully!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            setState(() {
                              questionController.clear();
                              answerController.clear();
                              wrongController1.clear();
                              wrongController2.clear();
                              wrongController3.clear();
                            });
                            Navigator.pop(context);
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Fill all textfields"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            }
                            },
                            child: Text(
                              "Edit question",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ))),
                            ),
              ),
          ],
        ),
      ),
    );
  }
}