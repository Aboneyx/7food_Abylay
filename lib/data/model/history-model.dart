
class HistoryResponse {
  late List<Data> data;

  HistoryResponse({required this.data});

  HistoryResponse.fromJson(Map<String, dynamic> json) {
    this.data = json["data"]==null?[]:(json["data"] as List).map((e)=>Data.fromJson(e)).toList();
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.data != null)
      data["data"] = this.data.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Data {
  late int id;
  late String address;
  late String price;
  late String createdAt;
  late List<Details> details;

  Data({required this.id, required this.address, required this.price, required this.createdAt, required this.details});

  Data.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.address = json["address"];
    this.price = json["price"];
    this.createdAt = json["created_at"];
    this.details = json["details"]==null?[]:(json["details"] as List).map((e)=>Details.fromJson(e)).toList();
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["address"] = this.address;
    data["price"] = this.price;
    data["created_at"] = this.createdAt;
    if(this.details != null)
      data["details"] = this.details.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Details {
  late String name;
  late int quantity;

  Details({required this.name, required this.quantity});

  Details.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["quantity"] = this.quantity;
    return data;
  }
}