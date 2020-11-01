import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //time in the location
  String flag;
  String url; //location url for API endpoint
  int weekNum;
  bool isDayTime; //true or false if daytime or NOT.
  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    // make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map map = jsonDecode(response.body);
    // print(map);
    String datetime = map['datetime'];
    String offset = map['utc_offset'].substring(1, 3);
    // print(datetime);
    //  String weekN  = map['week_number'];
    // print(offset);
    this.weekNum = map['week_number'];

    //DateTime

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDayTime = now.hour > 6 && now.hour < 15 ? true : false;

    //set the time, converting to String.
    time = DateFormat.jm().format(now);
    //   print(time);
  }
}
