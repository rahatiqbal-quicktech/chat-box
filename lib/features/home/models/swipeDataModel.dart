class SwipeDataListModel {
  bool? status;
  Message? message;
  UserData? userData;

  SwipeDataListModel({this.status, this.message, this.userData});

  SwipeDataListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
        json['message'] != null ? new Message.fromJson(json['message'])  : null;
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class Message {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  var nextPageUrl;
  String? path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  Message(
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

  Message.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
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

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  var emoji;
  String? dob;
  String? gender;
  var about;
  var industry;
  var jobTitle;
  var company;
  var living;
  String? ip;
  String? image1;
  var image2;
  var image3;
  var image4;
  var image5;
  var image6;
  var otp;
  var emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.emoji,
      this.dob,
      this.gender,
      this.about,
      this.industry,
      this.jobTitle,
      this.company,
      this.living,
      this.ip,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.image6,
      this.otp,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emoji = json['emoji'];
    dob = json['dob'];
    gender = json['gender'];
    about = json['about'];
    industry = json['industry'];
    jobTitle = json['job_title'];
    company = json['company'];
    living = json['living'];
    ip = json['ip'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
    image6 = json['image6'];
    otp = json['otp'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['emoji'] = this.emoji;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['about'] = this.about;
    data['industry'] = this.industry;
    data['job_title'] = this.jobTitle;
    data['company'] = this.company;
    data['living'] = this.living;
    data['ip'] = this.ip;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    data['image6'] = this.image6;
    data['otp'] = this.otp;
    data['email_verified_at'] = this.emailVerifiedAt;
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

class UserData {
  int? id;
  String? name;
  var email;
  String? phone;
  var emoji;
  String? dob;
  String? gender;
  var about;
  var industry;
  var jobTitle;
  var company;
  var living;
  String? ip;
  String? image1;
  var image2;
  var image3;
  var image4;
  var image5;
  var image6;
  var otp;
  var emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.emoji,
      this.dob,
      this.gender,
      this.about,
      this.industry,
      this.jobTitle,
      this.company,
      this.living,
      this.ip,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.image6,
      this.otp,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emoji = json['emoji'];
    dob = json['dob'];
    gender = json['gender'];
    about = json['about'];
    industry = json['industry'];
    jobTitle = json['job_title'];
    company = json['company'];
    living = json['living'];
    ip = json['ip'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
    image6 = json['image6'];
    otp = json['otp'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['emoji'] = this.emoji;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['about'] = this.about;
    data['industry'] = this.industry;
    data['job_title'] = this.jobTitle;
    data['company'] = this.company;
    data['living'] = this.living;
    data['ip'] = this.ip;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    data['image6'] = this.image6;
    data['otp'] = this.otp;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
