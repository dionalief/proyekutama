import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyekutama/direction_repository.dart';
import 'package:proyekutama/infoakun.dart';
import 'package:proyekutama/directions_model.dart';

class MapsFeature extends StatefulWidget {
  const MapsFeature({Key? key}) : super(key: key);

  @override
  State<MapsFeature> createState() => _MapsFeatureState();
}

class _MapsFeatureState extends State<MapsFeature> {
  static const mylocation =
      CameraPosition(target: LatLng(-6.200000, 106.816666), zoom: 11.5);

  late GoogleMapController _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;

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
            if (_origin != null)
              TextButton(
                onPressed: () => _googleMapController.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                  target: _origin!.position,
                  zoom: 14.5,
                  tilt: 50.0,
                ))),
                style: TextButton.styleFrom(
                    primary: Colors.green,
                    textStyle: const TextStyle(fontWeight: FontWeight.w600)),
                child: const Text("ORIGIN"),
              ),
            if (_destination != null)
              TextButton(
                  onPressed: () => _googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                        target: _destination!.position,
                        zoom: 14.5,
                        tilt: 50.0,
                      ))),
                  style: TextButton.styleFrom(
                      primary: Colors.red,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600)),
                  child: const Text("DESTINATION")),
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
                if (_origin != null) _origin!,
                if (_destination != null) _destination!,
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
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId("origin"),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        _destination = null;

        _info = null!;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId("destination"),
          infoWindow: const InfoWindow(title: 'Destiantion'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: pos,
        );
      });
    }
  }
}
