import 'package:cesta_basica/app/controllers/request.controller.dart';
import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/repositories/request.repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateThree extends StatefulWidget {
  final RequestModel model;
  final RequestController controller;

  const CreateThree({Key key, this.model, this.controller}) : super(key: key);

  @override
  _CreateThreeState createState() => _CreateThreeState();
}

class _CreateThreeState extends State<CreateThree> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  final TextEditingController _date = TextEditingController();
  final formatCurrency = NumberFormat.simpleCurrency();
  final _repository = RequestRepository();

  void _onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    widget.model.id == 0 ? _create() : _update();
  }

  Future<void> _create() async {
    widget.model.id = null;
    widget.model.totalValue = widget.controller.totalValue;
    widget.model.status = "Pendente";
    widget.model.dateRequest = "21/02/2021";

    var id = await _repository.create(widget.model).catchError((_) {
      _onError();
    });

    await widget.controller.create(id).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Pedido Cadastrado',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            """
O Pedido foi cadastrada com sucesso.""",
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
            'Pedido Editado',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            """
O Pedido foi editada com sucesso.""",
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

  Future<Null> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: 'Selecione a data',
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        widget.model.deliveryDate =
            "${picked.day < 10 ? "0${picked.day}" : picked.day} / ${picked.month < 10 ? "0${picked.month}" : picked.month} / ${picked.year}";
        _date.value = TextEditingValue(
          text:
              "${picked.day < 10 ? "0${picked.day}" : picked.day} / ${picked.month < 10 ? "0${picked.month}" : picked.month} / ${picked.year}",
        );
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: FloatingActionButton(
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Theme.of(context).accentColor,
              ],
            ),
          ),
          child: Icon(
            Icons.add,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onPressed: _onSubmit,
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
                          Cadastro da data agendada para entrega da Cesta Básica."""
                                    : """
                          Atualização da data agendada para entrega da Cesta Básica.""",
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
                    height: 20,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _date,
                            onSaved: (newValue) =>
                                widget.model.deliveryDate = newValue,
                            decoration: InputDecoration(
                              labelText: 'Data de Entrega',
                              icon: Icon(
                                Icons.calendar_today,
                                size: 30,
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            maxLines: 3,
                            textCapitalization: TextCapitalization.words,
                            onSaved: (newValue) =>
                                widget.model.comments = newValue,
                            initialValue: widget.model?.comments,
                            decoration: InputDecoration(
                              labelText: 'Observação',
                              icon: Icon(
                                Icons.info,
                                size: 30,
                              ),
                              hintText:
                                  // ignore: lines_longer_than_80_chars
                                  'Digite uma observação, caso achar necessário.',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/money.png",
                            scale: 12,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            // ignore: lines_longer_than_80_chars
                            "\nValor Total do Pedido: \nR\$ ${formatCurrency.format(widget.controller.totalValue).substring(1)}",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
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
