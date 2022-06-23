import 'package:cloud_firestore/cloud_firestore.dart';

class MapGeo {
  GeoPoint markedlocation;

  MapGeo({
    required this.markedlocation,
  });

  Map<String, dynamic> toJson() => {
        "markedlocation": markedlocation,
      };

  static MapGeo fromJson(Map<dynamic, dynamic> json) => MapGeo(
        markedlocation: json['markedlocation'],
      );
}
