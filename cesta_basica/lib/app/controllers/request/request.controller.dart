import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:cesta_basica/app/models/requestbasicbasket.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.repository.dart';
import 'package:cesta_basica/app/repositories/debts.repository.dart';
import 'package:cesta_basica/app/repositories/installments.repository.dart';
import 'package:cesta_basica/app/repositories/request.basicbasket.repository.dart';
import 'package:mobx/mobx.dart';
part 'request.controller.g.dart';

class RequestController = _RequestController with _$RequestController;

abstract class _RequestController with Store {
  final BasicBasketRepository repositoryBasicBasket = BasicBasketRepository();
  final repository = RequestBasicBasketRepository();
  List<BasicBasketModel> listBasicBasketName;

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
  Future<void> incrementRequestBasicBasket(
      RequestBasicBasketModel model) async {
    model.amount++;
    if (model.amount == 1) {
      requestBasicBaskets.add(model);
    } else {
      for (var i = 0; i < requestBasicBaskets.length; i++) {
        if (model.basicbasketsId == requestBasicBaskets[i].basicbasketsId) {
          requestBasicBaskets.removeAt(i);
          requestBasicBaskets.add(model);
        }
      }
    }
    sumAmountValue();
  }

  @action
  Future<void> decreaseRequestBasicBasket(RequestBasicBasketModel model) async {
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

  RequestBasicBasketModel rewriteAmount(int id) {
    for (var i = 0; i < requestBasicBaskets.length; i++) {
      if (id == requestBasicBaskets[i].basicbasketsId) {
        return requestBasicBaskets[i];
      }
    }
    return null;
  }

  Future<void> create(int id) async {
    for (var i = 0; i < requestBasicBaskets.length; i++) {
      requestBasicBaskets[i].requestId = id;
      await repository.create(requestBasicBaskets[i]);
    }
  }

  Future<void> update(int id) async {
    var aux;
    var data = await repository.searchIdinRequest(id);
    for (var i = 0; i < requestBasicBaskets.length; i++) {
      aux = 0;
      for (var j = 0; j < data.length; j++) {
        if (requestBasicBaskets[i].basicbasketsId == data[j].basicbasketsId) {
          data[j].amount = requestBasicBaskets[i].amount;
          repository.update(data[j]);
          aux = 1;
        }
      }
      if (aux == 0) {
        requestBasicBaskets[i].requestId = id;
        await repository.create(requestBasicBaskets[i]);
      }
    }
    for (var i = 0; i < data.length; i++) {
      aux = 0;
      for (var j = 0; j < requestBasicBaskets.length; j++) {
        if (data[i].basicbasketsId == requestBasicBaskets[j].basicbasketsId) {
          aux = 1;
        }
      }
      if (aux == 0) {
        await repository.delete(data[i].id);
      }
    }
  }

  Future<void> carregaAmount(int id) async {
    var data = await repository.searchIdinRequest(id);
    requestBasicBaskets.addAll(data);
    await sumAmountValue();
  }

  Future<List<RequestBasicBasketModel>> basicBasketsInRequest(
      int requestId) async {
    var list =
        await RequestBasicBasketRepository().searchIdinRequest(requestId);
    listBasicBasketName = <BasicBasketModel>[];
    for (var i = 0; i < list.length; i++) {
      listBasicBasketName.add(
          await BasicBasketRepository().getBasicBasket(list[i].basicbasketsId));
    }
    return list;
  }

  Future<List<InstallmentsModel>> installmentsForRequest(int requestId) async {
    var listDebts = await DebtsRepository().searchRequestId(requestId);
    if (listDebts.isNotEmpty) {
      var listInstallments =
          await InstallmentsRepository().searchDebtsId(listDebts[0].id);
      return listInstallments;
    }
    return null;
  }
}
