import 'package:cesta_basica/app/models/basicbasketproduct.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.product.repository.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';
import 'package:mobx/mobx.dart';
part 'basicbasketproduct.controller.g.dart';

class BasicBasketProductController = _BasicBasketProductController
    with _$BasicBasketProductController;

abstract class _BasicBasketProductController with Store {
  final BasicBasketProductRepository repository =
      BasicBasketProductRepository();
  final ProductRepository repositoryProduct = ProductRepository();

  @observable
  ObservableList<BasicBasketProductModel> basicBasketsProducts =
      ObservableList<BasicBasketProductModel>();

  @observable
  ObservableList<BasicBasketProductModel> basicBasketsProductsAux;

  @observable
  double totalCust = 0;

  @observable
  bool showSearch = false;

  @action
  void toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  Future<void> sumAmountValue() async {
    totalCust = 0;
    for (var i = 0; i < basicBasketsProducts.length; i++) {
      totalCust += basicBasketsProducts[i].amount *
          await repositoryProduct
              .getProductValue(basicBasketsProducts[i].productsId);
    }
  }

  @action
  Future<void> search(String term) async {
    basicBasketsProductsAux = ObservableList<BasicBasketProductModel>();
    var data = await repositoryProduct.search(term);
    for (var i = 0; i < data.length; i++) {
      for (var j = 0; j < basicBasketsProducts.length; j++) {
        if (data[i].id == basicBasketsProducts[j].productsId) {
          basicBasketsProductsAux.add(basicBasketsProducts[j]);
        }
      }
    }
  }

  @action
  Future<void> getBasicBasketProducts() async {
    basicBasketsProductsAux = ObservableList<BasicBasketProductModel>();
    basicBasketsProductsAux.addAll(basicBasketsProducts);
  }

  @action
  Future<void> incrementBasicBasketProduct(
      BasicBasketProductModel model) async {
    model.amount++;
    if (model.amount == 1) {
      basicBasketsProducts.add(model);
    } else {
      basicBasketsProducts.remove(model);
      basicBasketsProducts.add(model);
    }
    sumAmountValue();
  }

  @action
  Future<void> decreaseBasicBasketProduct(BasicBasketProductModel model) async {
    if (model.amount != 0) {
      model.amount--;
      if (model.amount == 0) {
        basicBasketsProducts.remove(model);
      } else {
        basicBasketsProducts.remove(model);
        basicBasketsProducts.add(model);
      }
    }
    sumAmountValue();
  }

  Future<void> carregaAmount(int id) async {
    var _repository = BasicBasketProductRepository();
    var data = await _repository.searchIdinBasicBaskets(id);
    basicBasketsProducts.addAll(data);
  }

  int rewriteAmount(int id) {
    for (var i = 0; i < basicBasketsProducts.length; i++) {
      if (id == basicBasketsProducts[i].productsId) {
        return i;
      }
    }
    return -1;
  }

  Future<void> create(int id) async {
    for (var i = 0; i < basicBasketsProducts.length; i++) {
      basicBasketsProducts[i].basicbasketsId = id;
      await repository.create(basicBasketsProducts[i]);
    }
  }

  Future<void> update(int id) async {
    var _repository = BasicBasketProductRepository();
    var aux;
    var data = await _repository.searchIdinBasicBaskets(id);
    for (var i = 0; i < basicBasketsProducts.length; i++) {
      aux = 0;
      for (var j = 0; j < data.length; j++) {
        if (basicBasketsProducts[i].productsId == data[j].productsId) {
          data[j].amount = basicBasketsProducts[i].amount;
          _repository.update(data[j]);
          aux = 1;
        }
      }
      if (aux == 0) {
        basicBasketsProducts[i].basicbasketsId = id;
        await repository.create(basicBasketsProducts[i]);
      }
    }
  }
}
