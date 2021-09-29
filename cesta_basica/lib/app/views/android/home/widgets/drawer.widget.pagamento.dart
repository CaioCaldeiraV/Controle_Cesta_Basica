import 'package:cesta_basica/app/views/android/payment/payment.registrar.view.dart';
import 'package:cesta_basica/app/views/android/payment/search.payment.view.dart';
import 'package:flutter/material.dart';

class DrawerPagamento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      title: Text(
        'Pagamentos',
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      leading: Icon(
        Icons.monetization_on,
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
              Icons.receipt,
              color: Colors.black,
              size: 25,
            ),
            title: Text(
              'Registrar Pagamento',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentRegistrarView(),
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
              'Buscar parcelas',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentSearchView(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
