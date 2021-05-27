import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';
import 'package:mobx/mobx.dart';
part 'product.controller.g.dart';

class ProductController = _ProductController with _$ProductController;

abstract class _ProductController with Store {
  final ProductRepository repository = ProductRepository();

  @observable
  bool showSearch = false;

  @observable
  ObservableList<ProductModel> products;

  @action
  void toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  Future<void> search(String term) async {
    products = ObservableList<ProductModel>();
    var data = await repository.search(term);
    products.addAll(data);
  }

  @action
  Future<void> getProducts() async {
    products = ObservableList<ProductModel>();
    var data = await repository.getProducts();
    products.addAll(data);
  }
}
