import 'package:cesta_basica/app/controllers/basicbasket/basicbasketproduct.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'widgets/basicbasketproduct.search.appbar.dart';
import 'widgets/listbag.widget.dart';

class SearchCreateListBagView extends StatefulWidget {
  final BasicBasketProductController controller;

  const SearchCreateListBagView({Key key, this.controller}) : super(key: key);

  @override
  _SearchCreateListBagViewState createState() =>
      _SearchCreateListBagViewState();
}

class _SearchCreateListBagViewState extends State<SearchCreateListBagView> {
  final formatCurrency = NumberFormat.simpleCurrency();
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: BasicBasketProductSearchAppBar(
          controller: widget.controller,
          textController: textController,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: textController.text.isEmpty
                ? widget.controller.getBasicBasketProducts()
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
                            widget.controller.basicBasketsProductsAux.length,
                        itemBuilder: (ctx, i) {
                          return ListBagWidget(
                              model:
                                  widget.controller.basicBasketsProductsAux[i]);
                        },
                      );
                      if (widget.controller.basicBasketsProductsAux.isEmpty) {
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
                  "Custo Total: R\$ ${formatCurrency.format(widget.controller.totalCust).substring(1)}",
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
