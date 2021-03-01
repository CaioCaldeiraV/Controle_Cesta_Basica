// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequestController on _RequestController, Store {
  final _$selectedAtom = Atom(name: '_RequestController.selected');

  @override
  ObservableList<int> get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(ObservableList<int> value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$totalValueAtom = Atom(name: '_RequestController.totalValue');

  @override
  double get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(double value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

  final _$basicBasketsAtom = Atom(name: '_RequestController.basicBaskets');

  @override
  ObservableList<BasicBasketModel> get basicBaskets {
    _$basicBasketsAtom.reportRead();
    return super.basicBaskets;
  }

  @override
  set basicBaskets(ObservableList<BasicBasketModel> value) {
    _$basicBasketsAtom.reportWrite(value, super.basicBaskets, () {
      super.basicBaskets = value;
    });
  }

  final _$requestBasicBasketsAtom =
      Atom(name: '_RequestController.requestBasicBaskets');

  @override
  ObservableList<RequestBasicBasketModel> get requestBasicBaskets {
    _$requestBasicBasketsAtom.reportRead();
    return super.requestBasicBaskets;
  }

  @override
  set requestBasicBaskets(ObservableList<RequestBasicBasketModel> value) {
    _$requestBasicBasketsAtom.reportWrite(value, super.requestBasicBaskets, () {
      super.requestBasicBaskets = value;
    });
  }

  final _$requestBasicBasketsAuxAtom =
      Atom(name: '_RequestController.requestBasicBasketsAux');

  @override
  ObservableList<RequestBasicBasketModel> get requestBasicBasketsAux {
    _$requestBasicBasketsAuxAtom.reportRead();
    return super.requestBasicBasketsAux;
  }

  @override
  set requestBasicBasketsAux(ObservableList<RequestBasicBasketModel> value) {
    _$requestBasicBasketsAuxAtom
        .reportWrite(value, super.requestBasicBasketsAux, () {
      super.requestBasicBasketsAux = value;
    });
  }

  final _$showSearchAtom = Atom(name: '_RequestController.showSearch');

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

  final _$getRequestBasicBasketAsyncAction =
      AsyncAction('_RequestController.getRequestBasicBasket');

  @override
  Future<void> getRequestBasicBasket() {
    return _$getRequestBasicBasketAsyncAction
        .run(() => super.getRequestBasicBasket());
  }

  final _$searchAsyncAction = AsyncAction('_RequestController.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$incrementRequestBasicBasketAsyncAction =
      AsyncAction('_RequestController.incrementRequestBasicBasket');

  @override
  Future<void> incrementRequestBasicBasket(RequestBasicBasketModel model) {
    return _$incrementRequestBasicBasketAsyncAction
        .run(() => super.incrementRequestBasicBasket(model));
  }

  final _$decreaseRequestBasicBasketAsyncAction =
      AsyncAction('_RequestController.decreaseRequestBasicBasket');

  @override
  Future<void> decreaseRequestBasicBasket(RequestBasicBasketModel model) {
    return _$decreaseRequestBasicBasketAsyncAction
        .run(() => super.decreaseRequestBasicBasket(model));
  }

  final _$sumAmountValueAsyncAction =
      AsyncAction('_RequestController.sumAmountValue');

  @override
  Future<void> sumAmountValue() {
    return _$sumAmountValueAsyncAction.run(() => super.sumAmountValue());
  }

  final _$_RequestControllerActionController =
      ActionController(name: '_RequestController');

  @override
  void toggleSearch() {
    final _$actionInfo = _$_RequestControllerActionController.startAction(
        name: '_RequestController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_RequestControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSelected(int id) {
    final _$actionInfo = _$_RequestControllerActionController.startAction(
        name: '_RequestController.toggleSelected');
    try {
      return super.toggleSelected(id);
    } finally {
      _$_RequestControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected},
totalValue: ${totalValue},
basicBaskets: ${basicBaskets},
requestBasicBaskets: ${requestBasicBaskets},
requestBasicBasketsAux: ${requestBasicBasketsAux},
showSearch: ${showSearch}
    ''';
  }
}
