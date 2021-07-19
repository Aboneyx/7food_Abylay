import 'package:seven_food/base/bloc.dart';

class ConfirmProvider extends BaseBloc {
  late String verificationCode;
  void onCompleted(val){
    print("done $val");
    verificationCode = val;
    print('verification code from provider' + verificationCode);
    notifyListeners();
  }
}