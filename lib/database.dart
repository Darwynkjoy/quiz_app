import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static Future addflutterDetails(
    Map<String,dynamic>flutterInfoMap,String id)async{
      return await FirebaseFirestore.instance
      .collection("flutter")
      .doc(id)
      .set(flutterInfoMap);
    }

  static Future<Stream<QuerySnapshot>> getflutterDetatils()async{
  return await FirebaseFirestore.instance.collection("flutter").snapshots();
  }

  static Future updateflutterDetails(
    String id,Map<String,dynamic> updateInfo)async{
      return await FirebaseFirestore.instance
      .collection("flutter")
      .doc(id)
      .update(updateInfo);
    }
  
  static Future deleteflutterDetails(String id)async{
    return await FirebaseFirestore.instance
    .collection("flutter")
    .doc(id)
    .delete();
  }
}