import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/models/requestbasicbasket.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.repository.dart';
import 'package:mobx/mobx.dart';
part 'request.controller.g.dart';

class RequestController = _RequestController with _$RequestController;

abstract class _RequestController with Store {
  final BasicBasketRepository repositoryBasicBasket = BasicBasketRepository();

  @observable
  ObservableList<int> selected = ObservableList<int>();

  @observable
  double totalValue = 0;

  @observable
  ObservableList<BasicBasketModel> basicBaskets =
      ObservableList<BasicBasketModel>();

  @observable
  ObservableList<RequestBasicBasketModel> requestBasicBaskets =
      ObservableList<RequestBasicBasketModel>();

  @observable
  ObservableList<RequestBasicBasketModel> requestBasicBasketsAux;

  @observable
  bool showSearch = false;

  @action
  void toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  void toggleSelected(int id) {
    selected.clear();
    selected.add(id);
  }

  @action
  Future<void> getRequestBasicBasket() async {
    requestBasicBasketsAux = ObservableList<RequestBasicBasketModel>();
    requestBasicBasketsAux.addAll(requestBasicBaskets);
  }

  @action
  Future<void> search(String term) async {
    requestBasicBasketsAux = ObservableList<RequestBasicBasketModel>();
    var data = await repositoryBasicBasket.search(term);
    for (var i = 0; i < data.length; i++) {
      for (var j = 0; j < requestBasicBaskets.length; j++) {
        if (data[i].id == requestBasicBaskets[j].basicbasketsId) {
          requestBasicBasketsAux.add(requestBasicBaskets[j]);
        }
      }
    }
  }

  @action
  Future<void> incrementBasicBasketProduct(
      RequestBasicBasketModel model) async {
    model.amount++;
    if (model.amount == 1) {
      requestBasicBaskets.add(model);
    } else {
      requestBasicBaskets.remove(model);
      requestBasicBaskets.add(model);
    }
    sumAmountValue();
  }

  @action
  Future<void> decreaseBasicBasketProduct(RequestBasicBasketModel model) async {
    if (model.amount != 0) {
      model.amount--;
      if (model.amount == 0) {
        requestBasicBaskets.remove(model);
      } else {
        requestBasicBaskets.remove(model);
        requestBasicBaskets.add(model);
      }
    }
    sumAmountValue();
  }

  @action
  Future<void> sumAmountValue() async {
    totalValue = 0;
    for (var i = 0; i < requestBasicBaskets.length; i++) {
      totalValue += requestBasicBaskets[i].amount *
          await repositoryBasicBasket
              .getBasicBasketValue(requestBasicBaskets[i].basicbasketsId);
    }
  }

  int rewriteAmount(int id) {
    for (var i = 0; i < requestBasicBaskets.length; i++) {
      if (id == requestBasicBaskets[i].basicbasketsId) {
        return i;
      }
    }
    return -1;
  }
}
