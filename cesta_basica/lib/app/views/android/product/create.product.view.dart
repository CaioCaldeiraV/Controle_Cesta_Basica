import 'dart:io';
import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';
import 'package:cesta_basica/app/views/android/client/widgets/client.linear.gradient.mask.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductView extends StatefulWidget {
  final ProductModel model;

  CreateProductView({this.model});

  @override
  _CreateProductViewState createState() => _CreateProductViewState();
}

class _CreateProductViewState extends State<CreateProductView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _repository = ProductRepository();
  final imagePicker = ImagePicker();
  File file;

  void imageSelect() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        widget.model.image = image.path;
        file = File(image.path);
      });
    }
  }

  void onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.model.id == 0) {
      create();
    } else {
      update();
    }
  }

  void create() {
    widget.model.id = null;
    _repository.create(widget.model).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Produto Cadastrado',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            """
Produto: ${widget.model.name}\nMarca: ${widget.model.brand}\nEste produto foi cadastrado com sucesso""",
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
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
      onSuccess();
    }).catchError((_) {
      onError();
    });
  }

  void update() {
    _repository.update(widget.model).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Produto Atualizado',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            """
Produto: ${widget.model.name}\nMarca: ${widget.model.brand}\nEste produto foi editado com sucesso""",
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
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
      onSuccess();
    }).catchError((_) {
      onError();
    });
  }

  void onSuccess() {
    Navigator.pop(context);
  }

  void onError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ops, algo deu errado!'),
      ),
    );
  }

  @override
  void initState() {
    if (widget.model.id != 0 && widget.model.image != null) {
      file = File(widget.model.image);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _value = MoneyMaskedTextController(
      leftSymbol: 'R\$ ',
      initialValue: widget.model.value == null ? 0 : widget.model.value,
    );

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Positioned(
                        left: 1.0,
                        top: 2.0,
                        child: Icon(
                          widget.model.id == 0 ? Icons.add_box : Icons.edit,
                          size: 60,
                          color: Colors.black54,
                        ),
                      ),
                      LinearGradientMask(
                        child: Icon(
                          widget.model.id == 0 ? Icons.add_box : Icons.edit,
                          size: 60,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Text(
                    widget.model.id == 0
                        ? "Cadastrar Produto"
                        : "Editar Produto",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.width / 2 + 5,
                width: MediaQuery.of(context).size.width / 2 + 5,
                child: CircleAvatar(
                  backgroundColor: file == null
                      ? Colors.transparent
                      : Theme.of(context).primaryColor.withOpacity(0.4),
                  child: Container(
                    height: MediaQuery.of(context).size.width / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    child: GestureDetector(
                      onTap: () async {
                        if (widget.model.image == null) {
                          imageSelect();
                        } else {
                          var addPhoto = false;
                          await showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    addPhoto = false;
                                    setState(() {
                                      widget.model.image = null;
                                      file = null;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.red)),
                                  child: Text(
                                    'Remover Foto',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    addPhoto = true;
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context).primaryColor),
                                  ),
                                  child: Text(
                                    'Modificar Foto',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                          if (addPhoto) {
                            imageSelect();
                          }
                        }
                      },
                      child: widget.model.image == null
                          ? CircleAvatar(
                              backgroundColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                              child: Center(
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: Image.file(file).image,
                              onBackgroundImageError: (object, stackTrace) {
                                setState(() {
                                  widget.model.image = null;
                                });
                              },
                              child: Center(
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                onSaved: (newValue) => widget.model.name = newValue,
                initialValue: widget.model?.name,
                decoration: InputDecoration(
                  labelText: 'Produto',
                  icon: Icon(
                    Icons.shop,
                    size: 30,
                  ),
                  hintText: 'Digite o Nome do Produto',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _value,
                keyboardType: TextInputType.number,
                textCapitalization: TextCapitalization.words,
                onSaved: (newValue) => widget.model.value =
                    double.parse(newValue.replaceAll(RegExp('[^0-9]'), "")) /
                        100,
                onChanged: (newValue) => widget.model.value =
                    double.parse(newValue.replaceAll(RegExp('[^0-9]'), "")) /
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
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.number,
                onSaved: (newValue) => widget.model.stock = int.parse(newValue),
                initialValue: widget.model.stock == null
                    ? ""
                    : widget.model.stock.toString(),
                decoration: InputDecoration(
                  labelText: 'Estoque',
                  icon: Icon(
                    Icons.confirmation_number,
                    size: 30,
                  ),
                  hintText: 'Digite a Quantidade de Estoque Inicial',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                onSaved: (newValue) => widget.model.brand = newValue,
                initialValue: widget.model?.brand,
                decoration: InputDecoration(
                  labelText: 'Marca',
                  icon: Icon(
                    Icons.branding_watermark,
                    size: 30,
                  ),
                  hintText: 'Digite a Marca do Produto',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 60),
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
                      widget.model.id == 0 ? "CADASTRAR" : "ATUALIZAR",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
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
