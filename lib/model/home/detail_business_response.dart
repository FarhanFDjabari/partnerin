class DetailBusinessResponse {
  String? status;
  DetailBusinessResult? result;

  DetailBusinessResponse({this.status, this.result});

  DetailBusinessResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null
        ? new DetailBusinessResult.fromJson(json['result'])
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

class DetailBusinessResult {
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
  List<Media>? media;
  List<Requirements>? requirements;

  DetailBusinessResult(
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
      this.thumbnail,
      this.media,
      this.requirements});

  DetailBusinessResult.fromJson(Map<String, dynamic> json) {
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
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    if (json['media'] != null) {
      media = [];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    if (json['requirements'] != null) {
      requirements = [];
      json['requirements'].forEach((v) {
        requirements!.add(new Requirements.fromJson(v));
      });
    }
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
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.requirements != null) {
      data['requirements'] = this.requirements!.map((v) => v.toJson()).toList();
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

class Media {
  int? id;
  int? businessId;
  String? type;
  String? mediaUrl;
  String? createdAt;
  String? updatedAt;

  Media(
      {this.id,
      this.businessId,
      this.type,
      this.mediaUrl,
      this.createdAt,
      this.updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
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

class Requirements {
  int? id;
  int? businessId;
  String? title;
  String? acceptedType;
  String? createdAt;
  String? updatedAt;

  Requirements(
      {this.id,
      this.businessId,
      this.title,
      this.acceptedType,
      this.createdAt,
      this.updatedAt});

  Requirements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessId = json['business_id'];
    title = json['title'];
    acceptedType = json['accepted_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['business_id'] = this.businessId;
    data['title'] = this.title;
    data['accepted_type'] = this.acceptedType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
