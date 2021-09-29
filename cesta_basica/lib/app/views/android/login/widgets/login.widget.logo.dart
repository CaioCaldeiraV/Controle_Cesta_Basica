import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.35,
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
              blurRadius: 7,
              offset: Offset(-2.0, 4.0),
            )
          ],
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
