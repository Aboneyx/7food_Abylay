import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/model/showcase-product-model.dart';
import 'package:seven_food/data/services/showcase-service.dart';

class ShowcaseProvider extends BaseBloc {
  List<ProductModel> products = [];
  ShowCaseService showCaseService = ShowCaseService();

  getShowCaseProducts(int showCaseID) async {
    setLoading(true);
    var data = await showCaseService.getShowCaseProducts(showCaseID);
    for (Map<String, dynamic> i in data['data']) {
      products.add(ProductModel.fromJson(i));
    }
    setLoading(false);
  }
}
