import 'package:cesta_basica/app/models/client.model.dart';
import 'package:cesta_basica/app/repositories/client.repository.dart';
import 'package:cesta_basica/app/views/android/client/widgets/client.card.detail.widget.dart';
import 'package:cesta_basica/app/views/android/client/widgets/client.card.prefer.widget.dart';
import 'package:cesta_basica/app/views/android/client/widgets/client.list.popupmenubutton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'create.client.view.dart';
import 'search.client.view.dart';

class DetailClientView extends StatefulWidget {
  final ClientModel model;
  final _repository = ClientRepository();

  DetailClientView({this.model});

  @override
  _DetailClientViewState createState() => _DetailClientViewState();
}

class _DetailClientViewState extends State<DetailClientView> {
  int _currentIndex;

  Color getColor(int index) {
    if (index == _currentIndex) {
      if (_currentIndex == 0) {
        return Colors.blueGrey;
      } else if (_currentIndex == 1) {
        return Colors.yellow;
      } else {
        return Colors.red;
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

  void _choiceAction(ClientListPopUpMenuButton choice, BuildContext context) {
    if (choice.title.data == "Iniciar Venda") {
    } else if (choice.title.data == "Histórico de Transações") {
    } else if (choice.title.data == "Verificação de Inadimplência") {
    } else if (choice.title.data == "Listar dívidas") {
    } else if (choice.title.data == "Editar Cliente") {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateClientView(model: widget.model)))
          .then((value) => setState(() {}));
      ;
    } else if (choice.title.data == "Remover Cliente") {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Excluir Cliente',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
          content: Text(
            """
Você tem certeza que deseja deletar o cliente: ${widget.model.name}?""",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
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
                  color: Theme.of(context).colorScheme.secondary,
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
                      'Cliente Removido',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      """
O cliente ${widget.model.name} foi removido com sucesso.""",
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
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchClientView()));
              },
              child: Text(
                'Sim',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
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
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        actions: [
          PopupMenuButton(
            color: Theme.of(context).colorScheme.secondary,
            itemBuilder: (context) {
              return ClientListPopUpMenuButton.choices.map((choice) {
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
            colors: <Color>[Colors.green, Theme.of(context).primaryColor],
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      widget.model.gender == "Masculino"
                          ? "assets/images/profilepicture.png"
                          : "assets/images/profilepicturefemale.png",
                      color: Theme.of(context).colorScheme.secondary,
                      scale: widget.model.gender == "Masculino" ? 9 : 11.1,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${widget.model.name.split(" ")[0]}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 25,
                    ),
                  ),
                ],
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
                          height: 290,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              ClientCardDetailWidget(
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
                                  SizedBox(width: 9),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: getColor(2),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 0,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/client.png',
                                scale: 14,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 2,
                          child: Text(
                            "Provém de pngtree.com",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 6),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(children: [
                        Container(
                          height: 290,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              ClientCardPreferWidget(),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 0,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/basicmasket.png',
                                scale: 2.7,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 90,
                          child: Text(
                            "Provém de pngtree.com",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 6),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      size: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () async {
                      if (await canLaunch("tel: ${widget.model.phone}")) {
                        launch("tel: ${widget.model.phone}");
                      } else {
                        await showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              'Erro',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              """
Não foi possível localizar o aplicativo para ligações ou número inválido.""",
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
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.message,
                      size: 30,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () async {
                      if (await canLaunch("sms: ${widget.model.phone}")) {
                        launch("sms: ${widget.model.phone}");
                      } else {
                        await showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              'Erro',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              """
Não foi possível localizar o aplicativo de mensagens ou número inválido.""",
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
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/wpp.png',
                        color: Theme.of(context).colorScheme.secondary),
                    onPressed: () async {
                      if (await canLaunch(
                          "https://wa.me/55${widget.model.phone.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '')}")) {
                        launch(
                            "https://wa.me/55${widget.model.phone.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '')}");
                      } else {
                        await showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              'Erro',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: Text(
                              """
Não foi possível localizaar o whatsapp ou o número do cliente é inválido.""",
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
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
