import 'package:analise_sangue_mobile/model/arquivo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardArquivo extends StatelessWidget {
  const cardArquivo({super.key, required this.arquivo, required this.onTapFunction});

  final Arquivo arquivo;
  final void Function(int) onTapFunction;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: colorScheme.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => onTapFunction(arquivo.id!),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 12),
            leading: Icon(
              Icons.insert_drive_file,
              color: colorScheme.primary,
              size: 32,
            ),
            title: Text(
              arquivo.nomeArquivo,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              "Última modificação: ${arquivo.getDataImportacaoFormatada()}",
              style: TextStyle(
                color: colorScheme.onSurfaceVariant
                    .withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
