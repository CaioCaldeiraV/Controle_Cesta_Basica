import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.product.repository.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';

class BasicBasketDetailController {
  final BasicBasketProductRepository repository;
  final ProductRepository repositoryProduct;

  List<ProductModel> listProducts;
  List<int> amount;

  BasicBasketDetailController(this.repository, this.repositoryProduct);

  Future<void> carregaListProducts(int id) async {
    listProducts = <ProductModel>[];
    amount = <int>[];
    var data = await repository.productsInBasicBasket(id);
    for (var i = 0; i < data.length; i++) {
      amount.add(data[i].amount);
      var dataProducts = await repositoryProduct.getProduct(data[i].productsId);
      listProducts.add(dataProducts);
    }
  }
}
