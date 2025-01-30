import 'dart:io';

import 'package:analise_sangue_mobile/components/card_arquivo.dart';
import 'package:analise_sangue_mobile/components/custom_app_bar.dart';
import 'package:analise_sangue_mobile/model/arquivo.dart';
import 'package:analise_sangue_mobile/screens/importe_arquivo/importe_arquivo_cubit.dart';
import 'package:analise_sangue_mobile/screens/importe_arquivo/importe_arquivo_state.dart';
import 'package:analise_sangue_mobile/screens/login/login_container.dart';
import 'package:analise_sangue_mobile/util/shared_preferences_util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImporteArquivoView extends StatelessWidget {
  const ImporteArquivoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImporteArquivoCubit, ImporteArquivoState>(
      builder: (context, state) {
        if (state is InitImporteArquivoState) {
          return _ImporteArquivoScreen(arquivos: null);
        }
        if (state is LoadedImporteArquivoState) {
          return _ImporteArquivoScreen(arquivos: state.arquivos);
        }
        if (state is GoToVisualizarDadosState) {
          return _ImporteArquivoScreen(arquivos: state.arquivos);
        }
        return _ImporteArquivoScreen(arquivos: null);
      },
    );
  }
}

class _ImporteArquivoScreen extends StatelessWidget {
  final List<Arquivo>? arquivos;

  _ImporteArquivoScreen({required this.arquivos});

  Future<String> _loadUserName() async {
    return await SharedPreferencesUtil().get('usuario') ?? '';
  }

  void _logout(BuildContext context) async {
    SharedPreferencesUtil().deleteToken('jwt');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginContainer()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadUserName(),
      builder: (context, snapshot) {
        String userName = snapshot.data ?? '';
        final colorScheme = Theme.of(context).colorScheme;

        return Scaffold(
          appBar: CustomAppBar(title: userName, onLogoutPressed: () => _logout(context), showBackButton: false),
          backgroundColor: colorScheme.surface,
          body: displayCardArquivos(arquivos),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['json']);
              if (result != null) {
                File file = File(result.files.single.path!);
                BlocProvider.of<ImporteArquivoCubit>(context).handleUploadArquivo(file);
              }
            },
            backgroundColor: colorScheme.primary,
            child: Icon(Icons.add, color: Colors.white),
          ),
        );
      },
    );
  }

  Widget displayCardArquivos(List<Arquivo>? arquivos) {
    return arquivos == null || arquivos!.isEmpty
        ? const Center(
      child: Text(
        "Nenhum arquivo importado.\nToque no botão abaixo para importar um arquivo e processar os dados",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    )
        : ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: arquivos.length,
      itemBuilder: (context, index) {
        final arquivo = arquivos[index];
        return cardArquivo(
          arquivo: arquivo,
          onTapFunction: (id) => BlocProvider.of<ImporteArquivoCubit>(context).handleVisualizarDadosState(id),
        );
      },
    );
  }
}
