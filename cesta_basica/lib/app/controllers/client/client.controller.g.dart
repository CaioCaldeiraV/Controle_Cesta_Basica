// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientController on _ClientController, Store {
  final _$showSearchAtom = Atom(name: '_ClientController.showSearch');

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

  final _$clientsAtom = Atom(name: '_ClientController.clients');

  @override
  ObservableList<ClientModel> get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(ObservableList<ClientModel> value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_ClientController.search');

  @override
  Future<void> search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$getClientsAsyncAction = AsyncAction('_ClientController.getClients');

  @override
  Future<void> getClients() {
    return _$getClientsAsyncAction.run(() => super.getClients());
  }

  final _$_ClientControllerActionController =
      ActionController(name: '_ClientController');

  @override
  void toggleSearch() {
    final _$actionInfo = _$_ClientControllerActionController.startAction(
        name: '_ClientController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_ClientControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearch: ${showSearch},
clients: ${clients}
    ''';
  }
}
