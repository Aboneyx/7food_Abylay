import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/model/profile-model.dart';
import 'package:seven_food/data/model/user-card-model.dart';
import 'package:seven_food/data/services/card-service.dart';
import 'package:seven_food/data/services/profile-service.dart';

class ProfileProvider extends BaseBloc {
  late ProfileModel profileInfo;
  List<UserCardModel> cards = [];

  getProfileInfo() async {

    try{
      setLoading(true);
      profileInfo = await ProfileService().getProfileInfo();
      cards = await CardService().getUserCard();
      setLoading(false);
      print(cards);
      print(profileInfo);
      notifyListeners();
    } catch(e){
      print('exception from profile provider: ');
      print(e);
    }
  }

  initData() async {
    getProfileInfo();
    print('from init data prof provider');
    print(cards);
    print(profileInfo);
    notifyListeners();
  }

}