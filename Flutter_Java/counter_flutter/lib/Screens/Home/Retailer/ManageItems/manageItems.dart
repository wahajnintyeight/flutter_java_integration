import 'dart:ui';

import 'package:counter_flutter/Screens/Welcome/Customer/Register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:counter_flutter/Screens/Welcome/Customer/Login/login.dart';
import 'package:counter_flutter/Screens/Welcome/Designer/Login/dzlogin.dart';
import 'package:counter_flutter/Screens/Welcome/Designer/Register/dzregister.dart';
import 'package:counter_flutter/Screens/Welcome/Retailer/Login/retaillogin.dart';
import 'package:counter_flutter/Screens/Welcome/Retailer/Register/retailregister.dart';
import 'package:counter_flutter/Screens/Welcome/welcome.dart';
import '../home.dart';
import 'addItem.dart';
void main() => runApp(chooseWidget('splashRoute'));

Widget chooseWidget(String route) {
  switch (route) {
  // name of the route defined in the host app
    case 'splashRoute':
      return ManageItems();

    default:
      return Center(
        child: Text(
          'Unknown',
          textDirection: TextDirection.ltr,
        ),
      );
  }
}

// ignore: camel_case_types
class ManageItems extends StatefulWidget {
  @override
  _ManageItemsState createState() => _ManageItemsState();
}

// ignore: camel_case_types
class _ManageItemsState extends State<ManageItems> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                      "Shop Retailer",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome, Retailer!',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: size.height * 0.10),
                // SizedBox(height: size.height * 0.05),
                Container(
                    height: 90,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Add new Item'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return AddItem();
                          }),

                          // print(nameController.text);
                          // print(passwordController.
                          // text
                        );
                        //    print(nameController.text);
                        //  print(passwordController.text);
                      },
                    )),
                SizedBox(height: size.height * 0.05),
                Container(
                    height: 90,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Delete an Item'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return retailRegister();
                          }),
                          // print(nameController.text);
                          // print(passwordController.
                          // text
                        );
                        //print(nameController.text);
                        //print(passwordController.text);
                      },
                    )),
                SizedBox(height: size.height * 0.05),

                Container(
                    height: 90,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.blue, width: 4),
                      ),
                      color: Colors.white,
                      child: Text(
                        'Back',
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return RetailHome(); //Main Welcome Page
                          }),
                          // print(nameController.text);
                          // print(passwordController.text);
                        );
                      },
                    )),
              ],
            )));
  }
}
