import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labelField;

  LoginTextField({
    @required this.labelField,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: TextFormField(
        obscureText: labelField == "Senha" ? true : false,
        keyboardType: labelField == "Email"
            ? TextInputType.emailAddress
            : TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            icon: Icon(
              labelField == "Email" ? Icons.email : Icons.lock,
            ),
            hintText: labelField,
            hintStyle: TextStyle(
              fontSize: 18,
            )),
      ),
    );
  }
}
