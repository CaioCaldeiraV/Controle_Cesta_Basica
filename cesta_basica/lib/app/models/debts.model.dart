class DebtsModel {
  int id;
  String status;
  int quantityInstallments;
  int requestId;

  DebtsModel({
    this.id,
    this.status,
    this.quantityInstallments,
    this.requestId,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "quantityInstallments": quantityInstallments,
        "requestId": requestId,
      };

  factory DebtsModel.fromMap(Map<String, dynamic> json) => DebtsModel(
        id: json["id"],
        status: json["status"],
        quantityInstallments: json["quantityInstallments"],
        requestId: json["requestId"],
      );
}
