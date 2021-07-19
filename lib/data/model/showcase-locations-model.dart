class ShowcasesResponse {
  late List<LocationModel> data;

  ShowcasesResponse({required this.data});

  ShowcasesResponse.fromJson(Map<String, dynamic> json) {
    this.data = json["data"] == null
    ? []
    : (json["data"] as List).map((e) => LocationModel.fromJson(e)).toList();
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null)
      data["data"] = this.data.map((e) => e.toJson()).toList();
    return data;
  }
}

class LocationModel {
  late int id;
  late String name;
  late String address;
  late String latitude;
  late String longitude;

  LocationModel(
      {required this.id, required this.name, required this.address, required this.latitude, required this.longitude});

  LocationModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.address = json["address"];
    this.latitude = json["latitude"];
    this.longitude = json["longitude"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["address"] = this.address;
    data["latitude"] = this.latitude;
    data["longitude"] = this.longitude;
    return data;
  }
}
