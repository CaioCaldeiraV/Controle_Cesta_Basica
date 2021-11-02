import 'package:cesta_basica/app/views/android/stock/buy.stock.view.dart';
import 'package:cesta_basica/app/views/android/stock/withdrawal.stock.view.dart';
import 'package:flutter/material.dart';

class DrawerEstoque extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(
        'Estoque',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.build_rounded,
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
              Icons.strikethrough_s_outlined,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Retirada de Produtos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WithdrawalStockView(),
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
              Icons.add_business,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Compra de Produtos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BuyStockView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
