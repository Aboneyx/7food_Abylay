import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/model/history-model.dart';
import 'package:seven_food/data/services/history-service.dart';

class HistoryProvider extends BaseBloc {
  int currentIndex = 0;
  late HistoryResponse historyList;

  changeIndex(int i){
    currentIndex = i;
    notifyListeners();
  }

  late final _HistoryProvider repository;

  void initData() async {
    setLoading(true);
    HistoryService _provider = HistoryService();
    try{
      historyList =  await _provider.getHistories();
      notifyListeners();
    } catch(e) {
      print(e);
      print('from history provider');
    }
    setLoading(false);
  }
}
class _HistoryProvider {
  HistoryService _provider = HistoryService();
  Future<HistoryResponse> getHistories() => _provider.getHistories();
}