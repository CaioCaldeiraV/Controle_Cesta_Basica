import 'package:cesta_basica/app/views/android/report/sales.statement.view.dart';
import 'package:flutter/material.dart';

class DrawerRelatorioExtrato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(
        'Extrato',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.list,
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
              Icons.monetization_on,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Extrato de Vendas',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {},
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
              Icons.money_off,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Extrato de Compras',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {},
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
              Icons.assessment_sharp,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Relatórios Gerais',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SalesStatementView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
