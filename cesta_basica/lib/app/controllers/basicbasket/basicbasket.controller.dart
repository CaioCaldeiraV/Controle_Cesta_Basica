import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.repository.dart';
import 'package:mobx/mobx.dart';
part 'basicbasket.controller.g.dart';

class BasicBasketController = _BasicBasketController
    with _$BasicBasketController;

abstract class _BasicBasketController with Store {
  final BasicBasketRepository repository = BasicBasketRepository();

  @observable
  bool showSearch = false;

  @observable
  ObservableList<BasicBasketModel> basicBaskets;

  @action
  void toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  Future<void> search(String term) async {
    basicBaskets = ObservableList<BasicBasketModel>();
    var data = await repository.search(term);
    basicBaskets.addAll(data);
  }

  @action
  Future<void> getBasicBaskets() async {
    basicBaskets = ObservableList<BasicBasketModel>();
    var data = await repository.getBasicBaskets();
    basicBaskets.addAll(data);
  }
}
