import 'package:api_bloc_practice/domain/model/geo_model.dart';

class AddressModel {
  String street;
  String suite;
  String city;
  String zipcode;
  GeoModel geo;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  Map<String, dynamic> toJson() => {
    'street': street,
    'suite': suite,
    'city': city,
    'zipcode': zipcode,
    'geo': geo.toJson(),
  };

  factory AddressModel.fromJson(Map<String, dynamic> jsonAddressModel) {
    return AddressModel(
      street: jsonAddressModel['street'],
      suite: jsonAddressModel['suite'],
      city: jsonAddressModel['city'],
      zipcode: jsonAddressModel['zipcode'],
      geo: GeoModel.fromJson(jsonAddressModel['geo']),
    );
  }
}
