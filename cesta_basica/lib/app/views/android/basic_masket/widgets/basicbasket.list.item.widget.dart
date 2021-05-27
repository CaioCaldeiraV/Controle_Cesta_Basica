import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/repositories/basicbasket.repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../create.basicbasket.view.dart';
import '../detail.basicbasket.view.dart';
import '../search.basicbasket.view.dart';

class BasicBasketListItem extends StatefulWidget {
  final BasicBasketModel model;
  const BasicBasketListItem({Key key, this.model}) : super(key: key);

  @override
  _BasicBasketListItemState createState() => _BasicBasketListItemState();
}

class _BasicBasketListItemState extends State<BasicBasketListItem> {
  final _repository = BasicBasketRepository();
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: Image.asset(
          "assets/images/shopping_car.png",
        ),
      ),
      title: Text(
        widget.model.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        """
Valor: R\$ ${formatCurrency.format(widget.model.value).substring(1)}""",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailBasicBasketView(
              model: widget.model,
            ),
          ),
        );
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
                                CreateBasicBasketView(model: widget.model)))
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
                      'Excluir Cesta Básica',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    content: Text(
                      """
Você tem certeza que deseja deletar a cesta básica: '${widget.model.name}'?""",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
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
                            color: Theme.of(context).accentColor,
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
                                'Cesta Básica Removido',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                """
A cesta básica '${widget.model.name}' foi removida com sucesso.""",
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SearchBasicBasketView()));
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
