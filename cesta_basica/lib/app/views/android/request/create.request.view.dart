import 'package:cesta_basica/app/controllers/client/client.controller.dart';
import 'package:cesta_basica/app/controllers/request/request.controller.dart';
import 'package:cesta_basica/app/models/request.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'createsteptwo.request.view.dart';

class CreateRequestView extends StatefulWidget {
  final RequestModel model;

  const CreateRequestView({Key key, this.model}) : super(key: key);

  @override
  _CreateRequestViewState createState() => _CreateRequestViewState();
}

class _CreateRequestViewState extends State<CreateRequestView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ClientController controller = ClientController();
  final RequestController controllerRequest = RequestController();
  final textController = TextEditingController();

  @override
  void initState() {
    if (widget.model.id != 0) {
      controllerRequest.toggleSelected(widget.model.clientsId);
    }
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
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          heroTag: "btn1",
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.green,
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            if (widget.model.clientsId == null) {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(
                    'Selecione um Cliente',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.red,
                  content: Text(
                    """
Por favor, selecione um cliente para prosseguir com o pedido""",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 14,
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateTwo(
                    model: widget.model,
                    controller: controllerRequest,
                  ),
                ),
              );
            }
          },
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
                              text: "Primeira Etapa:\n",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                              text: """
Selecione o Cliente.""",
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
                height:
                    MediaQuery.of(context).size.height - (300 + kToolbarHeight),
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
                      height: MediaQuery.of(context).size.height -
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
                                            color: controllerRequest.selected
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
                                              trailing: controllerRequest
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
                                                if (!controllerRequest.selected
                                                    .contains(controller
                                                        .clients[i].id)) {
                                                  widget.model.clientsId =
                                                      controller.clients[i].id;
                                                  controllerRequest
                                                      .toggleSelected(controller
                                                          .clients[i].id);
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
            ],
          ),
        ),
      ),
    );
  }
}
