class ProductModel {
  int id;
  String name;
  double value;
  int stock;
  String brand;
  String image;

  ProductModel({
    this.id,
    this.name,
    this.value,
    this.stock,
    this.brand,
    this.image,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "value": value,
        "stock": stock,
        "brand": brand,
        "image": image,
      };

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        value: json["value"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        image: json["image"],
      );
}
