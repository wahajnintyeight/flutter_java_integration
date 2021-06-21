import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_flutter/models/retailer.dart';
import 'package:flutter/services.dart';
import '../models/earrings.dart';
import '../models/customer.dart';

class DBFuture {
  Firestore _firestore = Firestore.instance;
  CollectionReference _earringsRef = Firestore.instance.collection('earrings');

  //SIGN UP RETAILER
  Future<String> createUser(Retailer user) async {
    String retVal = "error";

    try {
      await _firestore.collection("retailer").document(user.rID).setData({
        'fullName': user.fName.trim(),
        'email': user.email.trim(),
        'accountCreated': Timestamp.now(),
        'userName': user.Uname
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> createCustomer(Customer user) async {
    String retVal = "error";

    try {
      await _firestore.collection("customer").document(user.cID).setData({
        'fullName': user.fName.trim(),
        'phoneNum': user.phoneNum,
        'registeredOn': Timestamp.now(),
        'userName': user.uName
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<String> addEarrings(Earrings earrings) async {
    String retVal = "error";
    try {
      await _firestore.collection("earrings").document(earrings.eID).setData({
        'name': earrings.name.trim(),
        'price': earrings.price,
        'outOfStock': earrings.outOfStock,
        'createdOn': Timestamp.now(),
        'type': earrings.type,
        'thumbnail': earrings.thumbnail
      });

      retVal = "success";
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<List> returnEarrings() async {
    QuerySnapshot querySnapshot = await _earringsRef.getDocuments();

    // Get data from docs and convert map to List
    // List allData = querySnapshot.documents.map((doc) => doc.data).toList();
    List allData = querySnapshot.documents.map((doc) => doc.data).toList();
    // return allData;
    // print(allData[0]);
    return allData;
  }





  Future<List> returnEarringsID() async {
    QuerySnapshot querySnapshot = await _earringsRef.getDocuments();

    // Get data from docs and convert map to List
    List allData =
        querySnapshot.documents.map((doc) => doc.documentID).toList();
    return allData;
  }

  Future<Customer> getCustomerInfo(String cID) async {
    Customer retVal = Customer();
    try {
      DocumentSnapshot _docSnapshot =
          await _firestore.collection("customer").document(cID).get();
      retVal.cID = cID;
      retVal.fName = _docSnapshot.data["fullName"];
      retVal.uName = _docSnapshot.data["userName"];
      retVal.phoneNum = _docSnapshot.data["phoneNum"];
      retVal.accCreated = _docSnapshot.data["accountCreated"];
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
