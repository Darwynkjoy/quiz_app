import 'package:cloud_firestore/cloud_firestore.dart';

class FlutterDatabase {
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
class MernDatabase {
  static Future addMernDetails(
    Map<String,dynamic>mernInfoMap,String id)async{
      return await FirebaseFirestore.instance
      .collection("flutter")
      .doc(id)
      .set(mernInfoMap);
    }

  static Future<Stream<QuerySnapshot>> getMernDetatils()async{
  return await FirebaseFirestore.instance.collection("mern").snapshots();
  }

  static Future updateMernDetails(
    String id,Map<String,dynamic> updateMernInfo)async{
      return await FirebaseFirestore.instance
      .collection("mern")
      .doc(id)
      .update(updateMernInfo);
    }
  
  static Future deleteMernDetails(String id)async{
    return await FirebaseFirestore.instance
    .collection("mern")
    .doc(id)
    .delete();
  }
}