import 'dart:async';
import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:cesta_basica/app/repositories/debts.repository.dart';
import 'package:cesta_basica/app/repositories/installments.repository.dart';
import 'package:cesta_basica/app/repositories/request.repository.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

class PaymentController {
  @observable
  ObservableList<int> selected = ObservableList<int>();

  BehaviorSubject<List<InstallmentsModel>> streamParcelas =
      BehaviorSubject<List<InstallmentsModel>>();

  @action
  void toggleSelected(int id) async {
    streamParcelas.sink.add(null);
    selected.clear();
    selected.add(id);

    var list = <InstallmentsModel>[];

    var repositoryRequest = RequestRepository();
    var modelRequest = await repositoryRequest.getRequestsClientId(id);

    for (var i = 0; i < modelRequest.length; i++) {
      var repositoryDebts = DebtsRepository();
      var modelDebts =
          await repositoryDebts.searchRequestId(modelRequest[i].id);

      for (var j = 0; j < modelDebts.length; j++) {
        var installmentsRepository = InstallmentsRepository();
        list.addAll(await installmentsRepository
            .searchDebtsIdWithStatus(modelDebts[j].id));
      }
    }

    streamParcelas.sink.add(list);
  }

  Future<bool> paymentInstallment(InstallmentsModel model) async {
    var installmentsRepository = InstallmentsRepository();
    model.status = "Pago";
    try {
      if (streamParcelas.value.length == 1) {
        var _repositoryDebts = DebtsRepository();
        var debt = await _repositoryDebts.searchDebt(model.debtsId);
        debt[0].status = "Pago";
        await _repositoryDebts.update(debt[0]);
      }
      installmentsRepository.update(model);
      return true;
    } catch (_) {
      return false;
    }
  }
}
