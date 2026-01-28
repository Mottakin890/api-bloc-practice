class CompanyModel {
  String name;
  String catchPhrase;
  String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'catchPhrase': catchPhrase,
    'bs': bs,
  };

  factory CompanyModel.fromJson(Map<String, dynamic> jsonCompanyModel) {
    return CompanyModel(
      name: jsonCompanyModel["name"],
      catchPhrase: jsonCompanyModel['catchPhrase'],
      bs: jsonCompanyModel['bs'],
    );
  }
}
