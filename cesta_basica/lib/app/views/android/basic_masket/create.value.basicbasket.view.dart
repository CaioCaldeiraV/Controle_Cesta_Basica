import 'package:cesta_basica/app/controllers/basicbasket/basicbasketproduct.controller.dart';
import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class CreateValueBasicBasketView extends StatefulWidget {
  final BasicBasketModel model;
  final BasicBasketProductController controller;

  const CreateValueBasicBasketView({Key key, this.model, this.controller})
      : super(key: key);

  @override
  _CreateValueBasicBasketViewState createState() =>
      _CreateValueBasicBasketViewState();
}

class _CreateValueBasicBasketViewState
    extends State<CreateValueBasicBasketView> {
  final _formKey = GlobalKey<FormState>();
  final formatCurrency = NumberFormat.simpleCurrency();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final BasicBasketRepository _repository = BasicBasketRepository();

  void _onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    widget.model.id == 0 ? _create() : _update();
  }

  Future<void> _create() async {
    widget.model.id = null;
    var id = await _repository.create(widget.model).catchError((_) {
      _onError();
    });

    await widget.controller.create(id).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Cesta Básica Cadastrada',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            """
A Cesta básica '${widget.model.name}' foi cadastrada com sucesso.""",
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
      _onSuccess();
    }).catchError((_) {
      _onError();
    });
  }

  void _update() {
    _repository.update(widget.model).then((_) async {}).catchError((_) {
      _onError();
    });

    widget.controller.update(widget.model.id).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Cesta Básica Editada',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            """
A Cesta básica '${widget.model.name}' foi editada com sucesso.""",
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
      _onSuccess();
    }).catchError((_) {
      _onError();
    });
  }

  void _onSuccess() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void _onError() {
    final snackBar = SnackBar(
      content: Text('Ops, algo deu errado!'),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var _value = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      initialValue: widget.model.value == null ? 0 : widget.model.value,
    );
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/greenbottom.png",
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        "assets/images/painting.png",
                      ),
                      fit: BoxFit.contain,
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Center(
                        child: RichText(
                            text: TextSpan(
                                text: "Terceira Etapa:",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                text: widget.model.id == 0
                                    ? """
                          Cadastro do valor de venda da Cesta Básica."""
                                    : """
                          Atualização do valor de venda da Cesta Básica.""",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15,
                                ),
                              )
                            ])),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/money.png",
                        scale: 15,
                      ),
                      Text(
                        """
\nCusto Total: R\$ ${formatCurrency.format(widget.controller.totalCust).substring(1)}""",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _value,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    onSaved: (newValue) => widget.model.value = double.parse(
                            newValue.replaceAll(RegExp('[^0-9]'), "")) /
                        100,
                    onChanged: (newValue) => widget.model.value = double.parse(
                            newValue.replaceAll(RegExp('[^0-9]'), "")) /
                        100,
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      icon: Icon(
                        Icons.monetization_on,
                        size: 30,
                      ),
                      hintText: 'Digite o Valor do Produto',
                    ),
                    validator: (value) {
                      if (double.parse(value
                              .substring(3)
                              .replaceAll(".", "")
                              .replaceAll(",", ".")) <
                          widget.controller.totalCust) {
                        return 'O valor não pode ser menos que o custo.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 65,
                      height: 65,
                      child: FloatingActionButton(
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
                            Icons.add,
                            size: 30,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        onPressed: _onSubmit,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
