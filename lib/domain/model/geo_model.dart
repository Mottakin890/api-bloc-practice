class GeoModel {
  String lat;
  String lng;

  GeoModel({required this.lat, required this.lng});

  Map<String, dynamic> toJson() => {
    'latitude': lat,
    'longtitude': lng,
  };

  factory GeoModel.fromJson(Map<String, dynamic> jsonGeoModel) {
    return GeoModel(
      lat: jsonGeoModel["lat"],
      lng: jsonGeoModel['lng'],
    );
  }
}
