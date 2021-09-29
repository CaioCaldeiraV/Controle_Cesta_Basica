import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/views/android/request/create.request.view.dart';
import 'package:cesta_basica/app/views/android/request/search.request.view.dart';
import 'package:flutter/material.dart';

class DrawerPedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(
        'Pedidos',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.unarchive_outlined,
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
              Icons.add_box,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Realizar Pedido',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateRequestView(
                    model: RequestModel(id: 0),
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
              'Visualizar Pedidos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchRequestView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
