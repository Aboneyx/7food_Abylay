class ProfileResponse {
  late ProfileModel data;

  ProfileResponse({required this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    this.data =
    (json["data"] == null ? null : ProfileModel.fromJson(json["data"]))!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class ProfileModel {
  late String name;
  late String phone;
  late String bonus;

  ProfileModel({required this.name, required this.phone, required this.bonus});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.phone = json["phone"];
    this.bonus = json["bonus"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["phone"] = this.phone;
    data["bonus"] = this.bonus;
    return data;
  }
}
