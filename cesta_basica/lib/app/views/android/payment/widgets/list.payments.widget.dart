import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListPaymentsWidget extends StatelessWidget {
  final InstallmentsModel model;
  ListPaymentsWidget({Key key, this.model}) : super(key: key);

  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.payments,
          color: Colors.white,
        ),
      ),
      title: Text("R\$ ${formatCurrency.format(model.value).substring(1)}"),
      subtitle: model.status == "Pendente"
          ? Text(
              "${model.status}",
              style: TextStyle(color: Colors.red),
            )
          : Text(
              "${model.status}",
              style: TextStyle(color: Colors.green),
            ),
      trailing: Column(
        children: [
          Text("${model.datePayment}"),
          Text("Pedido Nº ${model.debtsId}"),
        ],
      ),
    );
  }
}
