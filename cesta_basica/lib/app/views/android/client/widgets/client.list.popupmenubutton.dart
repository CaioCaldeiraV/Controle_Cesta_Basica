import 'package:flutter/material.dart';

class ClientListPopUpMenuButton {
  final Text title;
  final Icon icon;

  const ClientListPopUpMenuButton({this.title, this.icon});

  static const String sale = "Iniciar Venda";
  static const String historic = "Histórico de Transações";
  static const String check = "Verificação de Inadimplência";
  static const String debts = "Listar dívidas";
  static const String delete = "Editar Cliente";
  static const String update = "Remover Cliente";
  static const String getout = "Sair";

  static const List<ClientListPopUpMenuButton> choices =
      <ClientListPopUpMenuButton>[
    ClientListPopUpMenuButton(
        title: Text(sale, style: TextStyle(color: Colors.cyan)),
        icon: Icon(
          Icons.add_shopping_cart,
          color: Colors.cyan,
        )),
    ClientListPopUpMenuButton(
        title: Text(
          historic,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.history,
          color: Colors.cyan,
        )),
    ClientListPopUpMenuButton(
        title: Text(
          check,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.warning,
          color: Colors.cyan,
        )),
    ClientListPopUpMenuButton(
        title: Text(
          debts,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.money_off,
          color: Colors.cyan,
        )),
    ClientListPopUpMenuButton(
        title: Text(
          delete,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.edit,
          color: Colors.cyan,
        )),
    ClientListPopUpMenuButton(
        title: Text(
          update,
          style: TextStyle(color: Colors.cyan),
        ),
        icon: Icon(
          Icons.delete,
          color: Colors.cyan,
        )),
    ClientListPopUpMenuButton(
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
