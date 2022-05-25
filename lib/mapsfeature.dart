import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsFeature extends StatefulWidget {
  const MapsFeature({Key? key}) : super(key: key);

  @override
  State<MapsFeature> createState() => _MapsFeatureState();
}

class _MapsFeatureState extends State<MapsFeature> {
  static const mylocation =
      CameraPosition(target: LatLng(-6.200000, 106.816666), zoom: 11.5);

  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          initialCameraPosition: mylocation,
          onMapCreated: (controller) => _googleMapController = controller,
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
}
