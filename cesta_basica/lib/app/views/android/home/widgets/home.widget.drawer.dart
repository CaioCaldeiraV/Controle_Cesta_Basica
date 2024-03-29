import 'package:cesta_basica/app/views/android/about_us/about.us.view.dart';
import 'package:cesta_basica/app/views/android/home/widgets/drawer.widget.estoque.dart';
import 'package:cesta_basica/app/views/android/home/widgets/drawer.widget.pagamento.dart';
import 'package:cesta_basica/app/views/android/home/widgets/drawer.widget.pedido.dart';
import 'package:flutter/material.dart';
import 'drawer.widget.cestabasica.dart';
import 'drawer.widget.cliente.dart';
import 'drawer.widget.produto.dart';
import 'drawer.widget.relatorio.extrato.dart';
import 'drawer_widget_entrega.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: ShaderMask(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.green,
                    Colors.cyan,
                  ],
                  stops: [
                    0.0,
                    0.7,
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Center(
              child: Text(
                "Cadastros",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DrawerCliente(),
          DrawerProduto(),
          DrawerCestaBasica(),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Center(
              child: Text(
                "Operações",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DrawerPedido(),
          DrawerPagamento(),
          DrawerEntrega(),
          DrawerEstoque(),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Center(
              child: Text(
                "Relatórios",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DrawerRelatorioExtrato(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Center(
              child: Text(
                "Sobre",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(
              left: 20,
            ),
            leading: Icon(
              Icons.info,
              size: 30,
            ),
            title: Text(
              'Sobre nós',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AboutUsView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
