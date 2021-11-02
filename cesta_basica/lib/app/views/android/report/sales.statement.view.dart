import 'package:flutter/material.dart';

class SalesStatementView extends StatefulWidget {
  const SalesStatementView({Key key}) : super(key: key);

  @override
  _SalesStatementViewState createState() => _SalesStatementViewState();
}

class _SalesStatementViewState extends State<SalesStatementView> {
  List<String> valuesDropdownDate = [
    "Mês atual",
    "Mês Passado",
    "Semana atual",
    "Semana passada"
  ];
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
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
        centerTitle: true,
        title: Text(
          'Controle Cestas Básicas',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .1,
            width: double.maxFinite,
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .05,
                  vertical: MediaQuery.of(context).size.height * .015),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton(
                        isExpanded: true,
                        dropdownColor: Theme.of(context).primaryColor,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        focusColor: Colors.white,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: valuesDropdownDate
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        value: dropdownValue,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: DropdownButton(
                        isExpanded: true,
                        dropdownColor: Theme.of(context).primaryColor,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        focusColor: Colors.white,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: valuesDropdownDate
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        value: dropdownValue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
