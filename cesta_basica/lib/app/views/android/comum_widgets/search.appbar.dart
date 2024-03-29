import 'package:cesta_basica/app/controllers/basicbasket/basicbasket.controller.dart';
import 'package:cesta_basica/app/controllers/client/client.controller.dart';
import 'package:cesta_basica/app/controllers/product/product.controller.dart';
import 'package:cesta_basica/app/controllers/request/request.search.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchAppbar extends StatelessWidget {
  final int choose;
  final ClientController controllerClient;
  final ProductController controllerProduct;
  final BasicBasketController controllerBasicBasket;
  final SearchRequestController controllerRequest;
  const SearchAppbar({
    Key key,
    this.choose,
    this.controllerClient,
    this.controllerProduct,
    this.controllerBasicBasket,
    this.controllerRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.green,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      leading: Observer(builder: (_) {
        if (choose == 0) {
          return !controllerClient.showSearch
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : Container();
        } else if (choose == 1) {
          return !controllerProduct.showSearch
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : Container();
        } else if (choose == 2) {
          return !controllerBasicBasket.showSearch
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : Container();
        } else {
          return !controllerRequest.showSearch
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : Container();
        }
      }),
      centerTitle: true,
      title: Observer(builder: (_) {
        if (choose == 0) {
          return controllerClient.showSearch
              ? TextField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Pesquisar Clientes',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onChanged: controllerClient.search,
                )
              : Text(
                  'Clientes',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
        } else if (choose == 1) {
          return controllerProduct.showSearch
              ? TextField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Pesquisar Produtos',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onChanged: controllerProduct.search,
                )
              : Text(
                  'Produtos',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
        } else if (choose == 2) {
          return controllerBasicBasket.showSearch
              ? TextField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Pesquisar Cestas Básicas',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onChanged: controllerBasicBasket.search,
                )
              : Text(
                  'Cestas Básicas',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
        } else {
          return controllerRequest.showSearch
              ? TextField(
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    labelText: 'Pesquisar pedido por nome do cliente',
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onChanged: controllerRequest.search,
                )
              : Text(
                  'Pedidos',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
        }
      }),
      actions: <Widget>[
        Observer(builder: (_) {
          if (choose == 0) {
            return IconButton(
              icon: Icon(
                controllerClient.showSearch ? Icons.close : Icons.search,
              ),
              onPressed: () {
                if (controllerClient.showSearch) controllerClient.search("");
                controllerClient.toggleSearch();
              },
            );
          } else if (choose == 1) {
            return IconButton(
              icon: Icon(
                controllerProduct.showSearch ? Icons.close : Icons.search,
              ),
              onPressed: () {
                if (controllerProduct.showSearch) {
                  controllerProduct.search("");
                }
                controllerProduct.toggleSearch();
              },
            );
          } else if (choose == 2) {
            return IconButton(
              icon: Icon(
                controllerBasicBasket.showSearch ? Icons.close : Icons.search,
              ),
              onPressed: () {
                if (controllerBasicBasket.showSearch) {
                  controllerBasicBasket.search("");
                }
                controllerBasicBasket.toggleSearch();
              },
            );
          } else {
            return IconButton(
              icon: Icon(
                controllerRequest.showSearch ? Icons.close : Icons.search,
              ),
              onPressed: () {
                if (controllerRequest.showSearch) {
                  controllerRequest.search("");
                }
                controllerRequest.toggleSearch();
              },
            );
          }
        }),
      ],
    );
  }
}
