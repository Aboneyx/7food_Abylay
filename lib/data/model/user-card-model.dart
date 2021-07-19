class CardResponse {
  late List<UserCardModel> data;

  CardResponse({required this.data});

  CardResponse.fromJson(Map<String, dynamic> json) {
    this.data = json["data"] == null
    ? []
    : (json["data"] as List).map((e) => UserCardModel.fromJson(e)).toList();
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null)
      data["data"] = this.data.map((e) => e.toJson()).toList();
    return data;
  }
}

class UserCardModel {
  late int id;
  late String maskedPan;
  late String type;

  UserCardModel({required this.id, required this.maskedPan, required this.type});

  UserCardModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.maskedPan = json["masked_pan"];
    this.type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["masked_pan"] = this.maskedPan;
    data["type"] = this.type;
    return data;
  }
}
