// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.search.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchRequestController on _SearchRequestController, Store {
  final _$requestsAtom = Atom(name: '_SearchRequestController.requests');

  @override
  ObservableList<RequestModel> get requests {
    _$requestsAtom.reportRead();
    return super.requests;
  }

  @override
  set requests(ObservableList<RequestModel> value) {
    _$requestsAtom.reportWrite(value, super.requests, () {
      super.requests = value;
    });
  }

  final _$showSearchAtom = Atom(name: '_SearchRequestController.showSearch');

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

  final _$getRequestsAsyncAction =
      AsyncAction('_SearchRequestController.getRequests');

  @override
  Future<void> getRequests() {
    return _$getRequestsAsyncAction.run(() => super.getRequests());
  }

  final _$searchAsyncAction = AsyncAction('_SearchRequestController.search');

  @override
  Future<void> search(String clientName) {
    return _$searchAsyncAction.run(() => super.search(clientName));
  }

  final _$_SearchRequestControllerActionController =
      ActionController(name: '_SearchRequestController');

  @override
  void toggleSearch() {
    final _$actionInfo = _$_SearchRequestControllerActionController.startAction(
        name: '_SearchRequestController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_SearchRequestControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requests: ${requests},
showSearch: ${showSearch}
    ''';
  }
}
