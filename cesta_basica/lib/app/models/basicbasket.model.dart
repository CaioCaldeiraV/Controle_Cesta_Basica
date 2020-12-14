class BasicBasketModel {
  int id;
  String name;
  double value;

  BasicBasketModel({
    this.id,
    this.name,
    this.value,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "value": value,
      };

  factory BasicBasketModel.fromMap(Map<String, dynamic> json) =>
      BasicBasketModel(
        id: json["id"],
        name: json["name"],
        value: json["value"].toDouble(),
      );
}
