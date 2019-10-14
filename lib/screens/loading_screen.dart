import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Position position;

  void getCurrentPosition() async {
    print('Fetching user current position...');

    Position _position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    setState(() {
      position = _position;
    });

    print(position);
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text(position.toString()),
        ),
      ),
    );
  }
}
