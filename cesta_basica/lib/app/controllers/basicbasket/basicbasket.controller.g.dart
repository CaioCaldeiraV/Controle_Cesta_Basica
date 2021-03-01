// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basicbasket.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BasicBasketController on _BasicBasketController, Store {
  final _$showSearchAtom = Atom(name: '_BasicBasketController.showSearch');

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

  final _$basicBasketsAtom = Atom(name: '_BasicBasketController.basicBaskets');

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

  final _$searchAsyncAction = AsyncAction('_BasicBasketController.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$getBasicBasketsAsyncAction =
      AsyncAction('_BasicBasketController.getBasicBaskets');

  @override
  Future<void> getBasicBaskets() {
    return _$getBasicBasketsAsyncAction.run(() => super.getBasicBaskets());
  }

  final _$_BasicBasketControllerActionController =
      ActionController(name: '_BasicBasketController');

  @override
  void toggleSearch() {
    final _$actionInfo = _$_BasicBasketControllerActionController.startAction(
        name: '_BasicBasketController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_BasicBasketControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearch: ${showSearch},
basicBaskets: ${basicBaskets}
    ''';
  }
}
