import 'package:cesta_basica/app/controllers/request/request.controller.dart';
import 'package:cesta_basica/app/views/android/request/widgets/create.listbag.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import 'widgets/requestbasicbasket.searchappbar.widget.dart';

class ListBagView extends StatefulWidget {
  final RequestController controller;

  const ListBagView({Key key, this.controller}) : super(key: key);

  @override
  _ListBagViewState createState() => _ListBagViewState();
}

class _ListBagViewState extends State<ListBagView> {
  final formatCurrency = NumberFormat.simpleCurrency();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: RequestBasicBasketSearchAppBar(
          controller: widget.controller,
          textController: textController,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: textController.text.isEmpty
                ? widget.controller.getRequestBasicBasket()
                : widget.controller.search(textController.text),
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
                  return Observer(
                    builder: (_) {
                      var listView = ListView.builder(
                        itemCount:
                            widget.controller.requestBasicBasketsAux.length,
                        itemBuilder: (ctx, i) {
                          return ListBagWidget(
                              model:
                                  widget.controller.requestBasicBasketsAux[i]);
                        },
                      );
                      if (widget.controller.requestBasicBasketsAux.isEmpty) {
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Nenhum item",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(
                              "na lista.",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ));
                      } else {
                        return listView;
                      }
                    },
                  );
                }
              } else {
                return Center(
                  child: ShaderMask(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
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
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.green,
                    Theme.of(context).primaryColor,
                  ],
                  stops: [0.0, 0.8],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5,
                    offset: Offset(-2.0, -2.0),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  // ignore: lines_longer_than_80_chars
                  "Valor Total: R\$ ${formatCurrency.format(widget.controller.totalValue).substring(1)}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
