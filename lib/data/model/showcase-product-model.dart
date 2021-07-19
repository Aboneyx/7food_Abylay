import 'dart:convert';

List<ProductModel> modelUserFromJson(String str) => List<ProductModel>.from(
  json.decode(str).map(
        (x) => ProductModel.fromJson(x),
  ),
);
String modelUserToJson(List<ProductModel> data) => json.encode(
  List<dynamic>.from(
    data.map(
          (x) => x.toJson(),
    ),
  ),
);

class ProductModel {
  String name;
  String price;
  String quantity;
  String image;

  ProductModel({required this.name, required this.price, required this.quantity, required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json["name"],
    price: json["price"],
    quantity: json["quantity"],
    image: json["image"],
  );
  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "quantity": quantity,
    "image": image,
  };
}
