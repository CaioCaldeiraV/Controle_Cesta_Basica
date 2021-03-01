import 'package:cesta_basica/app/controllers/basicbasket/basicbasketproduct.controller.dart';
import 'package:cesta_basica/app/controllers/product/product.controller.dart';
import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/views/android/basic_masket/widgets/products.list.createbasicbasket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'create.listbag.view.dart';
import 'create.value.basicbasket.view.dart';

class CreateProductsBasicMasketView extends StatefulWidget {
  final BasicBasketModel model;

  CreateProductsBasicMasketView({this.model});

  @override
  _CreateProductsBasicMasketViewState createState() =>
      _CreateProductsBasicMasketViewState();
}

class _CreateProductsBasicMasketViewState
    extends State<CreateProductsBasicMasketView> {
  final formatCurrency = NumberFormat.simpleCurrency();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProductController controller = ProductController();
  final BasicBasketProductController controllerBasicBasketProduct =
      BasicBasketProductController();
  final textController = TextEditingController();

  @override
  void initState() {
    if (widget.model.id != 0) {
      controllerBasicBasketProduct.carregaAmount(widget.model.id);
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreateValueBasicBasketView(
                  model: widget.model,
                  controller: controllerBasicBasketProduct,
                ),
              ),
            );
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
Seleção dos Produtos que compõe a Cesta Básica.""",
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
                                  builder: (_) => controller.showSearch
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
                                              color:
                                                  Theme.of(context).accentColor,
                                            ),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.search,
                                                color: Theme.of(context)
                                                    .accentColor,
                                              ),
                                              hintText: 'Pesquisar Produtos',
                                              hintStyle: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                            onChanged: controller.search,
                                          ),
                                        )
                                      : Text(
                                          "Lista de Produtos",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).accentColor,
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
                                        controller.getProducts();
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
                                ? controller.getProducts()
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
                                        itemCount: controller.products.length,
                                        itemBuilder: (context, index) =>
                                            ProductListItemCreateBasicBasket(
                                          modelProduct:
                                              controller.products[index],
                                          controllerBasicBasketProduct:
                                              controllerBasicBasketProduct,
                                          modelBasicBasket: widget.model,
                                        ),
                                      );
                                      if (controller.products.isEmpty) {
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
                            "\nCusto Total: R\$ ",
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
                                "\n${formatCurrency.format(controllerBasicBasketProduct.totalCust).substring(1)}",
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
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchCreateListBagView(
                                controller: controllerBasicBasketProduct,
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
                              controllerBasicBasketProduct
                                  .basicBasketsProducts.length
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
