import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyekutama/direction_repository.dart';
import 'package:proyekutama/homepage.dart';
import 'package:proyekutama/infoakun.dart';
import 'package:proyekutama/directions_model.dart';
import 'package:proyekutama/mapgeo.dart';

class MapsFeature extends StatefulWidget {
  const MapsFeature({Key? key}) : super(key: key);

  @override
  State<MapsFeature> createState() => _MapsFeatureState();
}

class _MapsFeatureState extends State<MapsFeature> {
  static const mylocation =
      CameraPosition(target: LatLng(-6.200000, 106.816666), zoom: 11.5);

  late GoogleMapController _googleMapController;
  Marker? _location;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Google Maps"),
          actions: [
            if (_location != null)
              TextButton(
                onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                  target: _location!.position,
                  zoom: 14.5,
                  tilt: 50.0,
                ))),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontWeight: FontWeight.w600)),
                child: const Text("LOCATION"),
              ),
            if (_location != null)
              TextButton(
                onPressed: () {
                  CupertinoAlertDialog alert = CupertinoAlertDialog(
                    title: Text(
                      'SUCCESS',
                      textAlign: TextAlign.center,
                    ),
                    content: Text(
                      'Lokasi anda sudah ditetapkan',
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('OK'),
                        onPressed: () {
                          var place = GeoPoint(_location!.position.latitude,
                              _location!.position.latitude);
                          createdata(MapGeo(markedlocation: place));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                      )
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      });
                },
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    textStyle: const TextStyle(fontWeight: FontWeight.w600)),
                child: const Text("TETAPKAN"),
              ),
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: mylocation,
              onMapCreated: (controller) => _googleMapController = controller,
              markers: {
                if (_location != null) _location!,
              },
              onLongPress: _addMarker,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () => _googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(mylocation)),
          child: const Icon(
            Icons.center_focus_strong,
          ),
        ));
  }

  void _addMarker(LatLng pos) async {
    if (_location == null || (_location != null)) {
      setState(() {
        _location = Marker(
          markerId: const MarkerId("location"),
          infoWindow: const InfoWindow(title: 'Location'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
      });
    }
  }
}

Future createdata(MapGeo data) async {
  final docData = FirebaseFirestore.instance.collection("location").doc();
  final json = data.toJson();
  docData.set(json);
}
