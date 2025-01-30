import 'package:intl/intl.dart';

class DoadorEstado {
  final String estado;
  final int quantidade;

  DoadorEstado({required this.estado, required this.quantidade});

  factory DoadorEstado.fromJson(Map<String, dynamic> json) {
    return DoadorEstado(
        estado: json['estado'],
        quantidade: json['quantidade'],
    );
  }
}