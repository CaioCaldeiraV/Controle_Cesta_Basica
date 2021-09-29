import 'package:cesta_basica/app/controllers/request/request.controller.dart';
import 'package:cesta_basica/app/models/debts.model.dart';
import 'package:cesta_basica/app/models/installments.model.dart';
import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/repositories/debts.repository.dart';
import 'package:cesta_basica/app/repositories/installments.repository.dart';
import 'package:cesta_basica/app/repositories/request.repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../repositories/basicbasket.product.repository.dart';
import '../../../repositories/product.repository.dart';

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
  String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.model.typePayment ?? "À vista";
    if (widget.model.id != 0) {
      _date.text = widget.model.deliveryDate;
    }
    super.initState();
  }

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
    widget.model.statusDelivery = "Pendente";
    widget.model.dateRequest = DateTime.now().toString();
    widget.model.typePayment = dropdownValue;
    if (await _verifyAmountProducts()) {
      _decreaseProducts();
    } else {
      await _onErrorInStockProducts();
      return;
    }

    var id = await _repository.create(widget.model).catchError((_) {
      _onError();
    });

    if (returnQuantityInstallments() > 0) {
      var _repositoryDebts = DebtsRepository();
      var modelDebts = DebtsModel(
        requestId: id,
        status: "Pendente",
        quantityInstallments: returnQuantityInstallments(),
      );
      var idDebts = await _repositoryDebts.create(modelDebts).catchError((_) {
        _onError();
      });

      var _repositoryInstallments = InstallmentsRepository();
      for (var i = 0; i < returnQuantityInstallments(); i++) {
        var modelInstallments = InstallmentsModel(
          debtsId: idDebts,
          status: "Pendente",
          value: widget.model.totalValue / returnQuantityInstallments(),
          datePayment: returnDatePaymentInstallments(i),
        );
        await _repositoryInstallments.create(modelInstallments).catchError((_) {
          _onError();
        });
      }
    }

    await widget.controller.create(id).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Pedido Cadastrado',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            """
O Pedido foi cadastrada com sucesso.""",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
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
                  color: Theme.of(context).colorScheme.secondary,
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

  int returnQuantityInstallments() {
    if (dropdownValue == "À vista") {
      return 0;
    } else if (dropdownValue ==
        // ignore: lines_longer_than_80_chars
        '1x R\$ ${formatCurrency.format(widget.controller.totalValue).substring(1)} (30 dias)') {
      return 1;
    } else {
      return 2;
    }
  }

  String returnDatePaymentInstallments(int index) {
    var format = DateFormat('dd/MM/yyyy');
    if (dropdownValue == "À vista") {
      return format.format(DateTime.now());
    } else if (dropdownValue ==
        // ignore: lines_longer_than_80_chars
        '1x R\$ ${formatCurrency.format(widget.controller.totalValue).substring(1)} (30 dias)') {
      return format.format(DateTime.now().add(Duration(days: 30)));
    } else {
      if (index == 0) {
        return format.format(DateTime.now().add(Duration(days: 30)));
      } else {
        return format.format(DateTime.now().add(Duration(days: 60)));
      }
    }
  }

  Future<bool> _verifyAmountProducts() async {
    var _repositoryBasicBasketProduct = BasicBasketProductRepository();
    var _repositoryProduct = ProductRepository();
    for (var i = 0; i < widget.controller.requestBasicBaskets.length; i++) {
      var list = await _repositoryBasicBasketProduct.searchIdinBasicBaskets(
          widget.controller.requestBasicBaskets[i].basicbasketsId);

      for (var j = 0; j < list.length; j++) {
        var model = await _repositoryProduct.getProduct(list[j].productsId);
        if (model.stock >=
            widget.controller.requestBasicBaskets[i].amount * list[j].amount) {
          break;
        } else {
          return false;
        }
      }
    }
    return true;
  }

  void _decreaseProducts() async {
    var _repositoryBasicBasketProduct = BasicBasketProductRepository();
    var _repositoryProduct = ProductRepository();
    for (var i = 0; i < widget.controller.requestBasicBaskets.length; i++) {
      var list = await _repositoryBasicBasketProduct.searchIdinBasicBaskets(
          widget.controller.requestBasicBaskets[i].basicbasketsId);

      for (var j = 0; j < list.length; j++) {
        var model = await _repositoryProduct.getProduct(list[j].productsId);
        model.stock = model.stock -
            (widget.controller.requestBasicBaskets[i].amount * list[j].amount);
        await _repositoryProduct.update(model);
      }
    }
  }

  void _update() async {
    if (await _verifyAmountProducts()) {
      _decreaseProducts();
    } else {
      await _onErrorInStockProducts();
      return;
    }
    print(widget.model.statusDelivery);
    widget.model.totalValue = widget.controller.totalValue;
    widget.model.typePayment = dropdownValue;
    _repository.update(widget.model).then((_) async {}).catchError((_) {
      _onError();
    });

    var _repositoryDebts = DebtsRepository();
    var listDebts = await _repositoryDebts.searchRequestId(widget.model.id);
    if (listDebts.isNotEmpty) {
      _repositoryDebts.delete(listDebts[0].id);
    }

    if (returnQuantityInstallments() > 0) {
      var modelDebts = DebtsModel(
        requestId: widget.model.id,
        status: "Pendente",
        quantityInstallments: returnQuantityInstallments(),
      );
      var idDebts = await _repositoryDebts.create(modelDebts).catchError((_) {
        _onError();
      });

      var _repositoryInstallments = InstallmentsRepository();
      for (var i = 0; i < returnQuantityInstallments(); i++) {
        var modelInstallments = InstallmentsModel(
          debtsId: idDebts,
          status: "Pendente",
          value: widget.model.totalValue / returnQuantityInstallments(),
          datePayment: returnDatePaymentInstallments(i),
        );
        await _repositoryInstallments.create(modelInstallments);
      }
    }

    widget.controller.update(widget.model.id).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Pedido Editado',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            """
O Pedido foi editada com sucesso.""",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
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
                  color: Theme.of(context).colorScheme.secondary,
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

  Future<void> _onError() async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Ops! Algo deu errado',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          """
Ocorreu um erro ao cadastrar o pedido no sistema.""",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'ok',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    _onSuccess();
  }

  Future<void> _onErrorInStockProducts() async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Ops! Algo deu errado',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          """
Uma ou mais cesta básicas selecionadas não possui estoque suficiente de produtos que a compõem.""",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'ok',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
    Navigator.of(context).pop();
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
                Theme.of(context).colorScheme.secondary,
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
                            textCapitalization: TextCapitalization.sentences,
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton(
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'À vista',
                                // ignore: lines_longer_than_80_chars
                                '1x R\$ ${formatCurrency.format(widget.controller.totalValue).substring(1)} (30 dias)',
                                // ignore: lines_longer_than_80_chars
                                '2x R\$ ${formatCurrency.format(widget.controller.totalValue / 2).substring(1)} (30 e 60 dias)',
                              ].map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: dropdownValue,
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
