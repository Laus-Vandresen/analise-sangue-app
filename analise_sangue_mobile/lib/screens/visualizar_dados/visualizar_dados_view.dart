import 'package:analise_sangue_mobile/components/custom_app_bar.dart';
import 'package:analise_sangue_mobile/enum/tipo_card_enum.dart';
import 'package:analise_sangue_mobile/screens/login/login_container.dart';
import 'package:analise_sangue_mobile/screens/visualizar_dados/visualizar_dados_cubit.dart';
import 'package:analise_sangue_mobile/screens/visualizar_dados/visualizar_dados_state.dart';
import 'package:analise_sangue_mobile/util/shared_preferences_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisualizarDadosView extends StatelessWidget {
  const VisualizarDadosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisualizarDadosCubit, VisualizarDadosState>(builder: (context, state) {
      return _VisualizarDadosScreen();
    });
  }
}

class _VisualizarDadosScreen extends StatelessWidget {
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
        return Scaffold(
          appBar: CustomAppBar(
            title: userName,
            onLogoutPressed: () => _logout(context),
            showBackButton: true,
          ),
          body: BlocBuilder<VisualizarDadosCubit, VisualizarDadosState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildExpansionCard(
                        context: context,
                        tipoCard: TipoCardEnum.candidatosEstado,
                        title: 'Candidatos por estado',
                        icon: Icons.people_outline,
                        state: state,
                      ),
                      _buildExpansionCard(
                        context: context,
                        tipoCard: TipoCardEnum.imcMedioIdade,
                        title: 'IMC médio por faixa de idade',
                        icon: Icons.insights_outlined,
                        state: state,
                      ),
                      _buildExpansionCard(
                        context: context,
                        tipoCard: TipoCardEnum.percentualObesidade,
                        title: 'Percentual de obesidade',
                        icon: Icons.monitor_weight_outlined,
                        state: state,
                      ),
                      _buildExpansionCard(
                        context: context,
                        tipoCard: TipoCardEnum.idadeMediaTipoSanguineo,
                        title: 'Idade média por tipo sanguíneo',
                        icon: Icons.bloodtype_outlined,
                        state: state,
                      ),
                      _buildExpansionCard(
                        context: context,
                        tipoCard: TipoCardEnum.possivelDoadorTipoSanguineo,
                        title: 'Possíveis doadores por tipo sanguíneo',
                        icon: Icons.health_and_safety_outlined,
                        state: state,
                      ),
                    ],
                  ),
                );
              }
           ),
        );
      },
    );
  }

  Widget _buildExpansionCard({
    required BuildContext context,
    required TipoCardEnum tipoCard,
    required String title,
    required IconData icon,
    required VisualizarDadosState state,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 16.0),
      child: ExpansionTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.secondary),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        onExpansionChanged: (isExpanded) {
          if (isExpanded) {
            context.read<VisualizarDadosCubit>().buscaDados(tipoCard);
          }
        },
        children: [
          if (state is VisualizarDadosLoading && state.tipoCard == tipoCard)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (state is VisualizarDadosLoaded && state.tipoCard == tipoCard)
            _buildExpadedCard(state)
        ],
      ),
    );
  }

  Padding _buildExpadedCard(VisualizarDadosLoaded state) {
    return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.data
                  .whereType<Map<String, dynamic>>()
                  .map<Widget>((item) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: item.entries.map<Widget>((entry) {
                    Map<String, String> keyLabels = getKeyLabels();
                    final label = keyLabels[entry.key] ?? entry.key;
                    return _buildLinhaInformacaoCard(label, entry);
                  }).toList(),
                ),
              )).toList(),
            ),
          );
  }

  Padding _buildLinhaInformacaoCard(String label, MapEntry<String, dynamic> entry) {
    return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          '$label:',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '${entry.value}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
  }

  Map<String, String> getKeyLabels() {
    final keyLabels = {
      'estado': 'Estado',
      'quantidade': 'Quantidade',
      'faixaEtaria': 'Faixa etária',
      'imcMedio': 'IMC médio',
      'sexo': 'Sexo',
      'percentualObesos': 'Obesos (%)',
      'tipoSanguineo': 'Tipo sanguíneo',
      'mediaIdade': 'Média Idade',
      'tipoReceptor': 'Tipo receptor',
    };
    return keyLabels;
  }
}