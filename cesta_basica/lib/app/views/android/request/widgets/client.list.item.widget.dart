import 'package:cesta_basica/app/models/client.model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClientListItem extends StatefulWidget {
  final ClientModel model;

  ClientListItem({
    @required this.model,
  });

  @override
  _ClientListItemState createState() => _ClientListItemState();
}

class _ClientListItemState extends State<ClientListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset(
          widget.model.gender == "Masculino"
              ? "assets/images/profilepicture.png"
              : "assets/images/profilepicturefemale.png",
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(widget.model.name),
      subtitle:
          Text("${widget.model.state.substring(0, 2)} - ${widget.model.city}"),
      onTap: () {},
    );
  }
}
