import 'package:cesta_basica/app/controllers/request/request.controller.dart';
import 'package:cesta_basica/app/models/client.model.dart';
import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/models/requestbasicbasket.model.dart';
import 'package:cesta_basica/app/repositories/client.repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RequestCardDetailWidget extends StatelessWidget {
  final RequestModel model;
  final ValueChanged<int> onChanged;

  RequestCardDetailWidget({Key key, this.model, this.onChanged})
      : super(key: key);

  String returnDateRequest() {
    var day = model.dateRequest.substring(8, 10);
    var month = model.dateRequest.substring(5, 7);
    var year = model.dateRequest.substring(0, 4);
    return "$day/$month/$year";
  }

  final formatCurrency = NumberFormat.simpleCurrency();
  final RequestController _controller = RequestController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460,
      width: MediaQuery.of(context).size.width * 0.9,
      child: PageView(
        onPageChanged: onChanged,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blueGrey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(-2.0, 4.0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Informações",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        Icon(
                          Icons.info,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(children: [
                  Container(
                    height: 400,
                    padding: EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        Text(
                          "Data do Pedido:\n    - ${returnDateRequest()}",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          // ignore: lines_longer_than_80_chars
                          "Data Agendada para Entrega:\n    - ${model.deliveryDate}",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Status da Entrega:\n    - ${model.statusDelivery}",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          """
Valor Total:\n    - R\$ ${formatCurrency.format(model.totalValue).substring(1)}""",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Forma de Pagamento:\n    - ${model.typePayment}",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FutureBuilder<List<InstallmentsModel>>(
                          future: _controller.installmentsForRequest(model.id),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.data == null) {
                                return Container();
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var i = 0;
                                        i < snapshot.data.length;
                                        i++)
                                      Text(
                                        // ignore: lines_longer_than_80_chars
                                        "Parcela ${i + 1}:\n    - R\$ ${formatCurrency.format(snapshot.data[i].value).substring(1)}\n    - ${snapshot.data[i].datePayment}\n    - ${snapshot.data[i].status}",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.blueGrey),
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              }
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            }
                          },
                        ),
                        Text(
                          "Observações:\n    - ${model.comments}",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 68,
                    child: Text(
                      "Provém de pngtree.com",
                      style: TextStyle(color: Colors.cyan, fontSize: 6),
                    ),
                  ),
                ])
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(-2.0, 4.0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width * 0.9) - 70,
                          child: Text(
                            "Dados Cliente",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.shop_two,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  padding: EdgeInsets.all(20),
                  child: FutureBuilder<ClientModel>(
                    future: ClientRepository().getClient(
                      model.clientsId,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView(
                          children: [
                            Text(
                              "Nome: ${snapshot.data.name}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "RG: ${snapshot.data.rg}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "CPF: ${snapshot.data.cpf}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "Telefone: ${snapshot.data.phone}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              """
Data de Nascimento: ${snapshot.data.dateOfBirth.replaceAll(' ', '')}""",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "Sexo: ${snapshot.data.gender}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "Estado: ${snapshot.data.state}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "Cidade: ${snapshot.data.city}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "Bairro: ${snapshot.data.neighborhood}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "Rua: ${snapshot.data.street}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                            Text(
                              "Número: ${snapshot.data.number}",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                            ),
                          ],
                        );
                      } else {
                        return CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(-2.0, 4.0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width * 0.9) - 70,
                          child: Text(
                            "Pedido",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.shopping_bag,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  padding: EdgeInsets.all(20),
                  child: FutureBuilder<List<RequestBasicBasketModel>>(
                    future: _controller.basicBasketsInRequest(model.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SingleChildScrollView(
                          child: DataTable(
                            columns: [
                              DataColumn(
                                label: Text("Quant"),
                                numeric: true,
                              ),
                              DataColumn(
                                label: Text("Cesta"),
                              ),
                              DataColumn(
                                label: Text("Valor"),
                                numeric: true,
                              ),
                            ],
                            rows: [
                              for (int i = 0; i < snapshot.data.length; i++)
                                DataRow(
                                  cells: [
                                    DataCell(
                                      Text("""
${snapshot.data[i].amount}"""),
                                    ),
                                    DataCell(
                                      Text(
                                          // ignore: lines_longer_than_80_chars
                                          "${_controller.listBasicBasketName[i].name}"),
                                    ),
                                    DataCell(
                                      Text(
                                          // ignore: lines_longer_than_80_chars
                                          "R\$ ${formatCurrency.format(_controller.listBasicBasketName[i].value).substring(1)}"),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        );
                      } else {
                        return CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
