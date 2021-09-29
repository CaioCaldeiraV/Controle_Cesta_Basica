import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:flutter/material.dart';
import 'createproducts.basicbasket.view.dart';

class CreateBasicBasketView extends StatefulWidget {
  final BasicBasketModel model;

  CreateBasicBasketView({this.model});

  @override
  _CreateBasicBasketViewState createState() => _CreateBasicBasketViewState();
}

class _CreateBasicBasketViewState extends State<CreateBasicBasketView> {
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateProductsBasicMasketView(
          model: widget.model,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                text: "Primeira Etapa:",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                text: widget.model.id == 0
                                    ? """
                          Cadastro do nome de identificação da Cesta Básica."""
                                    : """
                          Atualização do nome de identificação da Cesta Básica.""",
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
                    height: 50,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    onSaved: (newValue) => widget.model.name = newValue,
                    initialValue: widget.model?.name,
                    decoration: InputDecoration(
                      labelText: 'Nome da Cesta Básica',
                      icon: Icon(
                        Icons.shopping_basket,
                        size: 30,
                      ),
                      hintText: 'Digite Aqui',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Campo obrigatório';
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
                            Icons.arrow_forward,
                            size: 30,
                            color: Theme.of(context).colorScheme.secondary,
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
