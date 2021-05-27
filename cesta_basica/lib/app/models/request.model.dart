class RequestModel {
  int id;
  String statusDelivery;
  double totalValue;
  String deliveryDate;
  String dateRequest;
  String comments;
  int clientsId;
  String typePayment;

  RequestModel({
    this.id,
    this.statusDelivery,
    this.totalValue,
    this.deliveryDate,
    this.comments,
    this.clientsId,
    this.dateRequest,
    this.typePayment,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "statusDelivery": statusDelivery,
        "totalValue": totalValue,
        "deliveryDate": deliveryDate,
        "comments": comments,
        "clientsId": clientsId,
        "dateRequest": dateRequest,
        "typePayment": typePayment,
      };

  factory RequestModel.fromMap(Map<String, dynamic> json) => RequestModel(
        id: json["id"],
        statusDelivery: json["statusDelivery"],
        totalValue: json["totalValue"].toDouble(),
        deliveryDate: json["deliveryDate"],
        comments: json["comments"],
        clientsId: json["clientsId"],
        dateRequest: json["dateRequest"],
        typePayment: json["typePayment"],
      );
}
