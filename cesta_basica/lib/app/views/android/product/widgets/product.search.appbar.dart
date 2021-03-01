import 'package:cesta_basica/app/controllers/product/product.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductSearchAppbar extends StatelessWidget {
  final ProductController controller;

  ProductSearchAppbar({
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.green,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      leading: Observer(
        builder: (_) => !controller.showSearch
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : Container(),
      ),
      centerTitle: true,
      title: Observer(
        builder: (_) => controller.showSearch
            ? TextField(
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).accentColor,
                  ),
                  labelText: 'Pesquisar Produtos',
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                onChanged: controller.search,
              )
            : Text(
                'Produtos',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
              ),
      ),
      actions: <Widget>[
        Observer(
          builder: (_) => IconButton(
            icon: Icon(
              controller.showSearch ? Icons.close : Icons.search,
            ),
            onPressed: () {
              if (controller.showSearch) controller.getProducts();
              controller.toggleSearch();
            },
          ),
        ),
      ],
    );
  }
}
