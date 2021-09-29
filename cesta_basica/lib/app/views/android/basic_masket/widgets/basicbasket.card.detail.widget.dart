import 'package:cesta_basica/app/controllers/basicbasket/basicbasket.detail.controller.dart';
import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicBasketCardDetailWidget extends StatelessWidget {
  final BasicBasketModel model;
  final ValueChanged<int> onChanged;
  BasicBasketCardDetailWidget({Key key, this.model, this.onChanged})
      : super(key: key);

  final formatCurrency = NumberFormat.simpleCurrency();
  final controller = BasicBasketDetailController();

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
                    color: Colors.blue,
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
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        Icon(
                          Icons.info,
                          color: Theme.of(context).colorScheme.secondary,
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
                          "Cesta Básica: ${model.name}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
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
                            "Produtos que compõem a Cesta Básica",
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
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  padding: EdgeInsets.all(20),
                  child: FutureBuilder(
                    future: controller.carregaListProducts(model.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Aconteceu Algo de ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                "Inesperado",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ));
                        } else {
                          if (controller.listProducts.isEmpty) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Não há nenhum produto cadastrado",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Text(
                                  "nesta Cesta Básica",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ));
                          } else {
                            return SingleChildScrollView(
                              child: DataTable(
                                columns: [
                                  DataColumn(
                                    label: Text("Produto"),
                                  ),
                                  DataColumn(
                                    label: Text("Marca"),
                                  ),
                                  DataColumn(
                                    label: Text("Quantidade"),
                                    numeric: true,
                                  ),
                                ],
                                rows: [
                                  for (int i = 0;
                                      i < controller.listProducts.length;
                                      i++)
                                    DataRow(
                                      cells: [
                                        DataCell(
                                          Text("""
${controller.listProducts[i].name}"""),
                                        ),
                                        DataCell(
                                          Text(
                                              // ignore: lines_longer_than_80_chars
                                              "${controller.listProducts[i].brand}"),
                                        ),
                                        DataCell(
                                          Text("${controller.amount[i]}"),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            );
                          }
                        }
                      } else {
                        return Center(
                          child: ShaderMask(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor),
                            ),
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.green,
                                  Theme.of(context).primaryColor,
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
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
