// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$isExpandedClientAtom = Atom(name: '_HomeController.isExpandedClient');

  @override
  bool get isExpandedClient {
    _$isExpandedClientAtom.reportRead();
    return super.isExpandedClient;
  }

  @override
  set isExpandedClient(bool value) {
    _$isExpandedClientAtom.reportWrite(value, super.isExpandedClient, () {
      super.isExpandedClient = value;
    });
  }

  final _$isExpandedRequestAtom =
      Atom(name: '_HomeController.isExpandedRequest');

  @override
  bool get isExpandedRequest {
    _$isExpandedRequestAtom.reportRead();
    return super.isExpandedRequest;
  }

  @override
  set isExpandedRequest(bool value) {
    _$isExpandedRequestAtom.reportWrite(value, super.isExpandedRequest, () {
      super.isExpandedRequest = value;
    });
  }

  final _$isExpandedProductAtom =
      Atom(name: '_HomeController.isExpandedProduct');

  @override
  bool get isExpandedProduct {
    _$isExpandedProductAtom.reportRead();
    return super.isExpandedProduct;
  }

  @override
  set isExpandedProduct(bool value) {
    _$isExpandedProductAtom.reportWrite(value, super.isExpandedProduct, () {
      super.isExpandedProduct = value;
    });
  }

  final _$isExpandedBasicBasketAtom =
      Atom(name: '_HomeController.isExpandedBasicBasket');

  @override
  bool get isExpandedBasicBasket {
    _$isExpandedBasicBasketAtom.reportRead();
    return super.isExpandedBasicBasket;
  }

  @override
  set isExpandedBasicBasket(bool value) {
    _$isExpandedBasicBasketAtom.reportWrite(value, super.isExpandedBasicBasket,
        () {
      super.isExpandedBasicBasket = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void toggleExpandedClient() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.toggleExpandedClient');
    try {
      return super.toggleExpandedClient();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleExpandedRequest() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.toggleExpandedRequest');
    try {
      return super.toggleExpandedRequest();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleExpandedBasicBasket() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.toggleExpandedBasicBasket');
    try {
      return super.toggleExpandedBasicBasket();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleExpandedProduct() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.toggleExpandedProduct');
    try {
      return super.toggleExpandedProduct();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isExpandedClient: ${isExpandedClient},
isExpandedRequest: ${isExpandedRequest},
isExpandedProduct: ${isExpandedProduct},
isExpandedBasicBasket: ${isExpandedBasicBasket}
    ''';
  }
}
