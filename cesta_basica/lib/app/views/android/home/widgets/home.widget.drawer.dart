import 'package:flutter/material.dart';
import 'drawer.widget.cestabasica.dart';
import 'drawer.widget.cliente.dart';
import 'drawer.widget.product.dart';

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
          DrawerCliente(),
          DrawerProduct(),
          DrawerCestaBasica(),
        ],
      ),
    );
  }
}
