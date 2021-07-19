
class SocketResponse {
  late String sum;
  late List<Products> products;

  SocketResponse({required this.sum, required this.products});

  SocketResponse.fromJson(Map<String, dynamic> json) {
    this.sum = json["sum"];
    this.products = (json["products"]==null ? null : (json["products"] as List).map((e)=>Products.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["sum"] = this.sum;
    if(this.products != null)
      data["products"] = this.products.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Products {
  late String name;
  late int price;
  late int quantity;
  late String image;

  Products({required this.name, required this.price, required this.quantity, required this.image});

  Products.fromJson(Map<String, dynamic> json) {
    this.name = json["name"];
    this.price = json["price"];
    this.quantity = json["quantity"];
    this.image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["price"] = this.price;
    data["quantity"] = this.quantity;
    data["image"] = this.image;
    return data;
  }
}