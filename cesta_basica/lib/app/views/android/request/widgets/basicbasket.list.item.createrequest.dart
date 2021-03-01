import 'package:cesta_basica/app/controllers/request/request.controller.dart';
import 'package:cesta_basica/app/models/basicbasket.model.dart';
import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/models/requestbasicbasket.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class BasicBasketListItemCreateRequest extends StatefulWidget {
  final BasicBasketModel modelBasicBasket;
  final RequestController controllerRequest;
  final RequestModel modelRequest;

  const BasicBasketListItemCreateRequest(
      {Key key,
      this.modelBasicBasket,
      this.controllerRequest,
      this.modelRequest})
      : super(key: key);

  @override
  _BasicBasketListItemCreateRequestState createState() =>
      _BasicBasketListItemCreateRequestState();
}

class _BasicBasketListItemCreateRequestState
    extends State<BasicBasketListItemCreateRequest> {
  final formatCurrency = NumberFormat.simpleCurrency();
  RequestBasicBasketModel modelRequestBasicBasket = RequestBasicBasketModel();

  @override
  void initState() {
    var index =
        await widget.controllerRequest.rewriteAmount(widget.modelRequest.id);
    if (index >= 0) {
      modelRequestBasicBasket =
          widget.controllerRequest.requestBasicBaskets[index];
    } else {
      modelRequestBasicBasket.requestId = 0;
      modelRequestBasicBasket.basicbasketsId = widget.modelBasicBasket.id;
      modelRequestBasicBasket.amount = 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset(
          "assets/images/bag.png",
        ),
      ),
      title: Text("${widget.modelBasicBasket.name}"),
      subtitle: Text("""
Valor: R\$ ${formatCurrency.format(widget.modelBasicBasket.value).substring(1)}"""),
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
                  color: Theme.of(context).accentColor,
                  size: 18,
                ),
                onPressed: () {
                  widget.controllerRequest
                      .decreaseRequestBasicBasket(modelRequestBasicBasket);
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
                    widget.controllerRequest.requestBasicBaskets
                            .contains(modelRequestBasicBasket)
                        ? widget
                            .controllerRequest
                            .requestBasicBaskets[widget
                                .controllerRequest.requestBasicBaskets
                                .indexOf(modelRequestBasicBasket)]
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
                  color: Theme.of(context).accentColor,
                  size: 18,
                ),
                onPressed: () {
                  widget.controllerRequest
                      .incrementRequestBasicBasket(modelRequestBasicBasket);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
