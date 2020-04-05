import 'package:flutter/material.dart';
import 'package:world_time2/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

//    String time = 'loading...';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

//    setState(() {
//      time = instance.time;
//    });
  }

//  int counter = 0;
    @override
  void initState() {
    super.initState();
    setupWorldTime();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 86.0,
        ),
      ),
    );
  }
}
