import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/services/card-service.dart';

class PaymentMethodProvider extends BaseBloc {
  final CardService cardService = CardService();
}