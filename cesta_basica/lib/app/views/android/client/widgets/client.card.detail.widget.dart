import 'package:cesta_basica/app/models/client.model.dart';
import 'package:flutter/material.dart';

class ClientCardDetailWidget extends StatelessWidget {
  final ClientModel model;
  final ValueChanged<int> onChanged;
  const ClientCardDetailWidget({Key key, this.model, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.9,
      child: PageView(
        onPageChanged: onChanged,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(-2.0, 4.0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Informações",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                        ),
                        Icon(
                          Icons.info,
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text(
                        "Nome: ${model.name}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "RG: ${model.rg}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "CPF: ${model.cpf}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "Telefone: ${model.phone}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        """
Data de Nascimento: ${model.dateOfBirth.replaceAll(' ', '')}""",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "Sexo: ${model.gender}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "Estado: ${model.state}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "Cidade: ${model.city}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "Bairro: ${model.neighborhood}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "Rua: ${model.street}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        "Número: ${model.number}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(-2.0, 4.0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Compras",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.shop_two,
                          color: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(-2.0, 4.0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dívidas",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.money_off,
                          color: Theme.of(context).accentColor,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  padding: EdgeInsets.all(20),
                  child: ListView(
                    children: [],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
