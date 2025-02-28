import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/add_quiz.dart';
import 'package:quiz_app/database.dart';
class QuestionsPage extends StatefulWidget {
  final String name;
  const QuestionsPage({super.key,required this.name});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  Stream<QuerySnapshot>? FlutterStream;

  getontheload()async{
    FlutterStream=await Database.getflutterDetatils();
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
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: AllflutterDetails(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddQuiz()));
        },
        child: Icon(Icons.add,color: Colors.black,size: 35,),),
    );
  }
  Widget AllflutterDetails(){
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
            Text("10 questions",style: TextStyle(fontSize: 20,color: Colors.white),),
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
                          Text("answer: ${flutterQuestions["answer"]}",style: TextStyle(fontSize: 16,color: Colors.white),maxLines: 3,overflow: TextOverflow.ellipsis,),
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