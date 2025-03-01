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

//mern databse
class MernDatabase {
  static Future addMernDetails(
    Map<String,dynamic>mernInfoMap,String id)async{
      return await FirebaseFirestore.instance
      .collection("mern")
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

//python database
class PythonDatabase {
  static Future addPythonDetails(
    Map<String,dynamic>pythonInfoMap,String id)async{
      return await FirebaseFirestore.instance
      .collection("python")
      .doc(id)
      .set(pythonInfoMap);
    }

  static Future<Stream<QuerySnapshot>> getPythonDetatils()async{
  return await FirebaseFirestore.instance.collection("python").snapshots();
  }

  static Future updatePythonDetails(
    String id,Map<String,dynamic> updatePythonInfo)async{
      return await FirebaseFirestore.instance
      .collection("python")
      .doc(id)
      .update(updatePythonInfo);
    }
  
  static Future deletePythonDetails(String id)async{
    return await FirebaseFirestore.instance
    .collection("python")
    .doc(id)
    .delete();
  }
}


//java database
class JavaDatabase {
  static Future addJavaDetails(
    Map<String,dynamic>javaInfoMap,String id)async{
      return await FirebaseFirestore.instance
      .collection("java")
      .doc(id)
      .set(javaInfoMap);
    }

  static Future<Stream<QuerySnapshot>> getJavaDetatils()async{
  return await FirebaseFirestore.instance.collection("java").snapshots();
  }

  static Future updateJavaDetails(
    String id,Map<String,dynamic> updateJavaInfo)async{
      return await FirebaseFirestore.instance
      .collection("java")
      .doc(id)
      .update(updateJavaInfo);
    }
  
  static Future deleteJavaDetails(String id)async{
    return await FirebaseFirestore.instance
    .collection("java")
    .doc(id)
    .delete();
  }
}


//c++ database
class CDatabase {
  static Future addCDetails(
    Map<String,dynamic>cInfoMap,String id)async{
      return await FirebaseFirestore.instance
      .collection("c++")
      .doc(id)
      .set(cInfoMap);
    }

  static Future<Stream<QuerySnapshot>> getCDetatils()async{
  return await FirebaseFirestore.instance.collection("c++").snapshots();
  }

  static Future updateCDetails(
    String id,Map<String,dynamic> updateCInfo)async{
      return await FirebaseFirestore.instance
      .collection("c++")
      .doc(id)
      .update(updateCInfo);
    }
  
  static Future deleteCDetails(String id)async{
    return await FirebaseFirestore.instance
    .collection("c++")
    .doc(id)
    .delete();
  }
}