class RequestBasicBasketModel {
  int id;
  int amount;
  int requestId;
  int basicbasketsId;

  RequestBasicBasketModel({
    this.id,
    this.amount,
    this.requestId,
    this.basicbasketsId,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "requestId": requestId,
        "basicbasketsId": basicbasketsId,
      };

  factory RequestBasicBasketModel.fromMap(Map<String, dynamic> json) =>
      RequestBasicBasketModel(
        id: json["id"],
        amount: json["amount"],
        requestId: json["requestId"],
        basicbasketsId: json["basicbasketsId"],
      );
}
