import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/addquiz_admin.dart';
import 'package:quiz_app/database.dart';
import 'package:quiz_app/editquiz_admin.dart';
class QuestionsPage extends StatefulWidget {
  final String name;
  const QuestionsPage({super.key,required this.name});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  Stream<QuerySnapshot>? FlutterStream;

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
      appBar: AppBar(
        title: Text("${widget.name}",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: false,
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: AllQuestionDetails(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddQuiz(name: widget.name)));
        },
        child: Icon(Icons.add,color: Colors.black,size: 35,),),
    );
  }
  Widget AllQuestionDetails(){
    return StreamBuilder(stream: FlutterStream,
    builder: (context,AsyncSnapshot<QuerySnapshot>snapshots){
      if(snapshots.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      if(snapshots.hasError){
        return Text("an error has occured ${snapshots.error}");
      }
      if(!snapshots.hasData || snapshots.data!.docs.isEmpty){
        return Center(child: Text("Data is not available"),);
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total of ${snapshots.data!.docs.length} questions",style: TextStyle(fontSize: 20,color: Colors.white),),
            Expanded(
              child: ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context,index){
                DocumentSnapshot flutterQuestions=snapshots.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color.fromARGB(255, 51, 51, 51),),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${flutterQuestions["question"]}",
                          style: TextStyle(fontSize: 16,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,),
                          Spacer(),
                          Row(
                            children: [
                              Text("answer: ${flutterQuestions["answer"]}",style: TextStyle(fontSize: 16,color: Colors.white),maxLines: 3,overflow: TextOverflow.ellipsis,),
                              Spacer(),
                              IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditQuiz(name: widget.name,id: flutterQuestions.id,question: flutterQuestions["question"], answer: flutterQuestions["answer"],option1: flutterQuestions["option1"] ,option2: flutterQuestions["option2"], option3: flutterQuestions["option3"], option4: flutterQuestions["option4"])));
                              }, icon: Icon(Icons.edit,color: Colors.lightGreenAccent,)),
                              IconButton(onPressed: ()async{
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    backgroundColor: const Color.fromARGB(255, 51, 51, 51),
                                    title: Text("Do you want to Delete the question ?",style: TextStyle(fontSize: 18,color: Colors.white),),
                                    actions: [
                                      TextButton(onPressed: ()async{
                                        if(widget.name=="Flutter"){
                                        await FlutterDatabase.deleteflutterDetails(flutterQuestions["id"]);
                                        }
                                        else if(widget.name=="Mern"){
                                          await MernDatabase.deleteMernDetails(flutterQuestions["id"]);
                                        }
                                        else if(widget.name=="Python"){
                                          await PythonDatabase.deletePythonDetails(flutterQuestions["id"]);
                                        }
                                        else if(widget.name=="Java"){
                                          await JavaDatabase.deleteJavaDetails(flutterQuestions["id"]);
                                        }
                                        else{
                                          await CDatabase.deleteCDetails(flutterQuestions["id"]);
                                        }
                                        Navigator.pop(context);
                                      }, child: Text("Yes",style: TextStyle(fontSize: 15,color: Colors.red),)),
                                      TextButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("No",style: TextStyle(fontSize: 15,color: Colors.white),))
                                    ],
                                  );
                                });
                              }, icon: Icon(Icons.delete,color: Colors.red,)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      );
    }
    );
  }
}