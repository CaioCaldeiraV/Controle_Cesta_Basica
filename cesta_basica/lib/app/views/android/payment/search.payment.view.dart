import 'package:cesta_basica/app/controllers/client/client.controller.dart';
import 'package:cesta_basica/app/controllers/payment/payment.controller.dart';
import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'widgets/list.payments.widget.dart';

class PaymentSearchView extends StatefulWidget {
  const PaymentSearchView({Key key}) : super(key: key);

  @override
  _PaymentSearchViewState createState() => _PaymentSearchViewState();
}

class _PaymentSearchViewState extends State<PaymentSearchView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ClientController controller = ClientController();
  final textController = TextEditingController();
  final PaymentController controllerPayment = PaymentController();
  InstallmentsModel dropdownValue;
  final formatCurrency = NumberFormat.simpleCurrency();
  String nameClientSelected;
  bool firstTimeDropDown = true;

  @override
  void initState() {
    controllerPayment.streamParcelas.sink.add([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.green,
                Theme.of(context).primaryColor,
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Controle Cestas Básicas',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/painting.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Buscar Parcelas :\n",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: """
Selecione o cliente e as parcelas refente a ele aparecerá.""",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3 + 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 7,
                            offset: Offset(-2.0, 4.0),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Observer(
                              builder: (_) => controller.showSearch
                                  ? SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          (125),
                                      height: 150,
                                      child: TextField(
                                        controller: textController,
                                        autofocus: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        keyboardType: TextInputType.name,
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.search,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                          hintText: 'Pesquisar Clientes',
                                          hintStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            fontSize: 12,
                                          ),
                                        ),
                                        onChanged: controller.search,
                                      ),
                                    )
                                  : Text(
                                      "Lista de Clientes",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                            ),
                            Observer(
                              builder: (_) => IconButton(
                                icon: Icon(
                                  controller.showSearch
                                      ? Icons.close
                                      : Icons.search,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                onPressed: () {
                                  if (controller.showSearch) {
                                    textController.text = "";
                                    controller.getClients();
                                  }
                                  controller.toggleSearch();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      color: Colors.grey[200],
                      child: FutureBuilder(
                        future: textController.text.isEmpty
                            ? controller.getClients()
                            : controller.search(textController.text),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Aconteceu Algo de ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  Text(
                                    "Inesperado",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ));
                            } else {
                              return Observer(
                                builder: (_) {
                                  var listView = ListView.builder(
                                    itemCount: controller.clients.length,
                                    itemBuilder: (ctx, i) {
                                      return Observer(
                                        builder: (_) {
                                          return Container(
                                            color: controllerPayment.selected
                                                    .contains(controller
                                                        .clients[i].id)
                                                ? Colors.cyan[300]
                                                : Colors.transparent,
                                            child: ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Image.asset(
                                                  controller.clients[i]
                                                              .gender ==
                                                          "Masculino"
                                                      ? "assets/images/profilepicture.png"
                                                      : "assets/images/profilepicturefemale.png",
                                                  color: Colors.black,
                                                ),
                                              ),
                                              title: Text(
                                                  controller.clients[i].name),
                                              subtitle: Text(
                                                  // ignore: lines_longer_than_80_chars
                                                  "${controller.clients[i].state.substring(0, 2)} - ${controller.clients[i].city}"),
                                              trailing: controllerPayment
                                                      .selected
                                                      .contains(controller
                                                          .clients[i].id)
                                                  ? Icon(
                                                      Icons.check_box,
                                                      size: 30,
                                                      color: Colors.black,
                                                    )
                                                  : null,
                                              onTap: () {
                                                if (!controllerPayment.selected
                                                    .contains(controller
                                                        .clients[i].id)) {
                                                  controllerPayment
                                                      .toggleSelected(controller
                                                          .clients[i].id);
                                                  // ignore: lines_longer_than_80_chars
                                                  nameClientSelected =
                                                      controller
                                                          .clients[i].name;
                                                  firstTimeDropDown = true;
                                                }
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                  if (controller.clients.isEmpty) {
                                    return Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Nenhum Item na Lista",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        Text(
                                          "Encotrado",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ));
                                  } else {
                                    return listView;
                                  }
                                },
                              );
                            }
                          } else {
                            return Center(
                              child: ShaderMask(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.cyan),
                                ),
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.green,
                                      Colors.cyan,
                                    ],
                                    stops: [
                                      0.0,
                                      0.7,
                                    ],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.srcATop,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Card(
                  margin: EdgeInsets.zero,
                  child: StreamBuilder<List<InstallmentsModel>>(
                    stream: controllerPayment.streamParcelas.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // ignore: omit_local_variable_types
                        double sumTotal = 0;
                        for (var i = 0; i < snapshot.data.length; i++) {
                          sumTotal = sumTotal + snapshot.data[i].value;
                        }
                        var listView = ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, i) {
                            return ListPaymentsWidget(
                              model: snapshot.data[i],
                            );
                          },
                        );
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.3 - 40,
                              child: listView,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              color: Theme.of(context).primaryColor,
                              child: Center(
                                child: Text(
                                  """
Valor Total da Divida: R\$ ${formatCurrency.format(sumTotal).substring(1)}""",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
