import 'dart:async';

import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';

class BuyStockController {
  final StreamController<List<ProductModel>> _streamController =
      StreamController<List<ProductModel>>();

  Sink<List<ProductModel>> get input => _streamController.sink;
  Stream<List<ProductModel>> get output => _streamController.stream;

  Future<List<ProductModel>> listProducts() async {
    _streamController.sink.add(null);
    var productRepository = ProductRepository();
    return await productRepository.getProducts();
  }
}
