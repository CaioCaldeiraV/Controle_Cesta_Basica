import 'package:flutter/material.dart';

class BasicBasketListPopUpMenu {
  final Text title;
  final Icon icon;

  const BasicBasketListPopUpMenu({this.title, this.icon});

  static const String delete = "Remover Cesta Básica";
  static const String update = "Editar Cesta Básica";
  static const String getout = "Sair";

  static const List<BasicBasketListPopUpMenu> choices =
      <BasicBasketListPopUpMenu>[
    BasicBasketListPopUpMenu(
        title: Text(
          update,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.edit,
          color: Colors.cyan,
        )),
    BasicBasketListPopUpMenu(
        title: Text(
          delete,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.delete,
          color: Colors.cyan,
        )),
    BasicBasketListPopUpMenu(
        title: Text(
          getout,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.power_settings_new,
          color: Colors.cyan,
        )),
  ];
}
