import 'dart:convert';

Mantenimiento mantenimientoFromJson(String str) =>
    Mantenimiento.fromJson(json.decode(str));

String mantenimientoToJson(Mantenimiento data) => json.encode(data.toJson());

class Mantenimiento {
  Mantenimiento({
    this.idmantenimiento,
    this.titulo,
    this.descripcion,
    this.fechaCreacion,
    this.estado,
    this.prioridad,
    this.tipo,
  });

  String? idmantenimiento;
  String? titulo;
  String? descripcion;
  DateTime? fechaCreacion;
  int? estado;
  int? prioridad;
  int? tipo;

  factory Mantenimiento.fromJson(Map<String, dynamic> json) => Mantenimiento(
        idmantenimiento: json["idmantenimiento"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        estado: json["estado"],
        prioridad: json["prioridad"],
        tipo: json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "idmantenimiento": idmantenimiento,
        "titulo": titulo,
        "descripcion": descripcion,
        "fechaCreacion": fechaCreacion?.toIso8601String(),
        "estado": estado,
        "prioridad": prioridad,
        "tipo": tipo,
      };
}
