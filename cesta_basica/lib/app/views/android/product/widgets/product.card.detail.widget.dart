import 'package:cesta_basica/app/models/product.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCardDetailWidget extends StatelessWidget {
  final ProductModel model;
  final ValueChanged<int> onChanged;

  ProductCardDetailWidget({Key key, this.model, this.onChanged})
      : super(key: key);

  final formatCurrency = NumberFormat.simpleCurrency();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460,
      width: MediaQuery.of(context).size.width * 0.9,
      child: PageView(
        onPageChanged: onChanged,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(-2.0, 4.0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Informações",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                        ),
                        Icon(
                          Icons.info,
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(children: [
                  Container(
                    height: 400,
                    padding: EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        Text(
                          "Produto: ${model.name}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          "Marca: ${model.brand}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          "Estoque: ${model.stock}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          """
Preço: R\$ ${formatCurrency.format(model.value).substring(1)}""",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 7,
                    child: Image.asset(
                      'assets/images/shopping_car.png',
                      scale: 12,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 68,
                    child: Text(
                      "Provém de pngtree.com",
                      style: TextStyle(color: Colors.cyan, fontSize: 6),
                    ),
                  ),
                ])
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(-2.0, 4.0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width * 0.9) - 70,
                          child: Text(
                            "Cestas Básicas que partilham deste produto",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.shop_two,
                          color: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
