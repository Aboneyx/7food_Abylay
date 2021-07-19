import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/model/showcase-locations-model.dart';
import 'package:seven_food/data/services/showcase-service.dart';

class HomeProvider extends BaseBloc{
  int currentIndex = 0;
  late List<LocationModel> locationsList;

  changeIndex(int i){
    currentIndex = i;
    notifyListeners();
  }
  late final _HomeProvider repository;
  void initData() async {
    setLoading(true);
    ShowCaseService _provider = ShowCaseService();
    try{
      locationsList =  await _provider.getShowCases();
      notifyListeners();
    } catch(e) {
      print(e);
      print('from home provider');
    }
    setLoading(false);
  }
}

class _HomeProvider {
  ShowCaseService _provider = ShowCaseService();
  Future<List<LocationModel>> getLocations() => _provider.getShowCases();
}
