
class AddCardResponse {
  late String redirectUrl;
  late String requestUrl;

  AddCardResponse({required this.redirectUrl, required this.requestUrl});

  AddCardResponse.fromJson(Map<String, dynamic> json) {
    this.redirectUrl = json["redirect_url"];
    this.requestUrl = json["request_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["redirect_url"] = this.redirectUrl;
    data["request_url"] = this.requestUrl;
    return data;
  }
}