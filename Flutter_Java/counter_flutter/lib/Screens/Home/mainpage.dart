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
import 'home.dart';
import '../../services/dbFuture.dart';
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
    String jName = widget.jT.jewelryType;
    String ID = widget.jT.jID.toString();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return CusHome();
              // })),
          Navigator.pop(context)
        ),
        title: Text("Shop 'N' Preview"),
        centerTitle: true,
      ),

        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Viewing $jName with ID: $ID",
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

            ),
          ),
          SizedBox(
            height: 30,
          ),
          Wrap(
            children: FutureBuilder(
                // dataItems.length, (index)
            future: DBFuture().returnEarrings(),
                builder: (context, AsyncSnapshot snapshot)
            {
              if(!snapshot.hasData)
                {
                  return Container(width:0.0,height:0.0);
                }
              else if(snapshot[index]["Type"]==jName)
              {
                return InkWell(
                  onTap: ()
                  {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (_) =>
                    //             ProductDetailPage(
                    //               id: dataItems[index]['id'].toString(),
                    //               name: dataItems[index]['name'],
                    //               code: dataItems[index]['code'],
                    //               img: dataItems[index]['img'],
                    //               price: dataItems[index]['price'].toString(),
                    //               promotionPrice: dataItems[index]
                    //               ['promotionPrice']
                    //                   .toString(),
                    //               size: dataItems[index]['size'],
                    //               color: dataItems[index]['color'],
                    //             )));
                  },
                  child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Hero(
                          //   tag: dataItems[index]['id'].toString(),
                          //   child: Container(
                          //     width: (size.width - 16) / 2,
                          //     height: (size.width - 16) / 2,
                          //     decoration: BoxDecoration(
                          //         image: DecorationImage(
                          //             image:
                          //             AssetImage(dataItems[index]['img']),
                          //             fit: BoxFit.cover)),
                          //   ),
                          // )
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 15),
                          //   child: Text(
                          //     dataItems[index]['code'],
                          //     style: TextStyle(fontSize: 16),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 15),
                          //   child: Text(
                          //     dataItems[index]['price'].toString() + " USD",
                          //     style: TextStyle(fontSize: 16),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      )),
                );
              }
            }
            ),
          )
        ],
      ),
    ));
  }
}
