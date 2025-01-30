import 'package:analise_sangue_mobile/enum/tipo_card_enum.dart';
import 'package:analise_sangue_mobile/http/webclients/visualizar_dados_webclient.dart';
import 'package:analise_sangue_mobile/screens/visualizar_dados/visualizar_dados_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisualizarDadosCubit extends Cubit<VisualizarDadosState> {
  VisualizarDadosWebclient webclient = VisualizarDadosWebclient();
  final int arquivoId;

  VisualizarDadosCubit({required this.arquivoId}): super(const InitVisualizarDadosState());

  Future<void> buscaDados(TipoCardEnum tipoCard) async {
    emit(VisualizarDadosLoading(tipoCard: tipoCard));

    if (TipoCardEnum.candidatesByState == tipoCard) {
      final data = await webclient.contarDoadoresPorEstado(arquivoId);
      emit(VisualizarDadosLoaded(tipoCard: tipoCard, data: data));
    }
    if (TipoCardEnum.averageIMCByAgeGroup == tipoCard) {
      final data = await webclient.calcularImcMedioPorFaixaEtaria(arquivoId);
      emit(VisualizarDadosLoaded(tipoCard: tipoCard, data: data));
    }
    if(TipoCardEnum.obesityPercentage == tipoCard) {
      final data = await webclient.calcularPercentualObesosPorSexo(arquivoId);
      emit(VisualizarDadosLoaded(tipoCard: tipoCard, data: data));
    }
    if (TipoCardEnum.averageAgeByBloodType == tipoCard) {
      final data = await webclient.calcularMediaIdadePorTipoSanguineo(arquivoId);
      emit(VisualizarDadosLoaded(tipoCard: tipoCard, data: data));
    }

    if (TipoCardEnum.possibleDonorsByBloodType == tipoCard) {
      final data = await webclient.contarDoadoresPorTipoSanguineoReceptor(arquivoId);
      emit(VisualizarDadosLoaded(tipoCard: tipoCard, data: data));
    }
  }

}