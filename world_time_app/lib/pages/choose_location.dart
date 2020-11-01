import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
      url: 'Europe/London',
      location: 'London',
      flag: 'uk.png',
    ),
    WorldTime(
      url: 'Australia/Adelaide',
      location: 'Adelaide',
      flag: 'australia.jpg',
    ),
    WorldTime(
      url: 'Europe/London',
      location: 'Glasgow',
      flag: 'uk.png',
    ),
    WorldTime(
      url: 'Europe/Paris',
      location: 'Frankfurt',
      flag: 'uk.png',
    ),
    WorldTime(
      url: 'Europe/London',
      location: 'Yorkshire',
      flag: 'uk.png',
    ),
    WorldTime(
      url: 'Europe/London',
      location: 'Surrey',
      flag: 'uk.png',
    ),
    WorldTime(
      url: 'America/Sao_Paulo',
      location: 'Sao Paulo',
      flag: 'brazil.png',
    ),

  ];

  void updateTime(index) async
  {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'weekNum': instance.weekNum,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  getData();
    print('Hey there!');
    // print('initState function ran');
  }

  @override
  Widget build(BuildContext context) {
    print('Build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          'assets/${locations[index].flag}'
                      ),
                    )
                ),
              ),
            );
          }
      ),
    );
  }
}
