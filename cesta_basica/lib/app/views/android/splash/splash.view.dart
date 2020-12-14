import 'package:cesta_basica/app/views/android/login/login.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.green,
              Theme.of(context).primaryColor,
            ],
            stops: [
              0.0,
              0.8,
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
