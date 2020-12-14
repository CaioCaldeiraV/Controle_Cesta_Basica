// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basicbasketproduct.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BasicBasketProductController on _BasicBasketProductController, Store {
  final _$basicBasketsProductsAtom =
      Atom(name: '_BasicBasketProductController.basicBasketsProducts');

  @override
  ObservableList<BasicBasketProductModel> get basicBasketsProducts {
    _$basicBasketsProductsAtom.reportRead();
    return super.basicBasketsProducts;
  }

  @override
  set basicBasketsProducts(ObservableList<BasicBasketProductModel> value) {
    _$basicBasketsProductsAtom.reportWrite(value, super.basicBasketsProducts,
        () {
      super.basicBasketsProducts = value;
    });
  }

  final _$basicBasketsProductsAuxAtom =
      Atom(name: '_BasicBasketProductController.basicBasketsProductsAux');

  @override
  ObservableList<BasicBasketProductModel> get basicBasketsProductsAux {
    _$basicBasketsProductsAuxAtom.reportRead();
    return super.basicBasketsProductsAux;
  }

  @override
  set basicBasketsProductsAux(ObservableList<BasicBasketProductModel> value) {
    _$basicBasketsProductsAuxAtom
        .reportWrite(value, super.basicBasketsProductsAux, () {
      super.basicBasketsProductsAux = value;
    });
  }

  final _$totalCustAtom = Atom(name: '_BasicBasketProductController.totalCust');

  @override
  double get totalCust {
    _$totalCustAtom.reportRead();
    return super.totalCust;
  }

  @override
  set totalCust(double value) {
    _$totalCustAtom.reportWrite(value, super.totalCust, () {
      super.totalCust = value;
    });
  }

  final _$showSearchAtom =
      Atom(name: '_BasicBasketProductController.showSearch');

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

  final _$sumAmountValueAsyncAction =
      AsyncAction('_BasicBasketProductController.sumAmountValue');

  @override
  Future<void> sumAmountValue() {
    return _$sumAmountValueAsyncAction.run(() => super.sumAmountValue());
  }

  final _$searchAsyncAction =
      AsyncAction('_BasicBasketProductController.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$getBasicBasketProductsAsyncAction =
      AsyncAction('_BasicBasketProductController.getBasicBasketProducts');

  @override
  Future<void> getBasicBasketProducts() {
    return _$getBasicBasketProductsAsyncAction
        .run(() => super.getBasicBasketProducts());
  }

  final _$incrementBasicBasketProductAsyncAction =
      AsyncAction('_BasicBasketProductController.incrementBasicBasketProduct');

  @override
  Future<void> incrementBasicBasketProduct(BasicBasketProductModel model) {
    return _$incrementBasicBasketProductAsyncAction
        .run(() => super.incrementBasicBasketProduct(model));
  }

  final _$decreaseBasicBasketProductAsyncAction =
      AsyncAction('_BasicBasketProductController.decreaseBasicBasketProduct');

  @override
  Future<void> decreaseBasicBasketProduct(BasicBasketProductModel model) {
    return _$decreaseBasicBasketProductAsyncAction
        .run(() => super.decreaseBasicBasketProduct(model));
  }

  final _$carregaAmountAsyncAction =
      AsyncAction('_BasicBasketProductController.carregaAmount');

  @override
  Future<void> carregaAmount(int id) {
    return _$carregaAmountAsyncAction.run(() => super.carregaAmount(id));
  }

  final _$_BasicBasketProductControllerActionController =
      ActionController(name: '_BasicBasketProductController');

  @override
  void toggleSearch() {
    final _$actionInfo = _$_BasicBasketProductControllerActionController
        .startAction(name: '_BasicBasketProductController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_BasicBasketProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
basicBasketsProducts: ${basicBasketsProducts},
basicBasketsProductsAux: ${basicBasketsProductsAux},
totalCust: ${totalCust},
showSearch: ${showSearch}
    ''';
  }
}
