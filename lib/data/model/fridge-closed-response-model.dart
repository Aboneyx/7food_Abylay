
class FridgeClosedResponse {
  late String status;
  late String title;
  late String content;
  late String sum;

  FridgeClosedResponse({required this.status, required this.title, required this.content, required this.sum});

  FridgeClosedResponse.fromJson(Map<String, dynamic> json) {
    this.status = json["status"];
    this.title = json["title"];
    this.content = json["content"];
    this.sum = json["sum"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status"] = this.status;
    data["title"] = this.title;
    data["content"] = this.content;
    data["sum"] = this.sum;
    return data;
  }
}