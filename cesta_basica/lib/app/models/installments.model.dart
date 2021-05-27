class InstallmentsModel {
  int id;
  String status;
  double value;
  int debtsId;
  String datePayment;

  InstallmentsModel({
    this.id,
    this.status,
    this.value,
    this.debtsId,
    this.datePayment,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "value": value,
        "debtsId": debtsId,
        "datePayment": datePayment,
      };

  factory InstallmentsModel.fromMap(Map<String, dynamic> json) =>
      InstallmentsModel(
        id: json["id"],
        status: json["status"],
        value: json["value"],
        debtsId: json["debtsId"],
        datePayment: json["datePayment"],
      );
}
