import 'package:cesta_basica/app/models/client.model.dart';
import 'package:cesta_basica/app/repositories/client.repository.dart';
import 'package:mobx/mobx.dart';
part 'client.controller.g.dart';

class ClientController = _ClientController with _$ClientController;

abstract class _ClientController with Store {
  final ClientRepository repository = ClientRepository();

  @observable
  bool showSearch = false;

  @observable
  ObservableList<ClientModel> clients;

  @action
  void toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  Future<void> search(String term) async {
    clients = ObservableList<ClientModel>();
    var data = await repository.search(term);
    clients.addAll(data);
  }

  @action
  Future<void> getClients() async {
    clients = ObservableList<ClientModel>();
    var data = await repository.getClients();
    clients.addAll(data);
  }
}
