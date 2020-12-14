import 'package:cesta_basica/app/controllers/product.controller.dart';
import 'package:cesta_basica/app/models/product.model.dart';
import 'package:cesta_basica/app/views/android/comum_widgets/search.appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'create.product.view.dart';
import 'widgets/product.list.item.widget.dart';

class SearchProductView extends StatefulWidget {
  @override
  _SearchProductViewState createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  final ProductController controller = ProductController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SearchAppbar(
          choose: 1,
          controllerProduct: controller,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.green,
                  Theme.of(context).primaryColor,
                ],
              ),
            ),
            child: Icon(
              Icons.add,
              size: 30,
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => CreateProductView(
                      model: ProductModel(id: 0),
                    ),
                  ),
                )
                .then((value) => setState(() {}));
          },
        ),
      ),
      body: FutureBuilder(
        future: controller.getProducts(),
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
                    itemCount: controller.products.length,
                    itemBuilder: (ctx, i) {
                      return ProductListItem(model: controller.products[i]);
                    },
                  );
                  if (controller.products.isEmpty) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Nenhum Item na Lista",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          "Encotrado",
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
    );
  }
}
