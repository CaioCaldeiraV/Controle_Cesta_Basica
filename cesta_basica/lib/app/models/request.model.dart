class RequestModel {
  int id;
  String status;
  double totalValue;
  String deliveryDate;
  String dateRequest;
  String comments;
  int clientsId;

  RequestModel({
    this.id,
    this.status,
    this.totalValue,
    this.deliveryDate,
    this.comments,
    this.clientsId,
    this.dateRequest,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "totalValue": totalValue,
        "deliveryDate": deliveryDate,
        "comments": comments,
        "clientsId": clientsId,
        "dateRequest": dateRequest,
      };

  factory RequestModel.fromMap(Map<String, dynamic> json) => RequestModel(
        id: json["id"],
        status: json["status"],
        totalValue: json["totalValue"].toDouble(),
        deliveryDate: json["deliveryDate"],
        comments: json["comments"],
        clientsId: json["clientsId"],
        dateRequest: json["dateRequest"],
      );
}
