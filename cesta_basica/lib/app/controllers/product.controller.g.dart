// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on _ProductController, Store {
  final _$showSearchAtom = Atom(name: '_ProductController.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  final _$productsAtom = Atom(name: '_ProductController.products');

  @override
  ObservableList<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_ProductController.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$getProductsAsyncAction =
      AsyncAction('_ProductController.getProducts');

  @override
  Future<void> getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  final _$_ProductControllerActionController =
      ActionController(name: '_ProductController');

  @override
  void toggleSearch() {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearch: ${showSearch},
products: ${products}
    ''';
  }
}
