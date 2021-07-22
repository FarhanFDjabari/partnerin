class BusinessRequest {
  String? limit;
  String? title;
  String? type;
  String? category;

  BusinessRequest({
    this.limit,
    this.title,
    this.type,
    this.category,
  });

  BusinessRequest.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    title = json['title'];
    type = json['type'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['limit'] = this.limit;
    data['title'] = this.title;
    data['type'] = this.type;
    data['category'] = this.category;
    return data;
  }
}
