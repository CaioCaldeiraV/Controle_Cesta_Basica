import 'package:cesta_basica/app/views/android/product/create.product.view.dart';
import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/views/android/product/search.product.view.dart';
import 'package:flutter/material.dart';

class DrawerProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Produtos',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.add_to_photos,
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
              'Cadastrar Produto',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateProductView(
                    model: ProductModel(id: 0),
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
              'Buscar Produto',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchProductView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
