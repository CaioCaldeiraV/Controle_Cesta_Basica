import 'package:cesta_basica/app/views/android/home/home.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/login.widget.logo.dart';
import 'widgets/login.widget.textfield.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LogoLogin(),
            Column(
              children: <Widget>[
                SizedBox(height: 30),
                LoginTextField(labelField: "Email"),
                SizedBox(height: 30),
                LoginTextField(labelField: "Senha"),
                SizedBox(height: 5),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.only(right: 0.0),
                      ),
                    ),
                    child: Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0),
                      ))),
                  child: Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 1.2,
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
                            ]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(45),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 7,
                            offset: Offset(-2.0, 4.0),
                          )
                        ]),
                    child: Center(
                      child: Text(
                        'ENTRAR',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Não possui uma conta?',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
