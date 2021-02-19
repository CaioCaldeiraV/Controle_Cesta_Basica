import 'package:flutter/material.dart';

class DrawerEstoque extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Estoque',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.build_rounded,
        size: 30,
      ),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.cyan[100],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.only(
              left: 35,
            ),
            leading: Icon(
              Icons.low_priority,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Listar Estoque',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {},
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.cyan[100],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.only(
              left: 35,
            ),
            leading: Icon(
              Icons.add_business,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Compras de Produtos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
