import 'package:cesta_basica/app/controllers/stock/buy.stock.controller.dart';
import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';
import 'package:cesta_basica/app/views/android/client/widgets/client.linear.gradient.mask.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class BuyStockView extends StatefulWidget {
  @override
  _BuyStockViewState createState() => _BuyStockViewState();
}

class _BuyStockViewState extends State<BuyStockView> {
  ProductModel model = ProductModel(name: "Selecione...");
  double value;
  int quantidade;
  ProductModel dropdownValue;
  final _formKey = GlobalKey<FormState>();
  BuyStockController controller = BuyStockController();
  ProductRepository repository = ProductRepository();
  TextEditingController quantity = TextEditingController();
  var _value = MoneyMaskedTextController();

  @override
  void initState() {
    _value = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      initialValue: value == null ? 0 : value,
    );
    controller.listProducts().then((value) {
      dropdownValue = model;
      value.add(model);
      controller.input.add(value);
    });
    super.initState();
  }

  void onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    if (dropdownValue == model) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Selecione o produto!'),
        ),
      );
      return;
    }
    _formKey.currentState.save();
    dropdownValue.value =
        ((dropdownValue.stock * dropdownValue.value) + (quantidade * value)) /
            (quantidade + dropdownValue.stock);
    dropdownValue.stock = dropdownValue.stock + quantidade;
    repository.update(dropdownValue).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Compra registrada',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            // ignore: prefer_interpolation_to_compose_strings
            "Os valores e estoque deste produtos foram ajustados com sucesso.",
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
      onSuccess();
    }).catchError((error, stackTrace) {
      onError(error);
    });
  }

  void onSuccess() {
    setState(() {
      dropdownValue = model;
      quantity.clear();
      _value = MoneyMaskedTextController(
        leftSymbol: 'R\$ ',
        initialValue: 0,
      );
    });
  }

  void onError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text('Ops, algo deu errado!\n$error'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        left: 1.0,
                        top: 2.0,
                        child: Icon(
                          Icons.point_of_sale,
                          size: 50,
                          color: Colors.black54,
                        ),
                      ),
                      LinearGradientMask(
                        child: Icon(
                          Icons.point_of_sale,
                          size: 50,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Registrar Compra\n de Produto",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              StreamBuilder<List<ProductModel>>(
                  stream: controller.output,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
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
                              items: snapshot.data.reversed
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value.name),
                                );
                              }).toList(),
                              value: dropdownValue,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: TextFormField(
                    controller: quantity,
                    onChanged: (newValue) {
                      quantidade =
                          int.parse(newValue.replaceAll(RegExp('[^0-9]'), ""));
                    },
                    onSaved: (newValue) {
                      quantidade =
                          int.parse(newValue.replaceAll(RegExp('[^0-9]'), ""));
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantidade Comprada',
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                      ),
                      hintText: 'Ex: 2',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      if (int.parse(value) < 1) {
                        return 'Quantidade inválida';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: TextFormField(
                    controller: _value,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.words,
                    onSaved: (newValue) => value = double.parse(
                            newValue.replaceAll(RegExp('[^0-9]'), "")) /
                        100,
                    onChanged: (newValue) => value = double.parse(
                            newValue.replaceAll(RegExp('[^0-9]'), "")) /
                        100,
                    decoration: InputDecoration(
                      labelText: 'Valor unitário',
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
                              .replaceAll(",", ".")) <=
                          0) {
                        return 'Informe o valor unitário';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: onSubmit,
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
                      "REGISTRAR",
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
