class LoginResponse {
  String? status;
  LoginResult? result;

  LoginResponse({
    required this.status,
    required this.result,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
        json['result'] != null ? LoginResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class LoginResult {
  User? user;
  String? token;

  LoginResult({
    required this.user,
    required this.token,
  });

  LoginResult.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? ktpUrl;
  String? address;
  String? dateOfBirth;
  String? placeOfBirth;
  String? profilePhotoUrl;
  int? role;
  String? createdAt;
  String? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.ktpUrl,
    required this.address,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.profilePhotoUrl,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    ktpUrl = json['ktp_url'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    placeOfBirth = json['place_of_birth'];
    profilePhotoUrl = json['profile_photo_url'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['ktp_url'] = this.ktpUrl;
    data['address'] = this.address;
    data['date_of_birth'] = this.dateOfBirth;
    data['place_of_birth'] = this.placeOfBirth;
    data['profile_photo_url'] = this.profilePhotoUrl;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
