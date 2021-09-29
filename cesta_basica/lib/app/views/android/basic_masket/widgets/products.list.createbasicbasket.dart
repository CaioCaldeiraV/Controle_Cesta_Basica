import 'package:cesta_basica/app/controllers/basicbasket/basicbasketproduct.controller.dart';
import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/models/basicbasketproduct.model.dart';
import 'package:cesta_basica/app/models/product.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class ProductListItemCreateBasicBasket extends StatelessWidget {
  final ProductModel modelProduct;
  final BasicBasketModel modelBasicBasket;
  final BasicBasketProductController controllerBasicBasketProduct;

  const ProductListItemCreateBasicBasket({
    Key key,
    this.modelProduct,
    this.modelBasicBasket,
    this.controllerBasicBasketProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();
    var modelBasicBasketProduct = BasicBasketProductModel();
    var index = controllerBasicBasketProduct.rewriteAmount(modelProduct.id);
    if (index >= 0) {
      modelBasicBasketProduct =
          controllerBasicBasketProduct.basicBasketsProducts[index];
    } else {
      modelBasicBasketProduct.basicbasketsId = 0;
      modelBasicBasketProduct.productsId = modelProduct.id;
      modelBasicBasketProduct.amount = 0;
    }
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(
          "assets/images/bag.png",
        ),
      ),
      title: Text("${modelProduct.name} - ${modelProduct.brand}"),
      subtitle: Text("""
Estoque: ${modelProduct.stock}\nPreço: R\$ ${formatCurrency.format(modelProduct.value).substring(1)}"""),
      trailing: Container(
        width: 102,
        height: 36,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 7,
              offset: Offset(-2.0, 4.0),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 36,
              height: 36,
              color: Colors.red,
              child: IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 18,
                ),
                onPressed: () {
                  controllerBasicBasketProduct
                      .decreaseBasicBasketProduct(modelBasicBasketProduct);
                },
              ),
            ),
            Container(
              width: 30,
              height: 30,
              color: Colors.white,
              child: Center(
                child: Observer(builder: (_) {
                  return Text(
                    controllerBasicBasketProduct.basicBasketsProducts
                            .contains(modelBasicBasketProduct)
                        ? controllerBasicBasketProduct
                            .basicBasketsProducts[controllerBasicBasketProduct
                                .basicBasketsProducts
                                .indexOf(modelBasicBasketProduct)]
                            .amount
                            .toString()
                        : "0",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
              ),
            ),
            Container(
              width: 36,
              height: 36,
              color: Colors.blue,
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 18,
                ),
                onPressed: () {
                  controllerBasicBasketProduct
                      .incrementBasicBasketProduct(modelBasicBasketProduct);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
