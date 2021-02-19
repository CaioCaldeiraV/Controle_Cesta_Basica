import 'package:cesta_basica/app/controllers/request.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RequestBasicBasketSearchAppBar extends StatelessWidget {
  final RequestController controller;
  final TextEditingController textController;

  const RequestBasicBasketSearchAppBar(
      {Key key, this.controller, this.textController})
      : super(key: key);

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
                controller: textController,
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
                  labelText: 'Pesquisar Cestas Básicas',
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                onChanged: controller.search,
              )
            : Text(
                'Cestas Básicas',
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
              if (controller.showSearch) controller.getRequestBasicBasket();
              controller.toggleSearch();
            },
          ),
        ),
      ],
    );
  }
}
