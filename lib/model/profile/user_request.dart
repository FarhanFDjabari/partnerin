class UserRequest {
  String? name;
  String? email;
  String? address;
  String? dateOfBirth;
  String? placeOfBirth;

  UserRequest({
    required this.name,
    required this.email,
    required this.address,
    required this.dateOfBirth,
    required this.placeOfBirth,
  });

  UserRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    placeOfBirth = json['place_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['date_of_birth'] = this.dateOfBirth;
    data['place_of_birth'] = this.placeOfBirth;
    return data;
  }
}
