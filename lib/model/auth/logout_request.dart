class LogoutRequest {
  String? token;
  String? accept;

  LogoutRequest({
    required this.token,
    required this.accept,
  });

  LogoutRequest.fromJson(Map<String, dynamic> json) {
    token = json['Authorization'];
    accept = json['Accept'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Authorization'] = this.token;
    data['Accept'] = this.accept;
    return data;
  }
}
