class serviceModel {
  String? description;
  String? icon;
  String? moto;
  String? name;
  num? price;
  List? service;
  serviceModel(
      {this.description,
      this.icon,
      this.moto,
      this.name,
      this.price,
      this.service});

  Map<String, dynamic> toMap() {
    return {
      "description": this.description,
      "icon": this.icon,
      "moto": this.moto,
      "name": this.name,
      "price": this.price,
      "service": this.service,
    };
  }

  factory serviceModel.fromMap(Map<String, dynamic> Map) {
    return serviceModel(
        description: Map["description"] ?? "",
        icon: Map["icon"] ?? "",
        moto: Map["moto"] ?? "",
        name: Map["name"] ?? "",
        price: Map["price"] ?? "",
        service: Map["service"] ?? []);
  }

  serviceModel copyWith({
    String? description,
    String? icon,
    String? moto,
    String? name,
    num? price,
    List? service,
  }) {
    return serviceModel(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      moto: moto ?? this.moto,
      name: name ?? this.name,
      price: price ?? this.price,
      service: service ?? this.service,
    );
  }
}
