import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

class Producto {
  Producto({
    this.code,
    this.price,
    this.name,
    this.size,
    this.colo,
    this.descripcion,
    this.photo,
  });

  String? code;
  String? price;
  String? name;
  String? size;
  String? colo;
  String? descripcion;
  String? photo;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        code: json["code"],
        price: json["price"],
        name: json["name"],
        size: json["size"],
        colo: json["colo"],
        descripcion: json["descripcion"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "price": price,
        "name": name,
        "size": size,
        "colo": colo,
        "descripcion": descripcion,
        "photo": photo,
      };
}
