import 'package:flutter/material.dart';
import 'package:quiz_app/questions_page.dart';
class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {

  List <String> quizItems=["Flutter","Mern","Python","Java","C++"];
  List <String> imageItems=[
    "assets/images/flutter.png",
    "assets/images/mern.png",
    "assets/images/python.png",
    "assets/images/java.png",
    "assets/images/c++.png"
  ];
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle, 
                image: DecorationImage(image: AssetImage("assets/images/pic.jpg"),fit: BoxFit.contain),border: Border.all(width: 2,color: Colors.black)
                ),
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Lets Quiz",style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: .8,
                  ),
                  itemCount: quizItems.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionsPage(name: quizItems[index]))),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 51, 51, 51),
                          borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(image: AssetImage(imageItems[index]),fit:BoxFit.contain)
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text("${quizItems[index]}",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                              Spacer()
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}