import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    Color c = Colors.white10;
    Color bg = Colors.white10;
    if (data['isDayTime']) {
      c = Colors.black;
      bg = Colors.lightBlue[100];
    } else if (data['isDayTime'] == false) {
      c = Colors.white;
      bg = Colors.blue[900];
    }
    //: Colors.white;

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
        backgroundColor: bg,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                        'weekNum' : result['weekNum']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location, color: c),
                  label: Text('Edit Location', style: TextStyle(color: c)),
                ),
                SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                          style: TextStyle(
                              fontSize: 20, letterSpacing: 1.5, color: c))
                    ]),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 35, color: c),
                ),
                Column(
                  children: <Widget>[
                    Text('Week Number - ${data['weekNum']}',
                        style: TextStyle(fontSize: 30, color: c))
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
