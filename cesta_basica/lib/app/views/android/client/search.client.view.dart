import 'package:cesta_basica/app/controllers/client/client.controller.dart';
import 'package:cesta_basica/app/models/client.model.dart';
import 'package:cesta_basica/app/views/android/client/widgets/client.list.item.widget.dart';
import 'package:cesta_basica/app/views/android/comum_widgets/search.appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'create.client.view.dart';

class SearchClientView extends StatefulWidget {
  @override
  _SearchClientViewState createState() => _SearchClientViewState();
}

class _SearchClientViewState extends State<SearchClientView> {
  final ClientController controller = ClientController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SearchAppbar(
          choose: 0,
          controllerClient: controller,
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
                    builder: (context) => CreateClientView(
                      model: ClientModel(id: 0),
                    ),
                  ),
                )
                .then((value) => setState(() {}));
          },
        ),
      ),
      body: FutureBuilder(
        future: controller.getClients(),
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
                    itemCount: controller.clients.length,
                    itemBuilder: (ctx, i) {
                      return ClientListItem(model: controller.clients[i]);
                    },
                  );
                  if (controller.clients.isEmpty) {
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
    );
  }
}
