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
import 'package:line_icons/line_icons.dart';
import 'package:counter_flutter/Screens/Home/constant/data_json.dart';
import 'home.dart';
import 'package:counter_flutter/Screens/Home/theme/colors.dart';
import 'home.dart';
import 'package:counter_flutter/Screens/Home/productdetail.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageCus(),
    ));
final String Jewelrytype = "";
final int jID = 0;

class MainPageCus extends StatefulWidget {
  final JewelryType jT;

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
    int activeMenu = 0;
    return Scaffold(
        // body: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: ListView(
        //       children: <Widget>[
        //         SizedBox(height: size.height * 0.05),
        //         Container(
        //             alignment: Alignment.center,
        //             padding: EdgeInsets.all(10),
        //             child: Text(
        //               "Shop 'N' Preview",
        //               style: TextStyle(
        //                   color: Colors.blue,
        //                   fontWeight: FontWeight.w500,
        //                   fontSize: 30),
        //             )),
        //         SizedBox(height: size.height * 0.05),
        //         Text(widget.jT.jewelryType),
        //         SizedBox(height: size.height * 0.05),
        //         Text(widget.jT.jID.toString())
        //       ],
        //     )));
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Online Shopping",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Row(
                  children: <Widget>[
                    Icon(LineIcons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(LineIcons.shoppingCart)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                  children: List.generate(menuItems.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        activeMenu = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: activeMenu == index
                                      ? primary
                                      : Colors.transparent,
                                  width: 2))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          menuItems[index],
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Wrap(
            children: List.generate(dataItems.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductDetailPage(
                                id: dataItems[index]['id'].toString(),
                                name: dataItems[index]['name'],
                                code: dataItems[index]['code'],
                                img: dataItems[index]['img'],
                                price: dataItems[index]['price'].toString(),
                                promotionPrice: dataItems[index]
                                        ['promotionPrice']
                                    .toString(),
                                size: dataItems[index]['size'],
                                color: dataItems[index]['color'],
                              )));
                },
                child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: dataItems[index]['id'].toString(),
                          child: Container(
                            width: (size.width - 16) / 2,
                            height: (size.width - 16) / 2,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(dataItems[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            dataItems[index]['code'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            dataItems[index]['price'].toString() + " USD",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
              );
            }),
          )
        ],
      ),
    ));
  }
}
