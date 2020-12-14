import 'package:cesta_basica/app/models/client.model.dart';
import 'package:cesta_basica/app/views/android/client/create.client.view.dart';
import 'package:cesta_basica/app/views/android/client/search.client.view.dart';
import 'package:flutter/material.dart';

class DrawerCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Clientes',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.people,
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
              Icons.group_add,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Cadastrar Cliente',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateClientView(
                    model: ClientModel(id: 0),
                  ),
                ),
              );
            },
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
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Buscar Cliente',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchClientView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
