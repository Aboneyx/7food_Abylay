import 'package:seven_food/base/bloc.dart';

enum Cards { FixedCard, Card1, Card2}

class MyCardProvider extends BaseBloc {

  Cards isEnabled = Cards.FixedCard;

  void changeRadio(Cards value) {
    isEnabled = value;
    notifyListeners();
  }
}