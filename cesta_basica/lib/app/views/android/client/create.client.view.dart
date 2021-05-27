import 'package:cesta_basica/app/models/client.model.dart';
import 'package:cesta_basica/app/repositories/client.repository.dart';
import 'package:cesta_basica/app/views/android/client/widgets/client.linear.gradient.mask.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'inputFormatter/cpf.text.input.formatter.dart';
import 'inputFormatter/number.text.input.formatter.dart';

class CreateClientView extends StatefulWidget {
  final ClientModel model;

  CreateClientView({this.model});

  @override
  _CreateClientViewState createState() => _CreateClientViewState();
}

class _CreateClientViewState extends State<CreateClientView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _repository = ClientRepository();
  String dropdownValueGender;
  String dropdownValueState;

  DateTime _selectedDate = DateTime.now();
  final TextEditingController _date = TextEditingController();

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
            'Cliente Cadastrado',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            // ignore: prefer_interpolation_to_compose_strings
            "O cliente " + widget.model.name + ' foi cadastrado com sucesso.',
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
      widget.model.id = 0;
      onError(error);
    });
  }

  void update() {
    _repository.update(widget.model).then((_) async {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Cliente Atualizado',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            // ignore: prefer_interpolation_to_compose_strings
            "O cliente " + widget.model.name + ' foi editado com sucesso.',
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
    Navigator.pop(context);
  }

  void onError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text('Ops, algo deu errado!\n$error'),
      ),
    );
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
        widget.model.dateOfBirth =
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (widget.model.dateOfBirth != null) {
      _date.value = TextEditingValue(text: widget.model.dateOfBirth);
      _selectedDate = DateTime(
          int.parse(widget.model.dateOfBirth.substring(10, 14)),
          int.parse(widget.model.dateOfBirth.substring(5, 7)),
          int.parse(widget.model.dateOfBirth.substring(0, 2)));
    }
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
                        ? "Cadastrar Cliente"
                        : "Editar Cliente",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      endIndent: 20,
                      thickness: 1.3,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    "Dados Pessoais",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 20,
                      thickness: 1.3,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                onSaved: (newValue) => widget.model.name = newValue,
                initialValue: widget.model?.name,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  icon: Icon(
                    Icons.account_box,
                    size: 30,
                  ),
                  hintText: 'Digite o Nome',
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
                onSaved: (newValue) => widget.model.rg = newValue,
                initialValue: widget.model?.rg,
                decoration: InputDecoration(
                  labelText: 'RG',
                  icon: Icon(
                    Icons.account_balance_wallet,
                    size: 30,
                  ),
                  hintText: 'EX',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                onSaved: (newValue) => widget.model.cpf = newValue,
                initialValue: widget.model?.cpf,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfTextInputFormatter(),
                  LengthLimitingTextInputFormatter(14),
                ],
                decoration: InputDecoration(
                  labelText: 'CPF',
                  icon: Icon(
                    Icons.assignment,
                    size: 30,
                  ),
                  hintText: 'Ex: 123.456.789-00',
                ),
                validator: (value) {
                  if (value.isNotEmpty && value.length < 14) {
                    return 'CPF inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                onSaved: (newValue) => widget.model.phone = newValue,
                initialValue: widget.model?.phone,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  NumberTextInputFormatter(),
                  LengthLimitingTextInputFormatter(14),
                ],
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  icon: Icon(
                    Icons.phone,
                    size: 30,
                  ),
                  hintText: 'Ex: (XX)123456789',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (value.length < 13) {
                    return 'Telefone inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: _date,
                    onSaved: (newValue) => widget.model.dateOfBirth = newValue,
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
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
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Sexo',
                  icon: Icon(
                    Icons.dvr,
                    size: 30,
                  ),
                ),
                value: widget.model.gender == null
                    ? dropdownValueGender
                    : widget.model.gender,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValueGender = newValue;
                  });
                },
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                iconEnabledColor: Theme.of(context).primaryColor,
                onSaved: (newValue) => widget.model.gender = newValue,
                validator: (value) {
                  if (value == null) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                items: <String>["Masculino", "Feminino"]
                    .map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      endIndent: 20,
                      thickness: 1.3,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    "Endereço",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 20,
                      thickness: 1.3,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: widget.model.state == null
                    ? dropdownValueState
                    : widget.model.state,
                decoration: InputDecoration(
                  labelText: 'Estado',
                  icon: Icon(
                    Icons.public,
                    size: 30,
                  ),
                ),
                onChanged: (newValue) {
                  setState(() {
                    dropdownValueState = newValue;
                  });
                },
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                iconEnabledColor: Theme.of(context).primaryColor,
                onSaved: (newValue) => widget.model.state = newValue,
                validator: (value) {
                  if (value == null) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                items: <String>[
                  "AC - Acre",
                  "AL - Alagoas",
                  "AP - Amapá",
                  "AM - Amazonas",
                  "BA - Bahia",
                  "CE - Ceará",
                  "ES - Espírito Santo",
                  "GO - Goiás",
                  "MA - Maranhão",
                  "MT - Mato Grosso",
                  "MS - Mato Grosso do Sul",
                  "MG - Minas Gerais",
                  "PA - Pará",
                  "PB - Paraíba",
                  "PR - Paraná",
                  "PE - Pernambuco",
                  "PI - Piauí",
                  "RJ - Rio de Janeiro",
                  "RN - Rio Grande do Norte",
                  "RS - Rio Grande do Sul",
                  "RO - Rondônia",
                  "RR - Roraima",
                  "SC - Santa Catarina",
                  "SP - São Paulo",
                  "SE - Sergipe",
                  "TO - Tocantins",
                  "DF - Distrito Federal"
                ].map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                initialValue: widget.model?.city,
                onSaved: (newValue) => widget.model.city = newValue,
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  icon: Icon(
                    Icons.location_city,
                    size: 30,
                  ),
                  hintText: 'Digite a Cidade',
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
                initialValue: widget.model?.neighborhood,
                onSaved: (newValue) => widget.model.neighborhood = newValue,
                decoration: InputDecoration(
                  labelText: 'Bairro',
                  icon: Icon(
                    Icons.location_searching,
                    size: 30,
                  ),
                  hintText: 'Digite o Bairro',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onSaved: (newValue) => widget.model.street = newValue,
                      initialValue: widget.model?.street,
                      decoration: InputDecoration(
                        labelText: 'Rua',
                        icon: Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                        hintText: 'Digite a Rua',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 120,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: widget.model.number == null
                          ? ""
                          : widget.model.number.toString(),
                      onSaved: (newValue) =>
                          widget.model.number = int.parse(newValue),
                      decoration: InputDecoration(
                        labelText: 'Número',
                        icon: Icon(
                          Icons.confirmation_number,
                          size: 30,
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
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
