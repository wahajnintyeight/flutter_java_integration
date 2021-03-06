import 'dart:ui';

import 'package:counter_flutter/Screens/Home/home.dart';
import 'package:counter_flutter/Screens/Home/home.dart';
import 'package:counter_flutter/Screens/Welcome/Customer/Welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:counter_flutter/Screens/Welcome/Designer/Welcome/dzwelcome.dart';
import 'package:counter_flutter/Screens/Welcome/Retailer/Welcome/retailwelcome.dart';
import 'package:counter_flutter/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:counter_flutter/Screens/Welcome/Customer/Welcome/welcome.dart';

import 'home.dart';
import 'home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageCus(),
    ));
final String Jewelrytype = "";
final int jID = 0;

class MainPageCus extends StatefulWidget {
  final JewelryType jT;

// final int jID;
//   MainPageCus(this.jT);

  const MainPageCus({Key key, this.jT}) : super(key: key);

  @override
  _MainPageCusState createState() => _MainPageCusState();
}

class _MainPageCusState extends State<MainPageCus> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<JewelryType> JT;

  @override
  void initState() {
    // TODO: implement initState
    // JT.add(widget.jT);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: size.height * 0.05),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Shop 'N' Preview",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                SizedBox(height: size.height * 0.05),
                Text(widget.jT.jewelryType),
                SizedBox(height: size.height * 0.05),
                Text(widget.jT.jID.toString())
              ],
            )));
  }
}
