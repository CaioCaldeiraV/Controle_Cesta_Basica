import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/views/android/basic_masket/create.basicbasket.view.dart';
import 'package:cesta_basica/app/views/android/basic_masket/search.basicbasket.view.dart';
import 'package:flutter/material.dart';

class DrawerCestaBasica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(
        'Cestas Básicas',
        style: TextStyle(fontSize: 17),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.shop_two,
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
              Icons.add_shopping_cart,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Cadastrar Cesta Básica',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateBasicBasketView(
                    model: BasicBasketModel(id: 0),
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
              'Buscar Cesta Básica',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchBasicBasketView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
