import 'package:flutter/material.dart';
import 'package:tcc_fisio_app/res/custom_colors.dart';
import 'package:tcc_fisio_app/widgets/custom_back_button.dart';
import 'package:tcc_fisio_app/widgets/custom_radio_button.dart';
import 'package:tcc_fisio_app/widgets/custom_radio_legend.dart';

class CIFPatientScreen extends StatelessWidget {
  static String routeName = '/patient-cif';
  CIFPatientScreen({super.key});

  Map<String, dynamic> icf = {
    "FUNÇÃO CORPORAL": {
      "checked": false,
      "value": 0,
      "FUNÇÕES MENTAIS": {
        "checked": false,
        "value": 0,
        "Consciência": {"checked": false, "value": 0},
        "Orientação (tempo, lugar, pessoa)": {"checked": false, "value": 0},
        "Funções intelectuais (demência)": {"checked": false, "value": 0},
        "Funções da energia e de impulsos": {"checked": false, "value": 0},
        "Sono": {"checked": false, "value": 0},
        "Atenção": {"checked": false, "value": 0},
        "Memória": {"checked": false, "value": 0},
        "Funções Emocionais": {"checked": false, "value": 0},
        "Funções da percepção": {"checked": false, "value": 0},
        "Funções cognitivas superiores": {"checked": false, "value": 0},
        "Funções mentais da linguagem": {"checked": false, "value": 0}
      },
      "FUNÇÕES SENSORIAIS E DE DOR": {
        "checked": false,
        "value": 0,
        "Visão": {"checked": false, "value": 0},
        "Audição": {"checked": false, "value": 0},
        "Vestibular (equilíbrio)": {"checked": false, "value": 0},
        "Dor": {"checked": false, "value": 0}
      },
      "FUNÇÕES DA VOZ E DA FALA": {
        "checked": false,
        "value": 0,
        "Voz": {"checked": false, "value": 0}
      },
      "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO":
          {
        "checked": false,
        "value": 0,
        "Funções do Coração": {"checked": false, "value": 0},
        "Pressão Sanguínea": {"checked": false, "value": 0},
        "Funções do sistema hematológico": {"checked": false, "value": 0},
        "Funções do sistema imunológico (alergias, hipersensibilidade)": {
          "checked": false,
          "value": 0
        },
        "Funções do sistema respiratório": {"checked": false, "value": 0}
      },
      "FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO": {
        "checked": false,
        "value": 0,
        "Funções digestivas": {"checked": false, "value": 0},
        "Funções de defecação": {"checked": false, "value": 0},
        "Manutenção do peso": {"checked": false, "value": 0},
        "Funções das glândulas endócrinas (mudanças hormonais)": {
          "checked": false,
          "value": 0
        }
      },
      "FUNÇÕES GENITURINÁRIAS E REPRODUTIVAS": {
        "checked": false,
        "value": 0,
        "Funções Urinárias": {"checked": false, "value": 0},
        "Funções Sexuais": {"checked": false, "value": 0}
      },
      "FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO": {
        "checked": false,
        "value": 0,
        "Mobilidade das articulações": {"checked": false, "value": 0},
        "Força muscular": {"checked": false, "value": 0},
        "Tônus muscular": {"checked": false, "value": 0},
        "Movimentos involuntários": {"checked": false, "value": 0}
      },
      "FUNÇÕES DA PELE E ESTRUTURAS RELACIONADAS A QUAISQUER OUTRAS FUNÇÕES DO CORPO":
          {"checked": false, "value": 0}
    },
    "ESTRUTURA CORPORAL": {
      "checked": false,
      "value": 0,
      "ESTRUTURA DO SISTEMA NERVOSO": {
        "checked": false,
        "value": 0,
        "Cérebro": {"checked": false, "value": 0},
        "Medula espinhal e nervos periféricos": {"checked": false, "value": 0}
      },
      "OLHO, OUVIDO E ESTRUTURAS RELACIONADAS": {"checked": false, "value": 0},
      "ESTRUTURAS RELACIONADAS A VOZ E FALA": {"checked": false, "value": 0},
      "ESTRUTURAS DOS SISTEMAS CARDIOVASCULAR, IMUNOLÓGICO E RESPIRATÓRIO": {
        "checked": false,
        "value": 0,
        "Sistema cardiovascular": {"checked": false, "value": 0},
        "Sistema respiratório": {"checked": false, "value": 0}
      },
      "ESTRUTURAS RELACIONADAS AOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO":
          {"checked": false, "value": 0},
      "ESTRUTURAS RELACIONADAS AO SISTEMA GENITURINÁRIO E REPRODUTIVO": {
        "checked": false,
        "value": 0,
        "Sistema urinário": {"checked": false, "value": 0},
        "Sistema reprodutivo": {"checked": false, "value": 0}
      },
      "ESTRUTURAS RELACIONADAS AO MOVIMENTO": {
        "checked": false,
        "value": 0,
        "Região da cabeça e pescoço": {"checked": false, "value": 0},
        "Região de ombro": {"checked": false, "value": 0},
        "Extremidade superior (braço, mão)": {"checked": false, "value": 0},
        "Pelve": {"checked": false, "value": 0},
        "Extremidade inferior(perna, pé)": {"checked": false, "value": 0},
        "Tronco": {"checked": false, "value": 0}
      },
      "PELE E ESTRUTURAS RELACIONADAS A QUAISQUER OUTRAS ESTRUTURAS DO CORPO": {
        "checked": false,
        "value": 0
      }
    },
    "ATIVIDADES E PARTICIPAÇÃO": {
      "checked": false,
      "value": 0,
      "APRENDIZAGEM E APLICAÇÃO DO CONHECIMENTO": {
        "checked": false,
        "value": 0,
        "Observar/assistir": {"checked": false, "value": 0},
        "Resolver problemas": {"checked": false, "value": 0}
      },
      "TAREFAS E DEMANDAS GERAIS": {
        "checked": false,
        "value": 0,
        "Realizar uma única tarefa": {"checked": false, "value": 0},
        "Realizar tarefas múltiplas": {"checked": false, "value": 0}
      },
      "COMUNICAÇÃO": {
        "checked": false,
        "value": 0,
        "Comunicação - recepção de mensagens verbais": {
          "checked": false,
          "value": 0
        },
        "Comunicação - recepção de mensagens não verbais": {
          "checked": false,
          "value": 0
        },
        "Fala": {"checked": false, "value": 0},
        "Conservação": {"checked": false, "value": 0}
      },
      "MOBILIDADE": {
        "checked": false,
        "value": 0,
        "Levantar e carregar objetos": {"checked": false, "value": 0},
        "Uso fino das mãos (pegar, segurar)": {"checked": false, "value": 0},
        "Andar": {"checked": false, "value": 0},
        "Deslocar-se utilizando algum tipo de equipamento": {
          "checked": false,
          "value": 0
        },
        "Utilização de transporte (carros, ônibus, trem, avião)": {
          "checked": false,
          "value": 0
        },
        "Dirigir (bicicleta, motos, dirigir um carro, etc.)": {
          "checked": false,
          "value": 0
        }
      },
      "CUIDADO PESSOAL": {
        "checked": false,
        "value": 0,
        "Lavar-se (banhar-se, secar-se, lavar as mãos, etc.)": {
          "checked": false,
          "value": 0
        },
        "Cuidado das partes do corpo (escovar os dentes, barbear-se)": {
          "checked": false,
          "value": 0
        },
        "Cuidados relacionadas aos processos de excreção": {
          "checked": false,
          "value": 0
        },
        "Vestir-se": {"checked": false, "value": 0},
        "Comer": {"checked": false, "value": 0},
        "Beber": {"checked": false, "value": 0},
        "Cuidar da própria saúde": {"checked": false, "value": 0}
      },
      "VIDA DOMÉSTICA": {
        "checked": false,
        "value": 0,
        "Aquisição de bens e serviços (fazer compras, etc.)": {
          "checked": false,
          "value": 0
        },
        "Tarefas domésticas (limpar a casa, lavar a louça, roupas, passar a ferro, etc.)":
            {"checked": false, "value": 0},
        "Ajudar os outros": {"checked": false, "value": 0}
      },
      "RELAÇÕES E INTERAÇÕES INTERPESSOAIS": {
        "checked": false,
        "value": 0,
        "Relações com estranhos": {"checked": false, "value": 0},
        "Relações formais": {"checked": false, "value": 0},
        "Relações sociais informais": {"checked": false, "value": 0},
        "Relações familiares": {"checked": false, "value": 0},
        "Relações íntimas": {"checked": false, "value": 0}
      },
      "ÁREAS PRINCIPAIS DA VIDA": {
        "checked": false,
        "value": 0,
        "Educação escolar": {"checked": false, "value": 0},
        "Transações econômicas básicas": {"checked": false, "value": 0},
        "Auto-suficiência econômica": {"checked": false, "value": 0}
      },
      "VIDA COMUNITÁRIA, SOCIAL E CÍVICA": {
        "checked": false,
        "value": 0,
        "Vida comunitária": {"checked": false, "value": 0},
        "Recreação e lazer": {"checked": false, "value": 0},
        "Religião e espiritualidade": {"checked": false, "value": 0}
      },
      "QUALQUER OUTRA ATIVIDADE E PARTICIPAÇÃO": {"checked": false, "value": 0}
    },
    "FATORES AMBIENTAIS": {
      "checked": false,
      "value": 0,
      "PRODUTOS E TECNOLOGIA": {
        "checked": false,
        "value": 0,
        "Produtos ou substâncias para consumo pessoal (comida, remédios)": {
          "checked": false,
          "value": 0
        },
        "Para uso pessoal na vida diária": {"checked": false, "value": 0},
        "Mobilidade e transporte pessoal em ambientes internos e externos": {
          "checked": false,
          "value": 0
        },
        "Produtos e tecnologia para comunicação": {
          "checked": false,
          "value": 0
        },
        "Produtos e tecnologia usados em projeto, arquitetura e construção de edifícios de uso privado":
            {"checked": false, "value": 0}
      },
      "AMBIENTE NATURAL E MUDANÇAS AMBIENTAIS": {
        "checked": false,
        "value": 0,
        "Clima": {"checked": false, "value": 0},
        "Luz": {"checked": false, "value": 0},
        "Som": {"checked": false, "value": 0}
      },
      "APOIO E RELACIONAMENTOS": {
        "checked": false,
        "value": 0,
        "Família próxima": {"checked": false, "value": 0},
        "Amigos": {"checked": false, "value": 0},
        "Conhecidos, companheiros, colegas, vizinhos e membros da comunidade": {
          "checked": false,
          "value": 0
        },
        "Pessoas em posição de autoridade": {"checked": false, "value": 0},
        "Cuidadores e assistentes pessoais": {"checked": false, "value": 0},
        "Profissionais da saúde": {"checked": false, "value": 0},
        "Outros profissionais que fornecem serviços relacionados a saúde": {
          "checked": false,
          "value": 0
        }
      },
      "ATITUDES": {
        "checked": false,
        "value": 0,
        "Atitudes individuais de membros da família imediata": {
          "checked": false,
          "value": 0
        },
        "Atitudes individuais dos amigos": {"checked": false, "value": 0},
        "Atitudes individuais dos cuidadores e assistentes pessoais": {
          "checked": false,
          "value": 0
        },
        "Atitudes individuais dos profissionais da saúde": {
          "checked": false,
          "value": 0
        },
        "Atitudes individuais dos profissionais relacionados a saúde": {
          "checked": false,
          "value": 0
        },
        "Atitudes sociais": {"checked": false, "value": 0},
        "Normas, práticas e ideologias sociais": {"checked": false, "value": 0}
      },
      "SERVIÇOS, SISTEMAS E POLÍTICAS": {
        "checked": false,
        "value": 0,
        "Habitação": {"checked": false, "value": 0},
        "De transporte": {"checked": false, "value": 0},
        "De suporte social geral": {"checked": false, "value": 0},
        "De saúde": {"checked": false, "value": 0},
        "De educação e treinamento": {"checked": false, "value": 0},
        "De trabalho e emprego": {"checked": false, "value": 0}
      },
      "QUAISQUER OUTROS FATORES AMBIENTAIS": {"checked": false, "value": 0}
    }
  };

//FUNÇÃO CORPORAL

  void _handleFuncaoCorporalChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["checked"] = value!;
      if (!value) {
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]["checked"] =
            false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES DA VOZ E DA FALA"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"][
                "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES GENITURINÁRIAS E REPRODUTIVAS"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"][
                "FUNÇÕES DA PELE E ESTRUTURAS RELACIONADAS A QUAISER OUTRAS FUNÇÕES DO CORPO"]
            ["checked"] = false;
      }
    });
  }

  void _handleFuncoesMentaisChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["checked"] = value!;
      if (!value) {
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Consiência"]["checked"] =
            false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
            ["Orientação (tempo, lugar, pessoa)"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
            ["Funções intelectuais (demência)"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
            ["Funções da energia e de impulsos"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Sono"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Atenção"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Memória"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Funções Emocionais"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Funções de Percepção"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
            ["Funções cognitivas superiores"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
            ["Funções mentais da linguagem"]["checked"] = false;
      }
    });
  }

  void _handleConscienciaChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Consiência"]["checked"] =
          value!;
    });
  }

  void _handleOrientacaoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
          ["Orientação (tempo, lugar, pessoa)"]["checked"] = value!;
    });
  }

  void _handleFuncoesIntelectuaisChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
          ["Funções intelectuais (demência)"]["checked"] = value!;
    });
  }

  void _handleFuncoesEnergiaImpulsosChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
          ["Funções da energia e de impulsos"]["checked"] = value!;
    });
  }

  void _handleSonoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Sono"]["checked"] = value!;
    });
  }

  void _handleAtencaoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Atenção"]["checked"] = value!;
    });
  }

  void _handleMemoriaChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Memória"]["checked"] = value!;
    });
  }

  void _handleFuncoesEmocionaisChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Funções Emocionais"]
          ["checked"] = value!;
    });
  }

  void _handleFuncoesPercepcaoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Funções da percepção"]
          ["checked"] = value!;
    });
  }

  void _handleFuncoesCognitivasSuperioresChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Funções cognitivas superiores"]
          ["checked"] = value!;
    });
  }

  void _handleFuncoesMentaisLingChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["Funções mentais da linguagem"]
          ["checked"] = value!;
    });
  }

//FUNÇÃO CORPORAL/FUNÇÕES SENSORAIS E DE DOR

  void _handleFuncoesSensoriaisChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]["checked"] = value!;
      if (!value) {
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]["Visão"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]["Audição"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]
            ["Vestibular (equilíbrio)"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]["Dor"]
            ["checked"] = false;
      }
    });
  }

  void _handleVisaoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]["Visão"]
          ["checked"] = value!;
    });
  }

  void _handleAudicaoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]["Audição"]
          ["checked"] = value!;
    });
  }

  void _handleVestibularChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]
          ["Vestibular (equilíbrio)"]["checked"] = value!;
    });
  }

  void _handleDorChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES SENSORIAIS E DE DOR"]["Dor"]["checked"] =
          value!;
    });
  }

//FUNÇÃO CORPORAL/FUNÇÕES DA VOZ E DA FALA

  void _handleFuncoesVozFalaChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES DA VOZ E DA FALA"]["checked"] = value!;
      if (!value) {
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES DA VOZ E DA FALA"]["Voz"]["checked"] =
            false;
      }
    });
  }

  void _handleVozChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES DA VOZ E DA FALA"]["Voz"]["checked"] =
          value!;
    });
  }

//FUNÇÃO CORPORAL/FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO

  void _handleFuncoesCardioHematoImunoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"][
              "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
          ["checked"] = value!;
      if (!value) {
        icf["FUNÇÃO CORPORAL"][
                "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
            ["Funções do Coração"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"][
                "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
            ["Pressão Sanguínea"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"][
                "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
            ["Funções do sistema hematológico"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"][
                    "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
                [
                "Funções do sistema imunológico (alergias, hipersensibilidade)"]
            ["checked"] = false;
        icf["FUNÇÃO CORPORAL"][
                "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
            ["Funções do sistema repiratório"]["checked"] = false;
      }
    });
  }

  void _handleFuncoesCoracaoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"][
              "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
          ["Funções do Coração"]["checked"] = value!;
    });
  }

  void _handlePressaoSanguineaChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"][
              "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
          ["Pressão Sanguínea"]["checked"] = value!;
    });
  }

  void _handleFuncoesHematologicoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"][
              "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
          ["Funções do sistema hematológico"]["checked"] = value!;
    });
  }

  void _handleFuncoesImunologicoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"][
                  "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
              ["Funções do sistema imunológico (alergias, hibersensibilidade)"]
          ["checked"] = value!;
    });
  }

  void _handleFuncoesRespiratorio(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"][
              "FUNÇÕES DOS SISTEMAS CARDIOVASCULAR, HEMATOLÓGICO, IMUNOLÓGICO E RESPIRATÓRIO"]
          ["Funções do sistema respiratório"]["checked"] = value!;
    });
  }

// FUNÇÃO CORPORAL/FUNÇÕES DOS SISTEMAS DIGESTIVO. METABÓLICO E ENDÓCRINO

  void _handleFuncoesDigestivoMetabEndocChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
          ["checked"] = value!;
      if (!value) {
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
            ["Funções digestivas"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
            ["Funções de defecação"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
            ["Manutenção do peso"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]
                    ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
                ["Funções das glândulas endócrinas (mudanças hormonais)"]
            ["checked"] = false;
      }
    });
  }

  void _handleFuncoesDigestivasChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
          ["Funções digestivas"]["checked"] = value!;
    });
  }

  void _handleFuncoesDefecacaoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
          ["Funções de defecação"]["checked"] = value!;
    });
  }

  void _handleManutencaoPesoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
          ["Manutenção do peso"]["checked"] = value!;
    });
  }

  void _handleFuncoesGlandulasEndoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
                  ["FUNÇÕES DOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
              ["Funções das glândulas endócrinas (mudanças hormonais)"]
          ["checked"] = value!;
    });
  }

//FUNÇÃO CORPORAL/FUNÇÕES GENITURINÁRIAS E REPRODUTIVAS

  void _handleFuncoesGenituReprodutivasChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES GENITURINÁRIAS E REPRODUTIVAS"]
          ["checked"] = value!;
      if (!value) {
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES GENITURINÁRIAS E REPRODUTIVAS"]
            ["Funções Urinárias"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]["FUNÇÕES GENITURINÁRIAS E REPRODUTIVAS"]
            ["Funções Sexuais"]["checked"] = false;
      }
    });
  }

  void _handleFuncoesUrinariasChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES GENITURINÁRIAS E REPRODUTIVAS"]
          ["Funções Urinárias"]["checked"] = value!;
    });
  }

  void _handleFuncoesSexuaisChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]["FUNÇÕES GENITURINÁRIAS E REPRODUTIVAS"]
          ["Funções Sexuais"]["checked"] = value!;
    });
  }

//FUNÇÃO CORPORAL/FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO

  void _handleFuncoesNeuroMovimentoChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
          ["checked"] = value!;
      if (!value) {
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
            ["Mobilidade das articulações"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
            ["Força muscular"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
            ["Tônus muscular"]["checked"] = false;
        icf["FUNÇÃO CORPORAL"]
                ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
            ["Movimentos involuntários"]["checked"] = false;
      }
    });
  }

  void _handleMobilidadeArticulacoesChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
          ["Mobilidade das articulações"]["checked"] = value!;
    });
  }

  void _handleForcaMuscularChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
          ["Força Muscular"]["checked"] = value!;
    });
  }

  void _handleTonusMuscularChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
          ["Tônus muscular"]["checked"] = value!;
    });
  }

  void _handleMobimentosInvoluntariosChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"]
              ["FUNÇÕES NEUROMUSCULOESQUELÉTICAS E RELACIONADAS AO MOVIMENTO"]
          ["Movimentos involuntários"]["checked"] = value!;
    });
  }

//FUNÇÃO CORPORAL/FUNÇÕES DA PELE E ESTRUTURAS RELACIONADAS A QUAISQUER OUTRAS FUNÇÕES DO CORPO

  void _handleFuncoesPeleEstruturasChange(bool? value) {
    setState(() {
      icf["FUNÇÃO CORPORAL"][
              "FUNÇÕES DA PELE E ESTRUTURAS RELACIONADAS A QUAISQUER OUTRAS FUNÇÕES DO CORPO"]
          ["checked"] = value!;
    });
  }

//ESTRUTURA CORPORAL

  void _handleEstruturaCorporalChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"]["checked"] = value!;
      if (!value) {
        icf["ESTRUTURA CORPORAL"]["ESTRUTURA DO SISTEMA NERVOSO"]["checked"] =
            false;
        icf["ESTRUTURA CORPORAL"]["OLHO, OUVIDO E ESTRUTURAS RELACIONADAS"]
            ["checked"] = false;
        icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS A VOZ E FALA"]
            ["checked"] = false;
        icf["ESTRUTURA CORPORAL"][
                "ESTRUTURAS DOS SISTEMAS CARDIOVASCULAR, IMUNOLÓGICO E RESPIRATÓRIO"]
            ["checked"] = false;
        icf["ESTRUTURA CORPORAL"][
                "ESTRUTURAS RELACIONADAS AOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
            ["checked"] = false;
        icf["ESTRUTURA CORPORAL"][
                "ESTRUTURA RELACIONADAS AO SISTEMA GENITURINÁRIO E REPRODUTIVO"]
            ["checked"] = false;
        icf["ESTRUTURA CORPORAL"]["ESTRUTURA RELACIONADAS AO MOVIMENTO"]
            ["checked"] = false;
        icf["ESTRUTURA CORPORAL"][
                "PELE E ESTRUTURAS RELACIONADAS A QUAISQUER OUTRAS ESTRUTURAS DO CORPO"]
            ["checked"] = false;
      }
    });
  }

//ESTRUTURA CORPORAL/ESTRUTURA DO SISTEMA NERVOSO

  void _handleEstruturaSistemaNervosoChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"]["ESTRUTURA DO SISTEMA NERVOSO"]["checked"] =
          value!;
      if (!value) {
        icf["ESTRUTURA CORPORAL"]["ESTRUTURA DO SISTEMA NERVOSO"]["Cérebro"]
            ["checked"] = false;
        icf["ESTRUTURA CORPORAL"]["ESTRUTURA DO SISTEMA NERVOSO"]
            ["Medula espinhal e nervos peiféricos"]["checked"] = false;
      }
    });
  }

//ESTRUTURA CORPORAL/OLHO, OUVIDO E ESTRUTURAS RELACIONADAS

  void _handleEstruturasOlhoOuvidoChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"]["OLHO, OUVIDO E ESTRUTURAS RELACIONADAS"]
          ["checked"] = value!;
    });
  }

//ESTRUTURA CORPORAL/ESTRUTURAS RELACIONADAS A VOZ E FALA

  void _handleEstruturasVozFalaChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS A VOZ E FALA"]
          ["checked"] = value!;
    });
  }

//ESTRUTURA CORPORAL/ESTRUTURAS DOS SISTEMAS CARDIOVASCULAR, IMUNOLÓGICO E RESPIRATÓRIO

  void _handleEstruturaCardioImunoRespiratorioChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"][
              "ESTRUTURAS DOS SISTEMAS CARDIOVASCULAR, IMUNOLÓGICO E RESPIRATÓRIO"]
          ["checked"] = value!;
    });
  }

//ESTRUTURA CORPORAL/ESTRUTURAS RELACIONADAS AO SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO

  void _handleEstruturasDigestivoMetabolicoEndocrinoChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"][
              "ESTRUTURAS RELACIONADAS AOS SISTEMAS DIGESTIVO, METABÓLICO E ENDÓCRINO"]
          ["checked"] = value!;
    });
  }

//ESTRUTURA CORPORAL/ESTRUTURAS RELACIONADAS AO SISTEMA GENITURINÁRIO E REPRODUTIVO

  void _handleEstruturasGenituReprodutivoChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"]
              ["ESTRUTURAS RELACIONADAS AO SISTEMA GENITURINÁRIO E REPRODUTIVO"]
          ["checked"] = value!;
      if (!value) {
        icf["ESTRUTURA CORPORAL"][
                "ESTRUTURAS RELACIONADAS AO SISTEMA GENITURINÁRIO E REPRODUTIVO"]
            ["Sistema urinário"]["checked"] = false;
        icf["ESTRUTURA CORPORAL"][
                "ESTRUTURAS RELACIONADAS AO SISTEMA GENITURINÁRIO E REPRODUTIVO"]
            ["Sistema reprodutivo"]["checked"] = false;
      }
    });
  }

//ESTRUTURA CORPORAL/ESTRUTURAS RELACIONADAS AO MOVIMENTO

  void _handleEstruturasMovimentoChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS AO MOVIMENTO"]
          ["checked"] = value!;
      if (!value) {
        icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS AO MOVIMENTO"]
            ["Região da cabeça e pescoço"]["checked"] = false;
        icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS AO MOVIMENTO"]
            ["Região do ombro"]["checked"] = false;
        icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS AO MOVIMENTO"]
            ["Extremidade superior (braço, mão)"]["checked"] = false;
        icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS AO MOVIMENTO"]
            ["Pelve"]["checked"] = false;
        icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS AO MOVIMENTO"]
            ["Extremidade inferior (perna, pé)"]["checked"] = false;
        icf["ESTRUTURA CORPORAL"]["ESTRUTURAS RELACIONADAS AO MOVIMENTO"]
            ["Tronco"]["checked"] = false;
      }
    });
  }

//ESTRUTURA CORPORAL/PELE E ESTRUTURAS RELACIONADAS A QUAISQUER OUTRAS ESTRUTURAS DO CORPO

  void _handlePeleEstruturasQualquerChange(bool? value) {
    setState(() {
      icf["ESTRUTURA CORPORAL"][
              "PELE E ESTRUTURAS RELACIONADAS A QUAISQUER OUTRAS ESTRUTURAS DO CORPO"]
          ["checked"] = value!;
    });
  }

//ATIVIDADES E PARTICIPAÇÃO

  void _handleAtividadesParticipacaoChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["checked"] = value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]
            ["APRENDIZAGEM E APLICAÇÃO DO CONHECIMENTO"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["TAREFAS E DEMANDAS GERAIS"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["COMUNICAÇÃO"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["MOBILIDADE"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA DOMÉSTICA"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["RELAÇÕES E INTERAÇÕES INTERPESSOAIS"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["ÁREAS PRINCIPAIS DA VIDA"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA COMUNITÁRIA, SOCIAL E CÍVICA"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]
            ["QUALQUER OUTRA ATIVIDADE E PARTICIPAÇÃO"]["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/APRENDIZAGEM E APLICAÇÃO DO CONHECIMENTO

  void _handleAprendizagemConhecimentoChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]
          ["APRENDIZAGEM E APLICAÇÃO DO CONHECIMENTO"]["checked"] = value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]
                ["APRENDIZAGEM E APLICAÇÃO DO CONHECIMENTO"]
            ["Observar/assistir"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]
                ["APRENDIZAGEM E APLICAÇÃO DO CONHECIMENTO"]
            ["Resolver problemas"]["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/TAREFAS E DEMANDAS GERAIS

  void _handleTarefasDemandasGeraisChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["TAREFAS E DEMANDAS GERAIS"]["checked"] =
          value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]["TAREFAS E DEMANDAS GERAIS"]
            ["Realizar uma única tarefa"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["TAREFAS E DEMANDAS GERAIS"]
            ["Realizar múltiplas tarefas"]["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/COMUNICAÇÃO

  void _handleComunicacaoChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["COMUNICAÇÃO"]["checked"] = value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]["COMUNICAÇÃO"]
            ["Comunicação - recepção de mensagens verbais"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["COMUNICAÇÃO"]
                ["Comunicação - recepção de mensagens não verbais"]["checked"] =
            false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["COMUNICAÇÃO"]["Fala"]["checked"] =
            false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["COMUNICAÇÃO"]["Conservação"]
            ["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/MOBILIDADE

  void _handleMobilidadeChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["MOBILIDADE"]["checked"] = value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]["MOBILIDADE"]
            ["Levantar e carregar objetos"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["MOBILIDADE"]
            ["Uso fino das mãos (pegar, segurar)"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["MOBILIDADE"]["Andar"]["checked"] =
            false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["MOBILIDADE"]
                ["Deslocar-se utilizando algum tipo de equipamento"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["MOBILIDADE"]
                ["Utilização de transporte (carros, ônibus, trem, avião)"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["MOBILIDADE"]
                ["Dirigir (bicicleta, motos, dirigir um carro, etc.)"]
            ["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/CUIDADO PESSOAL

  void _handleCuidadoPessoalChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]["checked"] = value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]
                ["Lavar-se (banhar-se, secar-se, lavar as mãos, etc.)"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]
                ["Cuidado das partes do corpo (escovar os dentes, barbear-se)"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]
                ["Cuidados relacionados aos processos de excreção"]["checked"] =
            false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]["Vestir-se"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]["Comer"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]["Beber"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["CUIDADO PESSOAL"]
            ["Cuidar da própria saúde"]["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/VIDA DOMÉSTICA

  void _handleVidaDomesticaChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA DOMÉSTICA"]["checked"] = value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA DOMÉSTICA"]
                ["Aquisição de bens e serviços (fazer compras, etc.)"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA DOMÉSTICA"][
                "Tarefas domésticas (limpar a casa, lavar a louça, roupas, passar a ferro, etc.)"]
            ["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA DOMÉSTICA"]["Ajudar os outros"]
            ["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/RELAÇÕES E INTERAÇÕES INTERPESSOAIS

  void _hanbleRelacoesInteracoesInterpessoaisChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["RELAÇÕES E INTERAÇÕES INTERPESSOAIS"]
          ["checked"] = value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]["RELAÇÕES E INTERAÇÕES INTERPESSOAIS"]
            ["Relações com estranhos"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["RELAÇÕES E INTERAÇÕES INTERPESSOAIS"]
            ["Relações formais"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["RELAÇÕES E INTERAÇÕES INTERPESSOAIS"]
            ["Relações sociais informais"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["RELAÇÕES E INTERAÇÕES INTERPESSOAIS"]
            ["Relações familiares"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["RELAÇÕES E INTERAÇÕES INTERPESSOAIS"]
            ["Relações íntimas"]["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/ÁREAS PRINCIPAIS DA VIDA

  void _handleAreasPrincipaisVidaChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["ÁREAS PRINCIPAIS DA VIDA"]["checked"] =
          value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]["ÁREAS PRINCIPAIS DA VIDA"]
            ["Educação escolar"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["ÁREAS PRINCIPAIS DA VIDA"]
            ["transações econômicas básicas"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["ÁREAS PRINCIPAIS DA VIDA"]
            ["Auto-suficiência econômica"]["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/VIDA COMUNITÁRIA, SOCIAL E CÍVICA

  void _handleVidaComunitariaChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA COMUNITÁRIA, SOCIAL E CÍVICA"]
          ["checked"] = value!;
      if (!value) {
        icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA COMUNITÁRIA, SOCIAL E CÍVICA"]
            ["Vida comunitária"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA COMUNITÁRIA, SOCIAL E CÍVICA"]
            ["Recreação e lazer"]["checked"] = false;
        icf["ATIVIDADES E PARTICIPAÇÃO"]["VIDA COMUNITÁRIA, SOCIAL E CÍVICA"]
            ["Religião e Espiritualidade"]["checked"] = false;
      }
    });
  }

//ATIVIDADES E PARTICIPAÇÃO/QUALQUER OUTRA ATIVIDADE E PARTICIPAÇÃO

  void _handleQualquerAtividadeParticipacaoChange(bool? value) {
    setState(() {
      icf["ATIVIDADES E PARTICIPAÇÃO"]
          ["QUALQUER OUTRA ATIVIDADE E PARTICIPAÇÃO"]["checked"] = value!;
    });
  }

//FATORES AMBIENTAIS

  void _handleFatoresAmbientaisChange(bool? value) {
    setState(() {
      icf["FATORES AMBIENTAIS"]["checked"] = value!;
      if (!value) {
        icf["FATORES AMBIENTAIS"]["PRODUTOS E TECNOLOGIA"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["AMBIENTE NATURAL E MUDANÇAS AMBIENTAIS"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["APOIO E RELACIONAMENTOS"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["ATITUDES"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["SERVIÇOS, SISTEMAS E POLÍTICAS"]["checked"] =
            false;
        icf["FATORES AMBIENTAIS"]["QUAISQUER OUTROS FATORES AMBIENTAIS"]
            ["checked"] = false;
      }
    });
  }

//FATORES AMBIENTAIS/PRODUTOS E TECNOLOGIA

  void _handleProdutosTecnologiaChange(bool? value) {
    setState(() {
      icf["FATORES AMBIENTAIS"]["PRODUTOS E TECNOLOGIA"]["checked"] = value!;
      if (!value) {
        icf["FATORES AMBIENTAIS"]["PRODUTOS E TECNOLOGIA"][
                "Produtos ou substâncias para consumo pessoal (comida, remédios)"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["PRODUTOS E TECNOLOGIA"]
            ["Para uso pessoal na vida diária"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["PRODUTOS E TECNOLOGIA"][
                "Mobilidade e transporte pessoal em ambientes internos e externos"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["PRODUTOS E TECNOLOGIA"]
            ["Produtos e tecnologia para comunicação"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["PRODUTOS E TECNOLOGIA"][
                "Produtos e tecnologia usados em projeto, arquitetura e construção de edifícios de uso privado"]
            ["checked"] = false;
      }
    });
  }

//FATORES AMBIENTAIS/AMBIENTE NATURAL E MUDANÇAS AMBIENTAIS

  void _handleAmbienteNaturalMudancasAmbientaisChange(bool? value) {
    setState(() {
      icf["FATORES AMBIENTAIS"]["AMBIENTE NATURAL E MUDANÇAS AMBIENTAIS"]
          ["checked"] = value!;
      if (!value) {
        icf["FATORES AMBIENTAIS"]["AMBIENTE NATURAL E MUDANÇAS AMBIENTAIS"]
            ["Clima"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["AMBIENTE NATURAL E MUDANÇAS AMBIENTAIS"]
            ["Luz"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["AMBIENTE NATURAL E MUDANÇAS AMBIENTAIS"]
            ["Som"]["checked"] = false;
      }
    });
  }

//FATORES AMBIENTAIS/APOIO E RELACIONAMENTOS

  void _handleApoioRelacionamentosChange(bool? value) {
    setState(() {
      icf['FATORES AMBIENTAIS']["APOIO E RELACIONAMENTOS"]["checked"] = value!;
      if (!value) {
        icf['FATORES AMBIENTAIS']["APOIO E RELACIONAMENTOS"]["Família próxima"]
            ["checked"] = false;
        icf['FATORES AMBIENTAIS']["APOIO E RELACIONAMENTOS"]["Amigos"]
            ["checked"] = false;
        icf['FATORES AMBIENTAIS']["APOIO E RELACIONAMENTOS"][
                "Conhecidos, companheiros, colegas, vizinhos e membros da comunidade"]
            ["checked"] = false;
        icf['FATORES AMBIENTAIS']["APOIO E RELACIONAMENTOS"]
            ["Pessoas em posição de autoridade"]["checked"] = false;
        icf['FATORES AMBIENTAIS']["APOIO E RELACIONAMENTOS"]
            ["Cuidadores e assistentes pessoais"]["checked"] = false;
        icf['FATORES AMBIENTAIS']["APOIO E RELACIONAMENTOS"]
            ["Profissionais da saúde"]["checked"] = false;
        icf['FATORES AMBIENTAIS']["APOIO E RELACIONAMENTOS"][
                "Outros profissionais que fornecem serviços relacionados a saúde"]
            ["checked"] = false;
      }
    });
  }

//FATORES AMBIENTAIS/ATITUDES

  void _handleAtitudesChange(bool? value) {
    setState(() {
      icf["FATORES AMBIENTAIS"]["ATITUDES"]["checked"] = value!;
      if (!value) {
        icf["FATORES AMBIENTAIS"]["ATITUDES"]
                ["Atitudes individuais de membros da família imediata"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["ATITUDES"]["Atitudes individuais dos amigos"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["ATITUDES"]
                ["Atitudes individuais dos cuidadores e assistentes pessoais"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["ATITUDES"]
                ["Atitudes individuais dos profissionais da saúde"]["checked"] =
            false;
        icf["FATORES AMBIENTAIS"]["ATITUDES"]
                ["Atitudes individuais dos profissionais relacionados a saúde"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["ATITUDES"]["Atitudes sociais"]["checked"] =
            false;
        icf["FATORES AMBIENTAIS"]["ATITUDES"]
            ["Normas, práticas e ideologias sociais"]["checked"] = false;
      }
    });
  }

//FATORES AMBIENTAIS/SERVIÇOS, SISTEMAS E POLÍTICAS

  void _handleServicosSistemasPoliticasChange(bool? value) {
    setState(() {
      icf["FATORES AMBIENTAIS"]["SERVIÇOS, SISTEMAS E POLÍTICAS"]["checked"] =
          value!;
      if (!value) {
        icf["FATORES AMBIENTAIS"]["SERVIÇOS, SISTEMAS E POLÍTICAS"]["Habitação"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["SERVIÇOS, SISTEMAS E POLÍTICAS"]
            ["De transporte"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["SERVIÇOS, SISTEMAS E POLÍTICAS"]
            ["De suporte social geral"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["SERVIÇOS, SISTEMAS E POLÍTICAS"]["De saúde"]
            ["checked"] = false;
        icf["FATORES AMBIENTAIS"]["SERVIÇOS, SISTEMAS E POLÍTICAS"]
            ["De educação e treinamento"]["checked"] = false;
        icf["FATORES AMBIENTAIS"]["SERVIÇOS, SISTEMAS E POLÍTICAS"]
            ["De trabalho e emprego"]["checked"] = false;
      }
    });
  }

//FATORES AMBIENTAIS/QUAISQUER OUTROS FATORES AMBIENTAIS

  void _handleQuaisquerFatoresAmbientaisChange(bool? value) {
    setState(() {
      icf["FATORES AMBIENTAIS"]["QUAISQUER OUTROS FATORES AMBIENTAIS"]
          ["checked"] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.appBackgroudColor,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            reverse: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                const CustomBackButton(),
                const SizedBox(
                  height: 100,
                ),
                CheckboxListTile(
                  title: const Text('FUNÇÃO CORPORAL'),
                  value: icf["FUNÇÃO CORPORAL"]["checked"],
                  onChanged: _handleFuncaoCorporalChange,
                ),
                if (icf["FUNÇÃO CORPORAL"]["checked"])
                  Column(
                    children: [
                      CheckboxListTile(
                        title: const Text('FUNÇÕES MENTAIS'),
                        value: icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                            ["checked"],
                        onChanged: _handleFuncoesMentaisChange,
                      ),
                      if (icf["FUNÇÃO CORPORAL"]["checked"] &&
                          icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]["checked"])
                        Column(
                          children: [
                            const RadioLegend(values: [0, 1, 2, 3, 4, 8, 9]),
                            CheckboxListTile(
                              title: const Text('Consciência'),
                              value: icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                  ["Consiência"]["checked"],
                              onChanged: _handleConscienciaChange,
                            ),
                            if (icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                ["Consiência"]["checked"])
                              CustomRadio(
                                  values: const [0, 1, 2, 3, 4, 8, 9],
                                  onChanged: (newValue) {
                                    icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                        ["Consiência"]["value"] = newValue;
                                  }),
                            CheckboxListTile(
                              title: const Text(
                                  'Orientação (tempo, lugar, pessoa)'),
                              value: icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                      ["Orientação (tempo, lugar, pessoa)"]
                                  ["checked"],
                              onChanged: _handleOrientacaoChange,
                            ),
                            if (icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                    ["Orientação (tempo, lugar, pessoa)"]
                                ["checked"])
                              CustomRadio(
                                values: const [0, 1, 2, 3, 4, 8, 9],
                                onChanged: (newValue) {
                                  icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                          ["Orientação (tempo, lugar, pessoa)"]
                                      ["value"] = newValue;
                                },
                              ),
                            // TODO fazer funções intelectuais (demência)
                            CheckboxListTile(
                              title: const Text(
                                  'Funções da energia e de impulsos'),
                              value: icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                      ["Funções da energia e de impulsos"]
                                  ["checked"],
                              onChanged: _handleFuncoesEnergiaImpulsosChange,
                            ),
                            if (icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                ["Funções da energia e de impulsos"]["checked"])
                              CustomRadio(
                                  values: const [0, 1, 2, 3, 4, 8, 9],
                                  onChanged: (newValue) {
                                    icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                            ["Funções da energia e de impulsos"]
                                        ["value"] = newValue;
                                  }),
                            CheckboxListTile(
                              title: const Text('Sono'),
                              value: icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                  ["Sono"]["checked"],
                              onChanged: _handleSonoChange,
                            ),
                            if (icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                ["Sono"]["checked"])
                              CustomRadio(
                                  values: const [0, 1, 2, 3, 4, 8, 9],
                                  onChanged: (newValue) {
                                    icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                        ["Sono"]["value"] = newValue;
                                  }),
                            CheckboxListTile(
                              title: const Text('Atenção'),
                              value: icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                  ["Atenção"]["checked"],
                              onChanged: _handleAtencaoChange,
                            ),
                            if (icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                ["Atenção"]["checked"])
                              CustomRadio(
                                  values: const [0, 1, 2, 3, 4, 8, 9],
                                  onChanged: (newValue) {
                                    icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                        ["Atenção"]["value"] = newValue;
                                  })
                          ],
                        ),
                    ],
                  ),
                CheckboxListTile(
                    title: const Text('ESTRUTURA CORPORAL'),
                    value: icf["ESTRUTURA CORPORAL"]["checked"],
                    onChanged: _handleEstruturaCorporalChange),
                if (icf["ESTRUTURA CORPORAL"]["checked"])
                  Column(
                    children: [
                      CheckboxListTile(
                        title: const Text('ESTRUTURA DO SISTEMA NERVOSO'),
                        value: icf["ESTRUTURA CORPORAL"]
                            ["ESTRUTURA DO SISTEMA NERVOSO"]["checked"],
                        onChanged: _handleEstruturaSistemaNervosoChange,
                      ),
                      if (icf["ESTRUTURA CORPORAL"]["checked"] &&
                          icf["ESTRUTURA CORPORAL"]
                              ["ESTRUTURA DO SISTEMA NERVOSO"]["checked"])
                        Column(
                          children: [
                            const RadioLegend(values: [0, 1, 2, 3, 4, 8, 9]),
                            CheckboxListTile(
                              title: const Text('Cérebro'),
                              value: icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                  ["Cérebro"]["checked"],
                              onChanged: (value) {},
                            ),
                            if (icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                ["Consiência"]["checked"])
                              CustomRadio(
                                  values: const [0, 1, 2, 3, 4, 8, 9],
                                  onChanged: (newValue) {
                                    icf["FUNÇÃO CORPORAL"]["FUNÇÕES MENTAIS"]
                                        ["Consiência"]["value"] = newValue;
                                  }),
                          ],
                        ),
                    ],
                  ),
                CheckboxListTile(
                    title: const Text('ATIVIDADES E PARTICIPAÇÃO'),
                    value: icf["ESTRUTURA CORPORAL"]["checked"],
                    onChanged: _handleEstruturaCorporalChange),
                if (icf["ATIVIDADES E PARTICIPAÇÃO"]["checked"])
                  Column(
                    children: [],
                  ),
                CheckboxListTile(
                    title: const Text('FATORES AMBIENTAIS'),
                    value: icf["ESTRUTURA CORPORAL"]["checked"],
                    onChanged: _handleEstruturaCorporalChange),
                if (icf["FATORES AMBIENTAIS"]["checked"])
                  Column(
                    children: [],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
