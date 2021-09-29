import 'package:cesta_basica/app/controllers/request/request.search.controller.dart';
import 'package:cesta_basica/app/models/request.model.dart';
import 'package:cesta_basica/app/views/android/comum_widgets/search.appbar.dart';
import 'package:cesta_basica/app/views/android/request/widgets/request.list.item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'create.request.view.dart';

class SearchRequestView extends StatefulWidget {
  @override
  _SearchRequestViewState createState() => _SearchRequestViewState();
}

class _SearchRequestViewState extends State<SearchRequestView> {
  final controller = SearchRequestController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SearchAppbar(
          choose: 3,
          controllerRequest: controller,
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
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => CreateRequestView(
                      model: RequestModel(id: 0),
                    ),
                  ),
                )
                .then((value) => setState(() {}));
          },
        ),
      ),
      body: FutureBuilder(
          future: controller.getRequests(),
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
                  ),
                );
              } else {
                return Observer(
                  builder: (_) {
                    var listView = ListView.builder(
                      itemCount: controller.requests.length,
                      itemBuilder: (context, i) {
                        return RequestListItem(
                          model: controller.requests[i],
                          clientName: controller.clientNames[i],
                        );
                      },
                    );

                    if (controller.requests.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Nenhum Pedido",
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
                        ),
                      );
                    } else {
                      return listView;
                    }
                  },
                );
              }
            } else {
              return Center(
                child: ShaderMask(
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
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  blendMode: BlendMode.srcATop,
                ),
              );
            }
          }),
    );
  }
}
