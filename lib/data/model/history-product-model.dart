import 'dart:convert';

List<HistoryProductDetailsModel> modelUserFromJson(String str) =>
    List<HistoryProductDetailsModel>.from(
      json.decode(str).map(
            (x) => HistoryProductDetailsModel.fromJson(x),
      ),
    );
String modelUserToJson(List<HistoryProductDetailsModel> data) => json.encode(
  List<dynamic>.from(
    data.map(
          (x) => x.toJson(),
    ),
  ),
);

class HistoryProductDetailsModel {
  String name;
  String price;
  String quantity;
  String image;
  String sum;

  HistoryProductDetailsModel(
      {required this.name, required this.price, required this.quantity, required this.image, required this.sum});

  factory HistoryProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      HistoryProductDetailsModel(
          name: json["name"],
          price: json["price"],
          quantity: json["quantity"],
          image: json["image"],
          sum: json["sum"]);
  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "quantity": quantity,
    "image": image,
    "sum": sum,
  };
}
