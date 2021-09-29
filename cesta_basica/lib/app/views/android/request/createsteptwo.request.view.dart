import 'package:cesta_basica/app/controllers/basicbasket/basicbasket.controller.dart';
import 'package:cesta_basica/app/controllers/request/request.controller.dart';
import 'package:cesta_basica/app/models/request.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'create.listbag.view.dart';
import 'createstepthree.request.view.dart';
import 'widgets/basicbasket.list.item.createrequest.dart';

class CreateTwo extends StatefulWidget {
  final RequestModel model;
  final RequestController controller;

  const CreateTwo({Key key, this.model, this.controller}) : super(key: key);

  @override
  _CreateTwoState createState() => _CreateTwoState();
}

class _CreateTwoState extends State<CreateTwo> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final BasicBasketController controllerBasicBasket = BasicBasketController();
  final textController = TextEditingController();
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  void initState() {
    if (widget.model.id != 0) {
      widget.controller.carregaAmount(widget.model.id);
    }
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
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () {
            if (widget.controller.requestBasicBaskets.isEmpty) {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(
                    'Selecione uma Cesta Básica',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.red,
                  content: Text(
                    """
Por favor, selecione pelo menos uma cesta básica para prosseguir com o pedido""",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
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
                  builder: (context) => CreateThree(
                    model: widget.model,
                    controller: widget.controller,
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
          child: Stack(
            children: [
              Column(
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
                                  text: "Segunda Etapa:\n",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                  text: """
Seleção das Cestas Básicas que compõem o pedido.""",
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
                    height: MediaQuery.of(context).size.height -
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
                                  builder: (_) =>
                                      controllerBasicBasket.showSearch
                                          ? SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
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
                                                  cursorColor: Colors.white,
                                                  decoration: InputDecoration(
                                                    icon: Icon(
                                                      Icons.search,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                                    hintText: """
Pesquisar Cesta Básica""",
                                                    hintStyle: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  onChanged: (value) async {
                                                    await controllerBasicBasket
                                                        .search(value);
                                                  }),
                                            )
                                          : Text(
                                              "Lista de Cestas Básicas",
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
                                      controllerBasicBasket.showSearch
                                          ? Icons.close
                                          : Icons.search,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    onPressed: () async {
                                      if (controllerBasicBasket.showSearch) {
                                        textController.text = "";
                                        await controllerBasicBasket
                                            .getBasicBaskets();
                                      }
                                      controllerBasicBasket.toggleSearch();
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
                                ? controllerBasicBasket.getBasicBaskets()
                                : controllerBasicBasket
                                    .search(textController.text),
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
                                        itemCount: controllerBasicBasket
                                            .basicBaskets.length,
                                        itemBuilder: (context, index) =>
                                            BasicBasketListItemCreateRequest(
                                          modelBasicBasket:
                                              controllerBasicBasket
                                                  .basicBaskets[index],
                                          controllerRequest: widget.controller,
                                          modelRequest: widget.model,
                                        ),
                                      );
                                      if (controllerBasicBasket
                                          .basicBaskets.isEmpty) {
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            Text(
                                              "Encotrado",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/money.png",
                        scale: 12,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "\nValor Total: R\$ ",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Observer(
                            builder: (_) {
                              return Text(
                                // ignore: lines_longer_than_80_chars
                                "\n${formatCurrency.format(widget.controller.totalValue).substring(1)}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 50,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: FloatingActionButton(
                        heroTag: "btn2",
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.cyan,
                                Colors.white,
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.shopping_bag,
                            size: 30,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ListBagView(
                                controller: widget.controller,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Observer(builder: (_) {
                            return Text(
                              widget.controller.requestBasicBaskets.length
                                  .toString(),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            );
                          }),
                        ),
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
