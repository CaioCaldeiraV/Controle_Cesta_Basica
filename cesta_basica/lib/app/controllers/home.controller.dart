import 'package:mobx/mobx.dart';
part 'home.controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  bool isExpandedClient = false;

  @observable
  bool isExpandedRequest = false;

  @observable
  bool isExpandedProduct = false;

  @observable
  bool isExpandedBasicBasket = false;

  @action
  void toggleExpandedClient() {
    isExpandedClient = !isExpandedClient;
    isExpandedBasicBasket = false;
    isExpandedProduct = false;
    isExpandedRequest = false;
  }

  @action
  void toggleExpandedRequest() {
    isExpandedRequest = !isExpandedRequest;
    isExpandedBasicBasket = false;
    isExpandedProduct = false;
    isExpandedClient = false;
  }

  @action
  void toggleExpandedBasicBasket() {
    isExpandedBasicBasket = !isExpandedBasicBasket;
    isExpandedProduct = false;
    isExpandedRequest = false;
    isExpandedClient = false;
  }

  @action
  void toggleExpandedProduct() {
    isExpandedProduct = !isExpandedProduct;
    isExpandedBasicBasket = false;
    isExpandedRequest = false;
    isExpandedClient = false;
  }
}
