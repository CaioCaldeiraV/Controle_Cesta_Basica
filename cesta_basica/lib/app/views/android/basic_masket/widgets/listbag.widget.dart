import 'package:cesta_basica/app/models/basicbasketproduct.model.dart';
import 'package:cesta_basica/app/repositories/product.repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListBagWidget extends StatelessWidget {
  final BasicBasketProductModel model;
  final ProductRepository repository = ProductRepository();
  ListBagWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(
          "assets/images/bag.png",
        ),
      ),
      title: FutureBuilder(
          future: repository.getProductNameBrand(model.productsId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) return Text(snapshot.data);
              if (snapshot.hasError) {
                return Text("Aconteceu algo de inesperado");
              }
            } else {
              return Center(
                child: ShaderMask(
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                    ),
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
              );
            }
            return Container();
          }),
      subtitle: FutureBuilder(
          future: repository.getProductValue(model.productsId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Text("""
Preço unitário: R\$ ${formatCurrency.format(snapshot.data).substring(1)}""");
              }
              if (snapshot.hasError) {
                return Text("Aconteceu algo de inesperado");
              }
            } else {
              return Center(
                child: ShaderMask(
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                    ),
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
              );
            }
            return Container();
          }),
      trailing: RichText(
        text: TextSpan(
            text: "Quantidade: ",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "${model.amount}",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ]),
      ),
    );
  }
}
