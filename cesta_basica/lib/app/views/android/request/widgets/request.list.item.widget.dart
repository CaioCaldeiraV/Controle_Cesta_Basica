import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/repositories/request.repository.dart';
import 'package:flutter/material.dart';

import '../create.request.view.dart';
import '../search.request.view.dart';

class RequestListItem extends StatefulWidget {
  final RequestModel model;
  final String clientName;

  const RequestListItem({Key key, this.model, this.clientName})
      : super(key: key);

  @override
  _RequestListItemState createState() => _RequestListItemState();
}

class _RequestListItemState extends State<RequestListItem> {
  final _repository = RequestRepository();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset(
          "assets/images/profilepicture.png",
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text("${widget.clientName} E OQ MALUCO"),
      subtitle: Text("${widget.model.status}"),
      onTap: () {},
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
                                CreateRequestView(model: widget.model)))
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
                      'Excluir Pedido',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    content: Text(
                      """
Você tem certeza que deseja deletar o pedido do: ${widget.clientName}?""",
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
                          Navigator.of(context).pop();
                          await showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text(
                                'Pedido Removido',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                """
O pedido do cliente "${widget.clientName}" foi removido com sucesso.""",
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchRequestView()));
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
