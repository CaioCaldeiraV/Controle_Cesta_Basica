import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/repositories/client.repository.dart';
import 'package:cesta_basica/app/repositories/request.repository.dart';
import 'package:mobx/mobx.dart';
part 'request.search.controller.g.dart';

class SearchRequestController = _SearchRequestController
    with _$SearchRequestController;

abstract class _SearchRequestController with Store {
  final _repositoryRequest = RequestRepository();
  final _repositoryClient = ClientRepository();

  List<String> clientNames;

  @observable
  ObservableList<RequestModel> requests;

  @observable
  bool showSearch = false;

  @action
  void toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  Future<void> getRequests() async {
    requests = ObservableList<RequestModel>();
    var data = await _repositoryRequest.getRequests();
    requests.addAll(data);
    await completeClientNames();
  }

  @action
  Future<void> search(String clientName) async {
    requests = ObservableList<RequestModel>();
    var clients = await _repositoryClient.search(clientName);
    var allRequests = await _repositoryRequest.getRequests();
    for (var i = 0; i < clients.length; i++) {
      for (var j = 0; j < allRequests.length; j++) {
        if (clients[i].id == allRequests[j].clientsId) {
          requests.add(allRequests[j]);
          break;
        }
      }
    }
    await completeClientNames();
  }

  void completeClientNames() async {
    clientNames = <String>[];
    for (var i = 0; i < requests.length; i++) {
      var client =
          await _repositoryClient.getClient(requests.elementAt(i).clientsId);
      clientNames.add(client.name);
    }
  }
}
