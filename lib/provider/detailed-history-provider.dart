import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/model/history-product-model.dart';
import 'package:seven_food/data/services/history-service.dart';

class DetailHistoryProvider extends BaseBloc {
  HistoryService historyService = HistoryService();
  List<HistoryProductDetailsModel> details = [];
  late int id;
  late String date;
  late String time;
  late String address;
  late String total;

  getHistoryProducts(int historyID) async {
    setLoading(true);
    var data = await historyService.getHistoryProducts(historyID);
    id = data['data']['id'];
    date = data['data']['date'];
    time = data['data']['time'];
    address = data['data']['address'];
    total = data['data']['total'];
    for (Map<String, dynamic> i in data['data']['details']) {
      details.add(HistoryProductDetailsModel.fromJson(i));
    }
    setLoading(false);
    notifyListeners();
  }
  void initData() async {

}
}