import 'package:cesta_basica/app/models/client.model.dart';
import 'package:cesta_basica/app/repositories/client.repository.dart';
import 'package:cesta_basica/app/views/android/client/create.client.view.dart';
import 'package:cesta_basica/app/views/android/client/detail.client.view.dart';
import 'package:flutter/material.dart';
import '../search.client.view.dart';

class ClientListItem extends StatefulWidget {
  final ClientModel model;

  ClientListItem({
    @required this.model,
  });

  @override
  _ClientListItemState createState() => _ClientListItemState();
}

class _ClientListItemState extends State<ClientListItem> {
  final _repository = ClientRepository();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset(
          widget.model.gender == "Masculino"
              ? "assets/images/profilepicture.png"
              : "assets/images/profilepicturefemale.png",
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(widget.model.name),
      subtitle:
          Text("${widget.model.state.substring(0, 2)} - ${widget.model.city}"),
      onTap: () {
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DetailClientView(model: widget.model),
              ),
            )
            .then((value) => setState(() {}));
      },
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.orange,
              ),
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CreateClientView(model: widget.model)))
                    .then((value) => setState(() {}));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
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
                          _repository.delete(widget.model.id);
                          Navigator.of(context).pop();
                          await showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text(
                                'Cliente Removido',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                """
O cliente ${widget.model.name} foi removido com sucesso.""",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
