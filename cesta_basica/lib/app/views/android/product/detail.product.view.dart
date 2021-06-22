import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';
import 'package:flutter/material.dart';

import 'create.product.view.dart';
import 'search.product.view.dart';
import 'widgets/product.card.detail.widget.dart';
import 'widgets/product.list.popupmenubutton.dart';

class DetailProductView extends StatefulWidget {
  final ProductModel model;
  final _repository = ProductRepository();

  DetailProductView({this.model});

  @override
  _DetailProductViewState createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  int _currentIndex;

  Color getColor(int index) {
    if (index == _currentIndex) {
      if (_currentIndex == 0) {
        return Colors.blueGrey;
      } else {
        return Colors.yellow;
      }
    } else {
      return Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void _choiceAction(ProductListPopUpMenuButton choice, BuildContext context) {
    if (choice.title.data == "Editar Produto") {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateProductView(model: widget.model)))
          .then((value) => setState(() {}));
      ;
    } else if (choice.title.data == "Remover Produto") {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Excluir Produto',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
          content: Text(
            """
Você tem certeza que deseja deletar:\nProduto: ${widget.model.name}\nMarca: ${widget.model.brand}?""",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 14,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Não',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                widget._repository.delete(widget.model.id);
                await showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      'Produto Removido',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      """
O produto ${widget.model.name} foi removido com sucesso.""",
                      style: TextStyle(
                        color: Colors.white,
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
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchProductView()));
              },
              child: Text(
                'Sim',
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
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        actions: [
          PopupMenuButton(
            color: Colors.white,
            itemBuilder: (context) {
              return ProductListPopUpMenuButton.choices.map((choice) {
                return PopupMenuItem(
                  value: choice,
                  child: ListTile(
                    leading: choice.icon,
                    title: choice.title,
                  ),
                );
              }).toList();
            },
            onSelected: (choice) => _choiceAction(choice, context),
          )
        ],
      ),
      backgroundColor: Colors.green,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.green, Colors.cyan],
            stops: [
              0.0,
              0.8,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: _screenHeigth * .005,
              child: Center(
                child: Text(
                  "${widget.model.name} - ${widget.model.brand}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              top: _screenHeigth * .1,
              child: Container(
                height: _screenHeigth * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: 500,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              ProductCardDetailWidget(
                                model: widget.model,
                                onChanged: (index) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: getColor(0),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 9),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: getColor(1),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/bag.png',
                                scale: 8,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
