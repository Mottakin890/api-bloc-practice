import 'package:api_bloc_practice/domain/model/address_model.dart';
import 'package:api_bloc_practice/domain/model/company_model.dart';

class UserModel {
  int id;
  String name;
  String username;
  String email;
  AddressModel address;
  String phone;
  String website;
  CompanyModel company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'address': address.toJson(),
    'phone': phone,
    'website': website,
    'company': company.toJson(),
  };

  factory UserModel.fromJson(Map<String, dynamic> jsonUserModel) {
    return UserModel(
      id: jsonUserModel['id'],
      name: jsonUserModel['name'],
      username: jsonUserModel['username'],
      email: jsonUserModel['email'],
      address: AddressModel.fromJson(jsonUserModel['address']),
      phone: jsonUserModel['phone'],
      website: jsonUserModel['website'],
      company: CompanyModel.fromJson(jsonUserModel['company']),
    );
  }
}
