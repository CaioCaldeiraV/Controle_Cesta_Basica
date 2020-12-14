class BasicBasketProductModel {
  int id;
  int amount;
  int productsId;
  int basicbasketsId;

  BasicBasketProductModel({
    this.id,
    this.amount,
    this.productsId,
    this.basicbasketsId,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "amount": amount,
        "productsId": productsId,
        "basicbasketsId": basicbasketsId,
      };

  factory BasicBasketProductModel.fromMap(Map<String, dynamic> json) =>
      BasicBasketProductModel(
        id: json["id"],
        amount: json["amount"],
        productsId: json["productsId"],
        basicbasketsId: json["basicbasketsId"],
      );
}
