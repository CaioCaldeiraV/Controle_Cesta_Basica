import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.repository.dart';
import 'package:flutter/material.dart';

import 'create.basicbasket.view.dart';
import 'search.basicbasket.view.dart';
import 'widgets/basicbasket.card.detail.widget.dart';
import 'widgets/basicbasket.list.popupmenu.dart';

class DetailBasicBasketView extends StatefulWidget {
  final BasicBasketModel model;
  final String clientName;
  const DetailBasicBasketView({Key key, this.model, this.clientName})
      : super(key: key);

  @override
  _DetailBasicBasketViewState createState() => _DetailBasicBasketViewState();
}

class _DetailBasicBasketViewState extends State<DetailBasicBasketView> {
  final _repository = BasicBasketRepository();
  int _currentIndex;

  Color getColor(int index) {
    if (index == _currentIndex) {
      if (_currentIndex == 0) {
        return Colors.blue;
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

  void _choiceAction(BasicBasketListPopUpMenu choice, BuildContext context) {
    if (choice.title.data == "Editar Cesta Básica") {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CreateBasicBasketView(model: widget.model)))
          .then((value) => setState(() {}));
      ;
    } else if (choice.title.data == "Remover Cesta Básica") {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Remover Cesta Básica',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
          content: Text(
            """
Você tem certeza que deseja deletar a cesta básica: ${widget.model.name}?""",
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
                'Não',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FlatButton(
              onPressed: () async {
                _repository.delete(widget.model.id);
                await showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      'Cesta Básica Removida',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      """
A cesta básica "${widget.model.name}" foi removida com sucesso.""",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 14,
                      ),
                    ),
                    backgroundColor: Colors.green,
                    actions: <Widget>[
                      FlatButton(
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
                        builder: (context) => SearchBasicBasketView()));
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
            color: Theme.of(context).accentColor,
            itemBuilder: (context) {
              return BasicBasketListPopUpMenu.choices.map((choice) {
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
                  "${widget.model.name}",
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
                              BasicBasketCardDetailWidget(
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
