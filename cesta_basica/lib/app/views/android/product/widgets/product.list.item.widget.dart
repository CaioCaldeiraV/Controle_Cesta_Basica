import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../create.product.view.dart';
import '../detail.product.view.dart';
import '../search.product.view.dart';

class ProductListItem extends StatefulWidget {
  final ProductModel model;

  ProductListItem({
    @required this.model,
  });

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  final _repository = ProductRepository();
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(
          "assets/images/bag.png",
        ),
      ),
      title: Text("${widget.model.name} - ${widget.model.brand}"),
      subtitle: Text("""
Estoque: ${widget.model.stock}\nPreço: R\$ ${formatCurrency.format(widget.model.value).substring(1)}"""),
      onTap: () {
        Navigator.of(context)
            .push(
              MaterialPageRoute(
                builder: (context) => DetailProductView(model: widget.model),
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
                                CreateProductView(model: widget.model)))
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
                      'Excluir Produto',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.red,
                    content: Text(
                      """
Você tem certeza que deseja deletar:\nProduto: ${widget.model.name}\nMarca: ${widget.model.brand}?""",
                      style: TextStyle(
                        color: Colors.white,
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
                                'Produto Removido',
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: Text(
                                """
O produto ${widget.model.name} foi removido com sucesso.""",
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
                                  builder: (context) => SearchProductView()));
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
