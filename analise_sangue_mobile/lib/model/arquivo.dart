import 'package:intl/intl.dart';

class Arquivo {
  final int? id;
  final int usuarioId;
  final String nomeArquivo;
  final DateTime? dataImportacao;

  Arquivo(this.id, this.usuarioId, this.nomeArquivo, this.dataImportacao);

  factory Arquivo.fromJson(Map<String, dynamic> json) {
    return Arquivo(
        json['id'],
        json['usuarioId'],
        json['nomeArquivo'],
        json['dataImportacao'] != null ? DateTime.parse(json['dataImportacao']) : null,
    );
  }


  String getDataImportacaoFormatada() {
    if (dataImportacao == null) return "Sem data";
    return DateFormat("dd/MM/yyyy HH:mm:ss").format(dataImportacao!);
  }

}