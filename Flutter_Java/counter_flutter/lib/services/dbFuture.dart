import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_flutter/models/retailer.dart';
import 'package:flutter/services.dart';


class DBFuture {
  Firestore _firestore = Firestore.instance;

  Future<String> createUser(Retailer user) async
  {
    String retVal = "error";

    try {
      await _firestore.collection("retailer").document(user.rID).setData({
        'fullName': user.fName.trim(),
        'email': user.email.trim(),
        'accountCreated': Timestamp.now(),
        'userName' : user.Uname
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<Retailer> getRetailInfo(String rID) async {
    Retailer retVal = Retailer();
    try {
      DocumentSnapshot _docSnapshot =
      await _firestore.collection("retailer").document(rID).get();
      retVal.rID = rID;
      retVal.fName = _docSnapshot.data["fullName"];
      retVal.email = _docSnapshot.data["email"];
      retVal.accCreated = _docSnapshot.data["accountCreated"];
    } catch (e) {
      print(e);
    }
    return retVal;
  }

}