import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(34.4133, -119.8610);
  double _currentSliderValue = 600;    // feet

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select Range'),
          backgroundColor: Colors.green[700],
        ),
        body: Column(
          children: [
            Container(
              height: 512,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 13.0,
                ),
              ),
            ),
            Container(
              height: 128,
              child: Column(
                children: [
                  Slider(
                    value: _currentSliderValue,
                    min: 50,
                    max: 1000,
                    divisions: 5,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      // TODO
                    },
                    child: Text("Start"),
                  )
                ],
              )
            )
          ],
        )
      ),
    );
  }
}