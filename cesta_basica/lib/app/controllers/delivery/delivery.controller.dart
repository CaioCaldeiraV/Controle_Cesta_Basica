import 'dart:async';
import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/repositories/request.repository.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

class DeliveryController {
  @observable
  ObservableList<int> selected = ObservableList<int>();

  BehaviorSubject<List<RequestModel>> streamRequests =
      BehaviorSubject<List<RequestModel>>();

  @action
  void toggleSelected(int id) async {
    streamRequests.sink.add(null);
    selected.clear();
    selected.add(id);
    var list = <RequestModel>[];
    var repositoryRequest = RequestRepository();
    var listRequest = await repositoryRequest.getRequestsClientId(id);
    for (var i = 0; i < listRequest.length; i++) {
      if (listRequest[i].statusDelivery == "Pendente") {
        list.add(listRequest[i]);
      }
    }
    streamRequests.sink.add(list);
  }

  Future<bool> registerDelivery(RequestModel model) async {
    try {
      var repositoryRequest = RequestRepository();
      model.statusDelivery = "Concluído";
      await repositoryRequest.update(model);
      return true;
    } catch (_) {
      return false;
    }
  }
}
