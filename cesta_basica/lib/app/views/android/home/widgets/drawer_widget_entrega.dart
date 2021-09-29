import 'package:cesta_basica/app/views/android/delivery/register.delivery.view.dart';
import 'package:flutter/material.dart';

class DrawerEntrega extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(
        'Entregas',
        style: TextStyle(fontSize: 17),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.car_rental,
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
              Icons.note_add,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Registrar Entrega',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterDeliveryView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
