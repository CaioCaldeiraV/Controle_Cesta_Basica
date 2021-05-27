import 'package:cesta_basica/app/models/request.model.dart';
import 'package:flutter/material.dart';

import 'widgets/request.card.detail.widget.dart';

class DetailRequestView extends StatefulWidget {
  final RequestModel model;

  DetailRequestView({this.model});

  @override
  _DetailProductViewState createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailRequestView> {
  int _currentIndex;

  Color getColor(int index) {
    if (index == _currentIndex) {
      if (_currentIndex == 0) {
        return Colors.green;
      } else if (_currentIndex == 1) {
        return Colors.yellow;
      } else {
        return Colors.blue;
      }
    } else {
      return Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    var _screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        actions: [],
      ),
      backgroundColor: Colors.green,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.green, Colors.cyan],
            stops: [
              0.0,
              0.8,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: _screenHeigth * .005,
              child: Center(
                child: Text(
                  "Número do Pedido: ${widget.model.id}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              top: _screenHeigth * .1,
              child: Container(
                height: _screenHeigth * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: 500,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              RequestCardDetailWidget(
                                model: widget.model,
                                onChanged: (index) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: getColor(0),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 9),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: getColor(1),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 9),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: getColor(2),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/bag.png',
                                scale: 8,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
