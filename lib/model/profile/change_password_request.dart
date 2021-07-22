class ChangePasswordRequest {
  String? currentPassword;
  String? newPassword;

  ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    currentPassword = json['current_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_password'] = this.currentPassword;
    data['new_password'] = this.newPassword;
    return data;
  }
}
