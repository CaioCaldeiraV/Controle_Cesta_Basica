import 'package:cesta_basica/app/controllers/client/client.controller.dart';
import 'package:cesta_basica/app/controllers/payment/payment.controller.dart';
import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class PaymentRegistrarView extends StatefulWidget {
  const PaymentRegistrarView({Key key}) : super(key: key);

  @override
  _PaymentRegistrarViewState createState() => _PaymentRegistrarViewState();
}

class _PaymentRegistrarViewState extends State<PaymentRegistrarView> {
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
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
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
            color: Theme.of(context).accentColor,
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
                child: Stack(children: [
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
                              text: "Registrar pagamento :\n",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                              text: """
Selecione o cliente e a parcela desejada.""",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                              ),
                            )
                          ])),
                    ),
                  )
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9 -
                    (300 + kToolbarHeight),
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
                                          color: Theme.of(context).accentColor,
                                        ),
                                        keyboardType: TextInputType.name,
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.search,
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                          hintText: 'Pesquisar Clientes',
                                          hintStyle: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                        onChanged: controller.search,
                                      ),
                                    )
                                  : Text(
                                      "Lista de Clientes",
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
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
                                  color: Theme.of(context).accentColor,
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
                      height: MediaQuery.of(context).size.height * 0.9 -
                          (340 + kToolbarHeight),
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
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              StreamBuilder<List<InstallmentsModel>>(
                  stream: controllerPayment.streamParcelas.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.isNotEmpty && firstTimeDropDown) {
                        dropdownValue = snapshot.data[0];
                        firstTimeDropDown = false;
                      }
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: DropdownButton(
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items:
                                  snapshot.data.map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                      // ignore: lines_longer_than_80_chars
                                      "R\$ ${formatCurrency.format(value.value).substring(1)}   Data: ${value.datePayment}"),
                                );
                              }).toList(),
                              value: dropdownValue,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (dropdownValue != null) {
                    controllerPayment
                        .paymentInstallment(dropdownValue)
                        .then((value) async {
                      if (value) {
                        await showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              'Pagamento registrado',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              // ignore: lines_longer_than_80_chars
                              "O pagamento no valor de R\$${formatCurrency.format(dropdownValue.value).substring(1)} do cliente $nameClientSelected foi registrado com sucesso.",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 14,
                              ),
                            ),
                            backgroundColor: Colors.green,
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'ok',
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                // ignore: lines_longer_than_80_chars
                                'Falha ao registrar pagamento do cliente $nameClientSelected.'),
                          ),
                        );
                      }
                    });
                  }
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ))),
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.green,
                          Theme.of(context).primaryColor,
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(45),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 7,
                          offset: Offset(-2.0, 4.0),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      "REGISTRAR PAGAMENTO",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
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
