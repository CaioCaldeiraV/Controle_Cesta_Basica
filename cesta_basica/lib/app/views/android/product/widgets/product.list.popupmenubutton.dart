import 'package:flutter/material.dart';

class ProductListPopUpMenuButton {
  final Text title;
  final Icon icon;

  const ProductListPopUpMenuButton({this.title, this.icon});

  static const String delete = "Editar Produto";
  static const String update = "Remover Produto";
  static const String getout = "Sair";

  static const List<ProductListPopUpMenuButton> choices =
      <ProductListPopUpMenuButton>[
    ProductListPopUpMenuButton(
        title: Text(
          delete,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.edit,
          color: Colors.cyan,
        )),
    ProductListPopUpMenuButton(
        title: Text(
          update,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.delete,
          color: Colors.cyan,
        )),
    ProductListPopUpMenuButton(
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
