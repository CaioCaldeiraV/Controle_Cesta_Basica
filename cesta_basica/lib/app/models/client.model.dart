class ClientModel {
  int id;
  String name;
  String rg;
  String cpf;
  String gender;
  String dateOfBirth;
  String phone;
  String state;
  String city;
  String neighborhood;
  String street;
  int number;

  ClientModel({
    this.id,
    this.name,
    this.rg,
    this.cpf,
    this.gender,
    this.dateOfBirth,
    this.phone,
    this.state,
    this.city,
    this.neighborhood,
    this.street,
    this.number,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "rg": rg,
        "cpf": cpf,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "phone": phone,
        "state": state,
        "city": city,
        "neighborhood": neighborhood,
        "street": street,
        "number": number,
      };

  factory ClientModel.fromMap(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        name: json["name"],
        rg: json["rg"],
        cpf: json["cpf"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"],
        phone: json["phone"],
        state: json["state"],
        city: json["city"],
        neighborhood: json["neighborhood"],
        street: json["street"],
        number: json["number"],
      );
}
