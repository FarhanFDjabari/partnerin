class BusinessResponse {
  String? status;
  BusinessResult? result;

  BusinessResponse({this.status, this.result});

  BusinessResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null
        ? new BusinessResult.fromJson(json['result'])
        : null;
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

class BusinessResult {
  int? currentPage;
  List<BusinessData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  BusinessResult(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  BusinessResult.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new BusinessData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class BusinessData {
  int? id;
  int? ownerId;
  String? type;
  String? category;
  String? title;
  String? description;
  String? stpwUrl;
  String? prospektusUrl;
  int? price;
  int? isPromote;
  String? createdAt;
  String? updatedAt;
  Thumbnail? thumbnail;

  BusinessData(
      {this.id,
      this.ownerId,
      this.type,
      this.category,
      this.title,
      this.description,
      this.stpwUrl,
      this.prospektusUrl,
      this.price,
      this.isPromote,
      this.createdAt,
      this.updatedAt,
      this.thumbnail});

  BusinessData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    type = json['type'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    stpwUrl = json['stpw_url'];
    prospektusUrl = json['prospektus_url'];
    price = json['price'];
    isPromote = json['is_promote'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    thumbnail = (json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_id'] = this.ownerId;
    data['type'] = this.type;
    data['category'] = this.category;
    data['title'] = this.title;
    data['description'] = this.description;
    data['stpw_url'] = this.stpwUrl;
    data['prospektus_url'] = this.prospektusUrl;
    data['price'] = this.price;
    data['is_promote'] = this.isPromote;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  int? id;
  int? businessId;
  String? type;
  String? mediaUrl;
  String? createdAt;
  String? updatedAt;

  Thumbnail(
      {this.id,
      this.businessId,
      this.type,
      this.mediaUrl,
      this.createdAt,
      this.updatedAt});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    type = json['type'];
    mediaUrl = json['media_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['type'] = this.type;
    data['media_url'] = this.mediaUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
