//+------------------------------------------------------------------+
//|                                                        EaMin.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Trade/Trade.mqh>

enum ENUM_SIM_NAO
  {
   NAO = 0,
   SIM = 1
  };

enum ENUM_MERCADO
  {
   B3 = 0,
   FOREX = 1
  };

enum ENUM_TIPO_OPERACIONAL
  {
   SWING_TRADE = 0,
   DAY_TRADE = 1
  };

enum ENUM_MODO_PROCESSAMENTO
  {
   CADA_TICK = 0,
   CADA_SEGUNDO = 1
  };

enum ENUM_TEMPO_GRAFICO
  {
   CORRENTE = 0,
   M1 = 1,
   M2 = 2,
   M3 = 3,
   M4 = 4,
   M5 = 5,
   M6 = 6,
   M10 = 7,
   M12 = 8,
   M15 = 9,
   M30 = 10,
   H1 = 11,
   H2 = 12,
   H3 = 13,
   H4 = 14,
   H6 = 15,
   H8 = 16,
   H12 = 17,
   D1 = 18,
   W1 = 19,
   MN1 = 20
  };

enum ENUM_TIPO_CALCULO_DISTANCIAS
  {
   PERCENTUAL = 0,
   EM_PONTOS = 1
  };

enum ENUM_MODO_ORDEM
  {
   MERCADO = 0,
   PENDENTE = 1
  };

enum ENUM_REFERENCIA_PRECO
  {
   PRECO_ATUAL = 0,
   PRECO_BASE = 1,
   MAXIMA_VELA_ANTERIOR = 2,
   MINIMA_VELA_ANTERIOR = 3,
   ABERTURA_VELA_ATUAL = 4,
   ABERTURA_VELA_ANTERIOR = 5,
   FECHAMENTO_VELA_ANTERIOR = 6
  };

enum ENUM_QUAL_VELA
  {
   VELA_ULTIMA = 1,
   VELA_PENULTIMA = 2,
   VELA_ANTEPENULTIMA = 3
  };

enum ENUM_REFERENCIA_ALVO_PERSONALIZADO
  {
   REF_PRECO_ATUAL = 0,                // Preco atual
   REF_MAXIMA_ATUAL = 1,               // Maxima atual
   REF_MINIMA_ATUAL = 2,               // Minima atual
   REF_ABERTURA_ATUAL = 3,             // Abertura atual
   REF_MAXIMA_ANTERIOR = 4,            // Maxima anterior
   REF_MINIMA_ANTERIOR = 5,            // Minima anterior
   REF_FECHAMENTO_ANTERIOR = 6,        // Fechamento anterior
   REF_MAXIMA_3_ULTIMOS = 7,           // Maxima dos 3 ultimos
   REF_MINIMA_3_ULTIMOS = 8,           // Minima dos 3 ultimos
   REF_MAXIMA_DO_DIA = 9,              // Maxima do dia
   REF_MINIMA_DO_DIA = 10,             // Minima do dia
   REF_ABERTURA_DO_DIA = 11,           // Abertura do dia
   REF_MAXIMA_DO_DIA_ANTERIOR = 12,    // Maxima do dia anterior
   REF_MINIMA_DO_DIA_ANTERIOR = 13,    // Minima do dia anterior
   REF_FECHAMENTO_DO_DIA_ANTERIOR = 14,// Fechamento do dia anterior
   REF_MELHOR_COMPRADOR_BID = 15,      // Melhor comprador (BID)
   REF_MELHOR_VENDEDOR_ASK = 16        // Melhor vendedor (ASK)
  };

enum ENUM_REFERENCIA_TEMPO_SAIDA
  {
   SEGUNDOS = 0,
   MINUTOS = 1,
   HORAS = 2,
   VELAS = 3
  };

enum ENUM_HORA_DIA
  {
   HORA_00 = 0,
   HORA_01 = 1,
   HORA_02 = 2,
   HORA_03 = 3,
   HORA_04 = 4,
   HORA_05 = 5,
   HORA_06 = 6,
   HORA_07 = 7,
   HORA_08 = 8,
   HORA_09 = 9,
   HORA_10 = 10,
   HORA_11 = 11,
   HORA_12 = 12,
   HORA_13 = 13,
   HORA_14 = 14,
   HORA_15 = 15,
   HORA_16 = 16,
   HORA_17 = 17,
   HORA_18 = 18,
   HORA_19 = 19,
   HORA_20 = 20,
   HORA_21 = 21,
   HORA_22 = 22,
   HORA_23 = 23
  };

enum ENUM_PERIODO_PAUSA
  {
   PAUSA_DIARIAMENTE = 0,
   PAUSA_SEGUNDAS = 1,
   PAUSA_TERCAS = 2,
   PAUSA_QUARTAS = 3,
   PAUSA_QUINTAS = 4,
   PAUSA_SEXTAS = 5,
   PAUSA_SABADOS = 6
  };

enum ENUM_CANAL_BANDAS_INDICADOR
  {
   BANDAS_NAO_USAR = 0,
   BANDAS_BOLLINGER = 2,
   BANDAS_ENVELOPES = 4,
   BANDAS_KELTNER = 5,
   BANDAS_DONCHIAN = 6,
   BANDAS_ATR = 39
  };

enum ENUM_CANAL_BANDAS_ENTRADA
  {
   ENTRADA_NAO_USAR = 0,
   ENTRADA_FECHOU_FORA = 1,
   ENTRADA_FECHOU_DENTRO_SAIU = 2,
   ENTRADA_FECHOU_DENTRO_FECHOU_FORA = 3,
   ENTRADA_FECHOU_FORA_VOLTOU = 4,
   ENTRADA_FECHOU_FORA_FECHOU_DENTRO = 5,
   ENTRADA_ESTANDO_FORA = 6
  };

enum ENUM_CANAL_BANDAS_SENTIDO
  {
   SENTIDO_TENDENCIA = 0,
   SENTIDO_CONTRA_TENDENCIA = 1
  };

enum ENUM_CANAL_BANDAS_SAIDA
  {
   SAIDA_NAO_USAR = 0,
   SAIDA_CRUZAR_CENTRO = 1,
   SAIDA_CRUZAR_CENTRO_FECHAR = 2,
   SAIDA_CRUZAR_BANDA_OPOSTA = 3,
   SAIDA_CRUZAR_OPOSTA_FECHAR = 4
  };

enum ENUM_SINAL_FONTE
  {
   FONTE_NAO_USAR = 0,
   FONTE_FECHAMENTO_VELA = -2,
   FONTE_ABERTURA_VELA = -3,
   FONTE_MAXIMA_VELA = -4,
   FONTE_MINIMA_VELA = -5,
   FONTE_MEDIA_MOVEL = 1,
   FONTE_VIDYA = 17,
   FONTE_DEMA = 18,
   FONTE_TEMA = 19,
   FONTE_FRAMA = 20
  };

enum ENUM_SINAL_ENTRADA
  {
   SINAL_ENTRADA_NAO_USAR = 0,
   SINAL_ENTRADA_CRUZAMENTO = 1,
   SINAL_ENTRADA_CRUZAMENTO_FECHANDO = 2
  };

enum ENUM_SINAL_SENTIDO
  {
   SINAL_SENTIDO_TENDENCIA = 0,
   SINAL_SENTIDO_CONTRA_TENDENCIA = 1
  };

enum ENUM_SINAL_SAIDA
  {
   SINAL_SAIDA_NAO_USAR = 0,
   SINAL_SAIDA_CRUZAMENTO_OPOSTO = 1,
   SINAL_SAIDA_CRUZAR_OPOSTO_FECHAR = 2
  };

enum ENUM_OSCILADOR_INDICADOR
  {
   NAO_USAR = 0,
   MACD = 3,
   ESTOCASTICO = 7,
   RSI = 8,
   MFI = 16,
   BEARS_POWER = 22,
   BULLS_POWER = 23,
   CHAIKIN_OSCILADOR = 24,
   ACCELERATOR_OSCILADOR = 25,
   AWESOME_OSCILADOR = 26,
   CCI = 27,
   DEMARKER = 28,
   REGRESSAO = 36,
   AFASTAMENTO_MEDIA = 37,
   DESVIO_MEDIO = 38,
   MARKET_FACILITATION_INDEX = 40
  };

enum ENUM_OSCILADOR_ENTRADA
  {
   OSCILADOR_ENTRADA_NAO_USAR = 0,
   OSCILADOR_ENTRADA_FECHOU_FORA = 1,
   OSCILADOR_ENTRADA_FECHOU_DENTRO_SAIU = 2,
   OSCILADOR_ENTRADA_FECHOU_DENTRO_FECHOU_FORA = 3,
   OSCILADOR_ENTRADA_FECHOU_FORA_VOLTOU = 4,
   OSCILADOR_ENTRADA_FECHOU_FORA_FECHOU_DENTRO = 5,
   OSCILADOR_ENTRADA_ESTANDO_FORA = 6
  };

enum ENUM_OSCILADOR_SENTIDO
  {
   OSCILADOR_SENTIDO_TENDENCIA = 0,
   OSCILADOR_SENTIDO_CONTRA_TENDENCIA = 1
  };

enum ENUM_OSCILADOR_SAIDA
  {
   OSCILADOR_SAIDA_NAO_USAR = 0,
   OSCILADOR_SAIDA_CRUZAR_CENTRO = 1,
   OSCILADOR_SAIDA_CRUZAR_CENTRO_FECHAR = 2,
   OSCILADOR_SAIDA_CRUZAR_BANDA_OPOSTA = 3,
   OSCILADOR_SAIDA_CRUZAR_OPOSTA_FECHAR = 4
  };

enum ENUM_CONFIGURAR_INDICADORES
  {
   CONFIG_IND_NAO_USAR = 0,                      // Nao usar
   CONFIG_IND_EXTERNO = 30,                      // Externo
   CONFIG_IND_KELTNER = 5,                       // Keltner
   CONFIG_IND_DOCHIAN = 6,                       // Dochian
   CONFIG_IND_REGRESSAO = 36,                    // Regressao
   CONFIG_IND_AFASTAMENTO_MEDIA = 37,            // Afastamento da media
   CONFIG_IND_DESVIO_MEDIO = 38,                 // Desvio Medio
   CONFIG_IND_CANAL_ATR = 39,                    // Canal ATR
   CONFIG_IND_MEDIA_MOVEL = 1,                   // Media Movel
   CONFIG_IND_BANDAS_BOLINGER = 2,               // Bandas de Bolinger
   CONFIG_IND_MACD = 3,                          // MACD
   CONFIG_IND_ENVELOPES = 4,                     // Envelopes
   CONFIG_IND_ESTOCASTICO = 7,                   // Estocastico
   CONFIG_IND_RSI = 8,                           // Relative Strength Index (RSI)
   CONFIG_IND_DESVIO_PADRAO = 9,                 // Desvio Padrao
   CONFIG_IND_VOLUME = 10,                       // Volume
   CONFIG_IND_ATR = 11,                          // Average True Range (ATR)
   CONFIG_IND_PARABOLIC_SAR = 12,                // Parabolic SAR
   CONFIG_IND_FRACTAL = 13,                      // Fractal
   CONFIG_IND_OBV = 14,                          // On Balance Volume (OBV)
   CONFIG_IND_ACUMULACAO_DISTRIBUICAO = 15,      // Acumulacao/Distribuicao (A/D)
   CONFIG_IND_MFI = 16,                          // Money Flow Index (MFI)
   CONFIG_IND_VIDYA = 17,                        // Vidya
   CONFIG_IND_DEMA = 18,                         // Dema
   CONFIG_IND_TEMA = 19,                         // Tema
   CONFIG_IND_FRAMA = 20,                        // Frama
   CONFIG_IND_TRIX = 21,                         // Trix
   CONFIG_IND_BEARS_POWER = 22,                  // Bears Power
   CONFIG_IND_BULLS_POWER = 23,                  // Bulls Power
   CONFIG_IND_CHAIKIN_OSCILADOR = 24,            // Chaikin Oscilador
   CONFIG_IND_ACCELERATOR_OSCILADOR = 25,        // Accelerator Oscilador
   CONFIG_IND_AWESOME_OSCILADOR = 26,            // Awesome Oscilador
   CONFIG_IND_CCI = 27,                          // Commodity Channel Index (CCI)
   CONFIG_IND_DEMARKER = 28,                     // DeMarker
   CONFIG_IND_ALLIGATOR = 29,                    // Alligator
   CONFIG_IND_ICHIMOKU = 31,                     // Nuvem de Ichimoku
   CONFIG_IND_ADX = 32,                          // Average Directional Index (ADX)
   CONFIG_IND_ADX_WELLES_WILDER = 33,            // ADX Welles Wilder
   CONFIG_IND_GATOR_OSCILADOR = 34,              // Gator Oscilador
   CONFIG_IND_WPR = 35,                          // Williams Percent Range (WPR)
   CONFIG_IND_MARKET_FACILITATION_INDEX = 40,    // Market Facilitation Index
   CONFIG_IND_MOMENTUM = 41,                     // Momentum
   CONFIG_IND_RVI = 42                           // Relative Vigor Index (RVI)
  };

enum ENUM_COMANDO_CONDICAO
  {
   COMANDO_SE = 0,                               // SE
   COMANDO_E = 1,                                // E
   COMANDO_OU = 2,                               // OU
   COMANDO_E_SE = 3,                             // E SE
   COMANDO_OU_SE = 4,                            // OU SE
   COMANDO_E_TAMBEM = 5,                         // E Tambem
   COMANDO_OU_TAMBEM = 6                         // OU Tambem
  };

enum ENUM_MENU_CONDICAO
  {
   MENU_NAO_USAR = 0,                            // Nao usar
   MENU_VALOR_ABSOLUTO = 1,                      // Valor absoluto
   MENU_VALOR_EM_PONTOS = -5,                    // Valor em pontos
   MENU_PRECO_ENTRADA = -6,                      // Preco de entrada
   MENU_PRECO_MEDIO = -7,                        // Preco medio
   MENU_PRECO_ATUAL = -4,                        // Preco atual
   MENU_FECHAMENTO_VELA = 2,                     // Fechamento da vela
   MENU_ABERTURA_VELA = 3,                       // Abertura da vela
   MENU_MAXIMA_VELA = 4,                         // Maxima da vela
   MENU_MINIMA_VELA = 5,                         // Minima da vela
   MENU_FECHAMENTO_DIA = 6,                      // Fechamento do dia
   MENU_ABERTURA_DIA = 7,                        // Abertura do dia
   MENU_MAXIMA_DIA = 8,                          // Maxima do dia
   MENU_MINIMA_DIA = 9,                          // Minima do dia
   MENU_TAMANHO_VELA = -1,                       // Tamanho da vela
   MENU_CORPO_VELA = -2,                         // Corpo da vela
   MENU_EMPTY_VALUE = -3,                        // Empty Value
   MENU_INDICADOR_1 = 10,                        // Indicador 1
   MENU_INDICADOR_2 = 20,                        // Indicador 2
   MENU_INDICADOR_3 = 30,                        // Indicador 3
   MENU_INDICADOR_4 = 40                         // Indicador 4
  };

enum ENUM_BANDAS_BOLINGER_SINAL
  {
   BOLINGER_CENTRAL = 0,                         // Bolinger central
   BOLINGER_SUPERIOR = 1,                        // Bolinger superior
   BOLINGER_INFERIOR = 2                         // Bolinger inferior
  };

enum ENUM_MACD_ENTRADA
  {
   MACD_HISTOGRAMA = 0,                          // MACD histograma
   MACD_SINAL = 1                                // MACD sinal
  };

enum ENUM_ENVELOPE_ENTRADA
  {
   ENVELOPE_SUPERIOR = 0,                        // Envelope superior
   ENVELOPE_INFERIOR = 1                         // Envelope inferior
  };

enum ENUM_ESTOCASTICO_ENTRADA
  {
   ESTOCASTICO_PRINCIPAL = 0,                    // Estocastico principal
   ESTOCASTICO_SINAL = 1                         // Estocastico sinal
  };

enum ENUM_RSI_ENTRADA
  {
   RSI_ENTRADA_RSI = 0                           // RSI
  };

enum ENUM_MFI_ENTRADA
  {
   MFI_ENTRADA_MFI = 0                           // MFI
  };

enum ENUM_VIDYA_ENTRADA
  {
   VIDYA_ENTRADA_VIDYA = 0                       // Vidya
  };

enum ENUM_DEMA_ENTRADA
  {
   DEMA_ENTRADA_DEMA = 0                         // Dema
  };

enum ENUM_TEMA_ENTRADA
  {
   TEMA_ENTRADA_TEMA = 0                         // Tema
  };

enum ENUM_FRAMA_ENTRADA
  {
   FRAMA_ENTRADA_FRAMA = 0                       // Frama
  };

enum ENUM_TRIX_ENTRADA
  {
   TRIX_ENTRADA_TRIX = 0                         // Trix
  };

enum ENUM_BEARS_POWER_ENTRADA
  {
   BEARS_POWER_ENTRADA_BEARS_POWER = 0           // Bears Power
  };

enum ENUM_BULLS_POWER_ENTRADA
  {
   BULLS_POWER_ENTRADA_BULLS_POWER = 0           // Bulls Power
  };

enum ENUM_CHAIKIN_OSCILADOR_ENTRADA
  {
   CHAIKIN_OSCILADOR_ENTRADA_CHAIKIN_OSCILADOR = 0 // Chaikin Oscilador
  };

enum ENUM_ACCELERATOR_OSCILADOR_ENTRADA
  {
   ACCELERATOR_OSCILADOR_ENTRADA_ACCELERATOR_OSCILADOR = 0 // Accelerator Oscilador
  };

enum ENUM_AWESOME_OSCILADOR_ENTRADA
  {
   AWESOME_OSCILADOR_ENTRADA_AWESOME_OSCILADOR = 0 // Awesome Oscilador
  };

enum ENUM_CCI_ENTRADA
  {
   CCI_ENTRADA_CCI = 0                           // CCI
  };

enum ENUM_DEMARKER_ENTRADA
  {
   DEMARKER_ENTRADA_DEMARKER = 0                 // DeMarker
  };

enum ENUM_ALLIGATOR_ENTRADA
  {
   ALLIGATOR_ENTRADA_MANDIBULA = 0,              // Alligator mandibula
   ALLIGATOR_ENTRADA_DENTE = 1,                  // Alligator dente
   ALLIGATOR_ENTRADA_BOCA = 2                    // Alligator boca
  };

enum ENUM_ICHIMOKU_ENTRADA
  {
   ICHIMOKU_ENTRADA_TENKAN_SEN = 0,              // Ichimoku Tenkan-sen
   ICHIMOKU_ENTRADA_KIJUN_SEN = 1,               // Ichimoku Kijun-sen
   ICHIMOKU_ENTRADA_SENKOU_SPAN_A = 2,           // Ichimoku Senkou Span A
   ICHIMOKU_ENTRADA_SENKOU_SPAN_B = 3,           // Ichimoku Senkou Span B
   ICHIMOKU_ENTRADA_CHINKOU_SPAN = 4             // Ichimoku Chinkou Span
  };

enum ENUM_ADX_ENTRADA
  {
   ADX_ENTRADA_MAIN = 0,                         // ADX Main
   ADX_ENTRADA_DI_POSITIVO = 1,                  // ADX DI+
   ADX_ENTRADA_DI_NEGATIVO = 2                   // ADX DI-
  };

enum ENUM_ADX_WILDER_ENTRADA
  {
   ADX_WILDER_ENTRADA_MAIN = 0,                  // ADX Wilder Main
   ADX_WILDER_ENTRADA_DI_POSITIVO = 1,           // ADX Wilder DI+
   ADX_WILDER_ENTRADA_DI_NEGATIVO = 2            // ADX Wilder DI-
  };

enum ENUM_GATOR_ENTRADA
  {
   GATOR_ENTRADA_SUPERIOR = 0,                   // Gator Superior
   GATOR_ENTRADA_INFERIOR = 1                    // Gator Inferior
  };

enum ENUM_WPR_ENTRADA
  {
   WPR_ENTRADA_WPR = 0                           // WPR
  };

enum ENUM_MARKET_FACILITATION_INDEX_ENTRADA
  {
   MARKET_FACILITATION_INDEX_ENTRADA_MARKET_FACILITATION_INDEX = 0 // Market Facilitation Index
  };

enum ENUM_MOMENTUM_ENTRADA
  {
   MOMENTUM_ENTRADA_MOMENTUM = 0                 // Momentum
  };

enum ENUM_RVI_ENTRADA
  {
   RVI_ENTRADA_PRINCIPAL = 0,                    // RVI Principal
   RVI_ENTRADA_SINAL = 1                         // RVI Sinal
  };

enum ENUM_DESVIO_PADRAO_ENTRADA
  {
   DESVIO_PADRAO_ENTRADA_DESVIO_PADRAO = 0       // Desvio padrao
  };

enum ENUM_VOLUME_ENTRADA
  {
   VOLUME_ENTRADA_VOLUME = 0                     // Volume
  };

enum ENUM_ATR_ENTRADA
  {
   ATR_ENTRADA_ATR = 0                           // ATR
  };

enum ENUM_PARABOLIC_SAR_ENTRADA
  {
   PARABOLIC_SAR_ENTRADA_PARABOLIC_SAR = 0       // Parabolic SAR
  };

enum ENUM_FRACTAL_ENTRADA
  {
   FRACTAL_SUPERIOR = 0,                         // Fractal superior
   FRACTAL_INFERIOR = 1                          // Fractal inferior
  };

enum ENUM_OBV_ENTRADA
  {
   OBV_ENTRADA_OBV = 0                           // OBV
  };

enum ENUM_MEDIA_MOVEL_ENTRADA
  {
   MEDIA_MOVEL_ENTRADA_MEDIA_MOVEL = 0           // Media movel
  };

enum ENUM_KELTNER_ENTRADA
  {
   KELTNER_CENTRAL = 0,                          // Keltner central
   KELTNER_SUPERIOR = 1,                         // Keltner superior
   KELTNER_INFERIOR = 2                          // Keltner inferior
  };

enum ENUM_DOCHIAN_ENTRADA
  {
   DOCHIAN_CENTRAL = 0,                          // Donchian central
   DOCHIAN_SUPERIOR = 1,                         // Donchian superior
   DOCHIAN_INFERIOR = 2                          // Donchian inferior
  };

enum ENUM_REGRESSAO_ENTRADA
  {
   REGRESSAO_RATIO = 0                           // Ratio
  };

enum ENUM_AFASTAMENTO_MEDIA_ENTRADA
  {
   AFASTAMENTO_MEDIA_ENTRADA_AFASTAMENTO_MEDIO = 0 // Afastamento medio
  };

enum ENUM_DESVIO_MEDIO_ENTRADA
  {
   DESVIO_MEDIO_ENTRADA_DESVIO_AFASTAMENTO = 0,   // Desvio Afastamento
   DESVIO_MEDIO_ENTRADA_DESVIO_MEDIO = 1          // Desvio Medio
  };

enum ENUM_CANAL_ATR_ENTRADA
  {
   CANAL_ATR_CENTRAL = 0,                         // ATR Central
   CANAL_ATR_SUPERIOR = 1,                        // ATR Superior
   CANAL_ATR_INFERIOR = 2                         // ATR Inferior
  };

enum ENUM_AD_ENTRADA
  {
   AD_ENTRADA_AD = 0                              // A/D
  };

enum ENUM_SIMPLES_VELA
  {
   SIMPLES_VELA_ATUAL = 0,                       // Vela atual
   SIMPLES_VELA_ANTERIOR = 1,                    // Vela anterior
   SIMPLES_VELA_PENULTIMA = 2,                   // Penultima vela
   SIMPLES_VELA_ANTI_PENULTIMA = 3               // Anti penultima
  };

enum ENUM_OPCAO_COMPARACAO
  {
   COMPARAR_MAIOR_QUE = 0,                       // Maior que
   COMPARAR_MENOR_QUE = 1,                       // Menor que
   COMPARAR_MAIOR_IGUAL_QUE = 2,                 // Maior ou igual que
   COMPARAR_MENOR_IGUAL_QUE = 3,                 // Menor ou igual que
   COMPARAR_IGUAL_QUE = 4,                       // Igual que
   COMPARAR_DIFERENTE_DE = 5,                    // Diferente de
   COMPARAR_CRUZAR_CIMA_DE = 6,                  // Cruzar p/ cima de
   COMPARAR_CRUZAR_BAIXO_DE = 7,                 // Cruzar p/ baixo de
   COMPARAR_CRUZAR_FECHAR_ACIMA_DE = 8,          // Cruzar&fechar acima de
   COMPARAR_CRUZAR_FECHAR_ABAIXO_DE = 9          // Cruzar&fechar abaixo de
  };

input group "1.Nome";
input string Nome = "EaMin";

input group "2.Direcao";
input ENUM_SIM_NAO OperarCompra = SIM; // Deseja operar na compra
input ENUM_SIM_NAO OperarVenda = SIM;  // Deseja operar na venda

input group "3.Mercado";
input ENUM_MERCADO Mercado = FOREX;                           // Escolha o mercado
input ENUM_TIPO_OPERACIONAL TipoOperacional = DAY_TRADE;     // Selecione o tipo operacional
input ENUM_MODO_PROCESSAMENTO ModoProcessamento = CADA_TICK; // Modo de processamento

input group "4.Configuracao inicial";
input ENUM_TEMPO_GRAFICO TempoGrafico = CORRENTE; // Tempo grafico
input double VolumeInicial = 1.0;                 // Volume inicial
input int SpreadMaximo = 0;                       // Spread maximo (pontos)

input group "5.Tipo de ordens";
input ENUM_MODO_ORDEM TipoOrdemEntrada = MERCADO; // Tipo da ordem de entrada: mercado ou pendente
input ENUM_MODO_ORDEM TipoOrdemSaida = MERCADO;   // Tipo da ordem de saida: mercado ou pendente

input group "5.1.Pendente entrada";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoDistanciaEntrada = PERCENTUAL; // Usar somente se TipoOrdemEntrada = PENDENTE
input double DistanciaEntrada = 0.0;                                        // Distancia da entrada pendente (percentual ou pontos)
input int ExpiracaoEntradaMinutos = 0;                                      // Expiracao da entrada pendente em minutos (0 = sem expiracao)
input ENUM_REFERENCIA_PRECO ReferenciaPrecoEntrada = PRECO_ATUAL;           // Referencia de preco da entrada pendente
input ENUM_QUAL_VELA QualVelaEntrada = VELA_ULTIMA;                         // Qual vela (exceto ref atual/base/abertura atual)

input group "5.2.Pendente saida";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoDistanciaSaida = PERCENTUAL; // Usar somente se TipoOrdemSaida = PENDENTE
input double DistanciaSaida = 0.0;                                          // Distancia da saida pendente (percentual ou pontos)
input int ExpiracaoSaidaMinutos = 0;                                        // Expiracao da saida pendente em minutos (0 = sem expiracao)
input ENUM_REFERENCIA_PRECO ReferenciaPrecoSaida = PRECO_ATUAL;             // Referencia de preco da saida pendente
input ENUM_QUAL_VELA QualVelaSaida = VELA_ULTIMA;                           // Qual vela (exceto ref atual/base/abertura atual)

input group "6.Alvos personalizados";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoDistanciaAlvos = PERCENTUAL; // Tipo de calculo das distancias dos alvos

input group "6.1.Stoploss personalizado";
input ENUM_SIM_NAO UsarStopPersonalizado = NAO;                                         // Usar stop personalizado
input double DistanciaOrdemStop = 0.0;                                                   // Distancia ordem stop (percentual ou pontos)
input ENUM_REFERENCIA_ALVO_PERSONALIZADO ReferenciaStoplossCompra = REF_PRECO_ATUAL;    // Stoploss da compra
input ENUM_REFERENCIA_ALVO_PERSONALIZADO ReferenciaStoplossVenda = REF_PRECO_ATUAL;     // Stoploss da venda

input group "6.2.Takeprofit personalizado";
input ENUM_SIM_NAO UsarTakePersonalizado = NAO;                                          // Usar take personalizado
input double DistanciaOrdemTake = 0.0;                                                   // Distancia ordem take (percentual ou pontos)
input ENUM_REFERENCIA_ALVO_PERSONALIZADO ReferenciaTakeprofitCompra = REF_PRECO_ATUAL;  // Takeprofit da compra
input ENUM_REFERENCIA_ALVO_PERSONALIZADO ReferenciaTakeprofitVenda = REF_PRECO_ATUAL;   // Takeprofit da venda

input group "7.Stoploss";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoStoploss = EM_PONTOS; // Tipo de calculo do stoploss (em pontos ou percentual)
input double StoplossInicial = 0.0;                                  // Stoploss inicial
input double InicioBreakEvenSL = 0.0;                                // Inicio do Break Even SL
input double DistanciaBreakEvenSL = 0.0;                             // Distancia do Break Even SL
input double InicioTrailingStop = 0.0;                               // Inicio do Trailling Stop
input double PassoTrailingStop = 0.0;                                // Passo do Trailling Stop

input group "8.Take Profit";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoTakeProfit = PERCENTUAL; // Tipo de calculo do take profit (em pontos ou percentual)
input double TakeProfitInicial = 0.0;                                   // TakeProfit inicial
input double InicioBreakEvenTP = 0.0;                                   // Inicio do Break Even TP
input double DistanciaBreakEvenTP = 0.0;                                // Distancia do Break Even TP
input double InicioTrailingProfit = 0.0;                                // Inicio do Trailling Profit
input double PassoTrailingProfit = 0.0;                                 // Passo do Trailling Profit

input group "9.Saida temporal";
input ENUM_REFERENCIA_TEMPO_SAIDA ReferenciaTempoSaida = MINUTOS; // Referencia de tempo (segundos, minutos, horas ou velas)

input group "9.1.Operacoes positivas";
input int TempoSaidaOperacaoPositiva = 0;      // Tempo de saida
input double SaldoMaximoPositivo = 0.0;        // Saldo maximo (financeiro)
input double SaldoMinimoPositivo = 0.0;        // Saldo minimo (financeiro)

input group "9.2.Operacoes negativas";
input int TempoSaidaOperacaoNegativa = 0;      // Tempo de saida
input double SaldoMaximoNegativo = 0.0;        // Saldo maximo (financeiro)
input double SaldoMinimoNegativo = 0.0;        // Saldo minimo (financeiro)

input group "10.Filtro de tempo";
input ENUM_REFERENCIA_TEMPO_SAIDA ReferenciaTempoFiltro = SEGUNDOS; // Referencia de tempo para filtro (segundos, min, horas ou velas)
input int TempoParaNovaEntrada = 0;                                  // Tempo para nova entrada
input int TempoMinPosicao = 0;                                       // Tempo min de posicao

input group "11.Horarios";
input ENUM_HORA_DIA HorarioInicialHora = HORA_00;   // Horario inicial das operacoes (hora)
input int HorarioInicialMin = 0;             // Horario inicial das operacoes (min: 0 a 59)
input ENUM_HORA_DIA HorarioFinalHora = HORA_22;     // Horario final das operacoes (hora)
input int HorarioFinalMin = 0;               // Horario final das operacoes (min: 0 a 59)
input ENUM_SIM_NAO DesejaZerarPorHorario = SIM; // Deseja zerar por horario
input ENUM_HORA_DIA HorarioZerarHora = HORA_23;     // Horario de zerar as operacoes (hora) - Somente se deseja zerar por horario
input int HorarioZerarMin = 0;               // Horario de zerar as operacoes (min: 0 a 59) - Somente se deseja zerar por horario

input group "12.Pausas operacionais";
input ENUM_REFERENCIA_TEMPO_SAIDA ReferenciaTempoPausa = SEGUNDOS; // Referencia de tempo para as pausas

input group "12.1.Primeira pausa";
input ENUM_HORA_DIA PrimeiraPausaHora = HORA_00;                    // Pausa (hora: 0 a 23)
input ENUM_HORA_DIA PrimeiraPausaMin = HORA_00;                     // Pausa (min: 0 a 23)
input ENUM_PERIODO_PAUSA PrimeiraPausaPeriodo = PAUSA_DIARIAMENTE;  // Periodo da primeira pausa
input int PrimeiraPausaDuracao = 0;                                 // Duracao da primeira pausa

input group "12.2.Segunda pausa";
input ENUM_HORA_DIA SegundaPausaHora = HORA_00;                     // Pausa (hora: 0 a 23)
input ENUM_HORA_DIA SegundaPausaMin = HORA_00;                      // Pausa (min: 0 a 23)
input ENUM_PERIODO_PAUSA SegundaPausaPeriodo = PAUSA_DIARIAMENTE;   // Periodo da segunda pausa
input int SegundaPausaDuracao = 0;                                  // Duracao da segunda pausa

input group "13.Aumento contra";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoAumentoContra = EM_PONTOS; // Tipo de calculo da distancia (em pontos ou percentual)
input double DistanciaContra1 = 0.0;                                       // Distancia contra 1
input double VolumeContra1 = 0.0;                                          // Volume contra 1
input double DistanciaContra2 = 0.0;                                       // Distancia contra 2
input double VolumeContra2 = 0.0;                                          // Volume contra 2
input double DistanciaContra3 = 0.0;                                       // Distancia contra 3
input double VolumeContra3 = 0.0;                                          // Volume contra 3
input double DistanciaContra4 = 0.0;                                       // Distancia contra 4
input double VolumeContra4 = 0.0;                                          // Volume contra 4
input double DistanciaContra5 = 0.0;                                       // Distancia contra 5
input double VolumeContra5 = 0.0;                                          // Volume contra 5

input group "14.Aumento a favor";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoAumentoFavor = EM_PONTOS; // Tipo de calculo da distancia (em pontos ou percentual)
input double DistanciaFavor1 = 0.0;                                      // Distancia a favor 1
input double VolumeFavor1 = 0.0;                                         // Volume a favor 1
input double DistanciaFavor2 = 0.0;                                      // Distancia a favor 2
input double VolumeFavor2 = 0.0;                                         // Volume a favor 2
input double DistanciaFavor3 = 0.0;                                      // Distancia a favor 3
input double VolumeFavor3 = 0.0;                                         // Volume a favor 3
input double DistanciaFavor4 = 0.0;                                      // Distancia a favor 4
input double VolumeFavor4 = 0.0;                                         // Volume a favor 4
input double DistanciaFavor5 = 0.0;                                      // Distancia a favor 5
input double VolumeFavor5 = 0.0;                                         // Volume a favor 5

input group "15.Saidas parciais";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoSaidasParciais = EM_PONTOS; // Tipo de calculo da distancia das parciais (em pontos ou percentual)
input double DistanciaParcial1 = 0.0;                                       // Distancia parcial 1
input double VolumeParcial1 = 0.0;                                          // Volume parcial 1
input double DistanciaParcial2 = 0.0;                                       // Distancia parcial 2
input double VolumeParcial2 = 0.0;                                          // Volume parcial 2
input double DistanciaParcial3 = 0.0;                                       // Distancia parcial 3
input double VolumeParcial3 = 0.0;                                          // Volume parcial 3
input double DistanciaParcial4 = 0.0;                                       // Distancia parcial 4
input double VolumeParcial4 = 0.0;                                          // Volume parcial 4

input group "16.Filtro de vela";
input ENUM_TEMPO_GRAFICO TempoGraficoVelaFiltro = CORRENTE; // Tempo grafico da vela filtro
input double TamanhoMinimoVela = 0.0;                        // Tamanho minimo da vela (em pontos)
input double TamanhoMaximoVela = 0.0;                        // Tamanho maximo da vela (em pontos)
input double MinimoCorpoVela = 0.0;                          // Minimo do corpo da vela (em pontos)
input double MaximoCorpoVela = 0.0;                          // Maximo do corpo da vela (em pontos)

input group "17.Canal de bandas";
input ENUM_CANAL_BANDAS_INDICADOR IndicadorCanalBandas = BANDAS_NAO_USAR;   // Indicador
input ENUM_CANAL_BANDAS_ENTRADA EntradaCanalBandas = ENTRADA_NAO_USAR;       // Entrada
input ENUM_CANAL_BANDAS_SENTIDO SentidoCanalBandas = SENTIDO_TENDENCIA;      // Sentido
input ENUM_CANAL_BANDAS_SAIDA SaidaCanalBandas = SAIDA_NAO_USAR;             // Saida

input group "17.1.Bandas de Bolinger";
input int PeriodoBandasBolinger = 20;                    // Periodo
input double DesviosBandasBolinger = 2.0;               // Desvios
input int DeslocamentoBandasBolinger = 0;               // Deslocamento
input ENUM_APPLIED_PRICE ModoPrecoBandasBolinger = PRICE_CLOSE; // Modo de preco

input group "17.2.Envelopes";
input int PeriodoEnvelopes = 14;                         // Periodo
input int DeslocamentoEnvelopes = 0;                     // Deslocamento
input ENUM_MA_METHOD TipoMediaEnvelopes = MODE_SMA;      // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoEnvelopes = PRICE_CLOSE; // Modo de preco
input double DesviosEnvelopes = 1.0;                     // Desvios

input group "17.3.Keltner";
input int PeriodoKeltner = 20;                           // Periodo
input double DesviosKeltner = 2.0;                       // Desvios
input ENUM_MA_METHOD TipoMediaKeltner = MODE_SMA;        // Tipo de media

input group "17.4.Dochian";
input int PeriodoDochian = 21;                           // Periodo

input group "17.5.Canal ATR";
input int PeriodoCanalATR = 14;                          // Periodo
input double DesviosCanalATR = 2.0;                      // Desvios

input group "18.Cruzamento de sinais";
input ENUM_SINAL_FONTE SinalRapido = FONTE_MAXIMA_VELA;                                            // Sinal rapido
input ENUM_SINAL_FONTE SinalLento = FONTE_FECHAMENTO_VELA;                                         // Sinal lento
input ENUM_SINAL_ENTRADA EntradaCruzamento = SINAL_ENTRADA_CRUZAMENTO;                             // Entrada
input ENUM_SINAL_SENTIDO SentidoCruzamento = SINAL_SENTIDO_CONTRA_TENDENCIA;                       // Sentido
input ENUM_SINAL_SAIDA SaidaCruzamento = SINAL_SAIDA_CRUZAMENTO_OPOSTO;                            // Saida

input group "19.Sobre comprado/vendido";
input ENUM_OSCILADOR_INDICADOR IndicadorSobreCompraVenda = ESTOCASTICO; // Indicador
input ENUM_OSCILADOR_ENTRADA EntradaSobreCompraVenda = OSCILADOR_ENTRADA_NAO_USAR;               // Entrada
input double NivelSobrecompra = 2.0;                                                              // Sobrecompra
input double NivelSobrevenda = 2.0;                                                               // Sobrevenda
input ENUM_OSCILADOR_SENTIDO SentidoSobreCompraVenda = OSCILADOR_SENTIDO_TENDENCIA;              // Sentido
input ENUM_OSCILADOR_SAIDA SaidaSobreCompraVenda = OSCILADOR_SAIDA_NAO_USAR;                     // Saida

input group "19.1.MACD";
input int EMARapidaMACD = 12;                               // EMA rapida
input int EMALentaMACD = 26;                                // EMA lenta
input int SinalMACD = 9;                                    // Sinal
input ENUM_APPLIED_PRICE ModoPrecoMACD = PRICE_CLOSE;      // Modo de preco

input group "19.2.Estocastico";
input int KPeriodoEstocastico = 5;                          // K Periodo
input int DPeriodoEstocastico = 3;                          // D Periodo
input int LentidaoEstocastico = 3;                          // Lentidao
input ENUM_MA_METHOD TipoMediaEstocastico = MODE_SMA;       // Tipo de media
input ENUM_STO_PRICE TipoEstocastico = STO_LOWHIGH;         // Tipo estocastico

input group "19.3.RSI";
input int PeriodoRSI = 14;                                  // Periodo
input ENUM_APPLIED_PRICE ModoPrecoRSI = PRICE_CLOSE;        // Modo de preco

input group "19.4.MFI";
input int PeriodoMFI = 14;                                  // Periodo
input ENUM_APPLIED_VOLUME VolumeMFI = VOLUME_TICK;          // Volume

input group "19.5.Bears Power";
input int PeriodoBearsPower = 13;                           // Periodo

input group "19.6.Bulls Power";
input int PeriodoBullsPower = 13;                           // Periodo

input group "19.7.Chaikin Oscilador";
input int MediaRapidaChaikinOscilador = 3;                 // Media rapida
input int MediaLentaChaikinOscilador = 10;                 // Media lenta
input ENUM_MA_METHOD TipoMediaChaikinOscilador = MODE_SMA; // Tipo de media
input ENUM_APPLIED_VOLUME VolumeChaikinOscilador = VOLUME_TICK; // Volume

input group "19.8.CCI";
input int PeriodoCCI = 14;                                  // Periodo
input ENUM_APPLIED_PRICE ModoPrecoCCI = PRICE_CLOSE;        // Modo de preco

input group "19.9.DeMarker";
input int PeriodoDeMarker = 14;                             // Periodo

input group "19.10.Regressao";
input int PeriodoRegressao = 18;                            // Periodo
input ENUM_MA_METHOD TipoMediaRegressao = MODE_SMA;         // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoRegressao = PRICE_CLOSE;  // Modo de preco

input group "19.11.Afastamento da media";
input int PeriodoAfastamentoMedia = 14;                     // Periodo
input int DeslocamentoAfastamentoMedia = 0;                 // Deslocamento
input ENUM_MA_METHOD TipoMediaAfastamentoMedia = MODE_SMA;  // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoAfastamentoMedia = PRICE_CLOSE; // Modo de preco

input group "19.12.Desvio Medio";
input int PeriodoDesvioMedio = 20;                          // Periodo
input ENUM_MA_METHOD TipoMediaDesvioMedio = MODE_SMA;       // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoDesvioMedio = PRICE_CLOSE; // Modo de preco

input group "19.13.Market Facilitation Index";
input ENUM_APPLIED_VOLUME VolumeMarketFacilitationIndex = VOLUME_TICK; // Volume

input group "20.Selecionar indicadores";

input group "20.a.Indicador 1 - Compra";
input ENUM_CONFIGURAR_INDICADORES ConfigurarIndicador1 = CONFIG_IND_BANDAS_BOLINGER; // Indicador 1
input ENUM_COMANDO_CONDICAO ComandoIndicador1 = COMANDO_SE;                           // Conector logico
input ENUM_MENU_CONDICAO Menu1Indicador1 = MENU_NAO_USAR;                             // Fonte A
input ENUM_SIMPLES_VELA Simples1Indicador1 = SIMPLES_VELA_ATUAL;                      // Ativacao da regra
input ENUM_OPCAO_COMPARACAO OpcaoIndicador1 = COMPARAR_MAIOR_QUE;                     // Operador de comparacao
input ENUM_MENU_CONDICAO Menu2Indicador1 = MENU_NAO_USAR;                             // Fonte B / Indicador
input ENUM_SIMPLES_VELA Simples2Indicador1 = SIMPLES_VELA_ATUAL;                      // Ativacao da regra

input group "20.b.Indicador 2 - Compra";
input ENUM_CONFIGURAR_INDICADORES ConfigurarIndicador2 = CONFIG_IND_MACD;             // Indicador 2
input ENUM_COMANDO_CONDICAO ComandoIndicador2 = COMANDO_SE;                           // Conector logico
input ENUM_MENU_CONDICAO Menu1Indicador2 = MENU_NAO_USAR;                             // Fonte A
input ENUM_SIMPLES_VELA Simples1Indicador2 = SIMPLES_VELA_ATUAL;                      // Ativacao da regra
input ENUM_OPCAO_COMPARACAO OpcaoIndicador2 = COMPARAR_MAIOR_QUE;                     // Operador de comparacao
input ENUM_MENU_CONDICAO Menu2Indicador2 = MENU_NAO_USAR;                             // Fonte B / Indicador
input ENUM_SIMPLES_VELA Simples2Indicador2 = SIMPLES_VELA_ATUAL;                      // Ativacao da regra

input group "20.c.Indicador 3 - Compra";
input ENUM_CONFIGURAR_INDICADORES ConfigurarIndicador3 = CONFIG_IND_ENVELOPES;        // Indicador 3
input ENUM_COMANDO_CONDICAO ComandoIndicador3 = COMANDO_SE;                           // Conector logico
input ENUM_MENU_CONDICAO Menu1Indicador3 = MENU_NAO_USAR;                             // Fonte A
input ENUM_SIMPLES_VELA Simples1Indicador3 = SIMPLES_VELA_ATUAL;                      // Ativacao da regra
input ENUM_OPCAO_COMPARACAO OpcaoIndicador3 = COMPARAR_MAIOR_QUE;                     // Operador de comparacao
input ENUM_MENU_CONDICAO Menu2Indicador3 = MENU_NAO_USAR;                             // Fonte B / Indicador
input ENUM_SIMPLES_VELA Simples2Indicador3 = SIMPLES_VELA_ATUAL;                      // Ativacao da regra

input group "20.d.Indicador 4 - Compra";
input ENUM_CONFIGURAR_INDICADORES ConfigurarIndicador4 = CONFIG_IND_ESTOCASTICO;      // Indicador 4
input ENUM_COMANDO_CONDICAO ComandoIndicador4 = COMANDO_SE;                           // Conector logico
input ENUM_MENU_CONDICAO Menu1Indicador4 = MENU_NAO_USAR;                             // Fonte A
input ENUM_SIMPLES_VELA Simples1Indicador4 = SIMPLES_VELA_ATUAL;                      // Ativacao da regra
input ENUM_OPCAO_COMPARACAO OpcaoIndicador4 = COMPARAR_MAIOR_QUE;                     // Operador de comparacao
input ENUM_MENU_CONDICAO Menu2Indicador4 = MENU_NAO_USAR;                             // Fonte B / Indicador
input ENUM_SIMPLES_VELA Simples2Indicador4 = SIMPLES_VELA_ATUAL;                      // Ativacao da regra

input group "20.e.Indicador 1 - Venda";
input ENUM_CONFIGURAR_INDICADORES ConfigurarIndicadorVenda1 = CONFIG_IND_BANDAS_BOLINGER; // Indicador 1
input ENUM_COMANDO_CONDICAO ComandoIndicadorVenda1 = COMANDO_SE;                            // Conector logico
input ENUM_MENU_CONDICAO Menu1IndicadorVenda1 = MENU_NAO_USAR;                              // Fonte A
input ENUM_SIMPLES_VELA Simples1IndicadorVenda1 = SIMPLES_VELA_ATUAL;                       // Ativacao da regra
input ENUM_OPCAO_COMPARACAO OpcaoIndicadorVenda1 = COMPARAR_MENOR_QUE;                       // Operador de comparacao
input ENUM_MENU_CONDICAO Menu2IndicadorVenda1 = MENU_NAO_USAR;                              // Fonte B / Indicador
input ENUM_SIMPLES_VELA Simples2IndicadorVenda1 = SIMPLES_VELA_ATUAL;                       // Ativacao da regra

input group "20.f.Indicador 2 - Venda";
input ENUM_CONFIGURAR_INDICADORES ConfigurarIndicadorVenda2 = CONFIG_IND_MACD;              // Indicador 2
input ENUM_COMANDO_CONDICAO ComandoIndicadorVenda2 = COMANDO_SE;                            // Conector logico
input ENUM_MENU_CONDICAO Menu1IndicadorVenda2 = MENU_NAO_USAR;                              // Fonte A
input ENUM_SIMPLES_VELA Simples1IndicadorVenda2 = SIMPLES_VELA_ATUAL;                       // Ativacao da regra
input ENUM_OPCAO_COMPARACAO OpcaoIndicadorVenda2 = COMPARAR_MENOR_QUE;                       // Operador de comparacao
input ENUM_MENU_CONDICAO Menu2IndicadorVenda2 = MENU_NAO_USAR;                              // Fonte B / Indicador
input ENUM_SIMPLES_VELA Simples2IndicadorVenda2 = SIMPLES_VELA_ATUAL;                       // Ativacao da regra

input group "20.g.Indicador 3 - Venda";
input ENUM_CONFIGURAR_INDICADORES ConfigurarIndicadorVenda3 = CONFIG_IND_ENVELOPES;         // Indicador 3
input ENUM_COMANDO_CONDICAO ComandoIndicadorVenda3 = COMANDO_SE;                            // Conector logico
input ENUM_MENU_CONDICAO Menu1IndicadorVenda3 = MENU_NAO_USAR;                              // Fonte A
input ENUM_SIMPLES_VELA Simples1IndicadorVenda3 = SIMPLES_VELA_ATUAL;                       // Ativacao da regra
input ENUM_OPCAO_COMPARACAO OpcaoIndicadorVenda3 = COMPARAR_MENOR_QUE;                       // Operador de comparacao
input ENUM_MENU_CONDICAO Menu2IndicadorVenda3 = MENU_NAO_USAR;                              // Fonte B / Indicador
input ENUM_SIMPLES_VELA Simples2IndicadorVenda3 = SIMPLES_VELA_ATUAL;                       // Ativacao da regra

input group "20.h.Indicador 4 - Venda";
input ENUM_CONFIGURAR_INDICADORES ConfigurarIndicadorVenda4 = CONFIG_IND_ESTOCASTICO;       // Indicador 4
input ENUM_COMANDO_CONDICAO ComandoIndicadorVenda4 = COMANDO_SE;                            // Conector logico
input ENUM_MENU_CONDICAO Menu1IndicadorVenda4 = MENU_NAO_USAR;                              // Fonte A
input ENUM_SIMPLES_VELA Simples1IndicadorVenda4 = SIMPLES_VELA_ATUAL;                       // Ativacao da regra
input ENUM_OPCAO_COMPARACAO OpcaoIndicadorVenda4 = COMPARAR_MENOR_QUE;                       // Operador de comparacao
input ENUM_MENU_CONDICAO Menu2IndicadorVenda4 = MENU_NAO_USAR;                              // Fonte B / Indicador
input ENUM_SIMPLES_VELA Simples2IndicadorVenda4 = SIMPLES_VELA_ATUAL;                       // Ativacao da regra

input group "20.1.Bandas de Bolinger";
input int PeriodoIndicador1 = 20;                                 // Periodo
input double DesviosIndicador1 = 2.0;                             // Desvios
input int DeslocamentoIndicador1 = 0;                             // Deslocamento
input ENUM_APPLIED_PRICE ModoPrecoIndicador1 = PRICE_CLOSE;       // Modo de preco
input ENUM_BANDAS_BOLINGER_SINAL SinalIndicador1 = BOLINGER_CENTRAL; // Entrada

input group "20.2.MACD";
input int EMARapidaIndicador2 = 12;                               // EMA rapida
input int EMALentaIndicador2 = 26;                                // EMA lenta
input int SinalIndicador2 = 9;                                    // Sinal
input ENUM_APPLIED_PRICE ModoPrecoIndicador2 = PRICE_CLOSE;       // Modo de preco
input ENUM_MACD_ENTRADA EntradaIndicador2 = MACD_HISTOGRAMA;      // Entrada

input group "20.3.Envelopes";
input int PeriodoIndicador3 = 14;                                 // Periodo
input int DeslocamentoIndicador3 = 0;                             // Deslocamento
input ENUM_MA_METHOD TipoMediaIndicador3 = MODE_SMA;              // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador3 = PRICE_CLOSE;       // Modo de preco
input double DesviosIndicador3 = 1.0;                             // Desvios
input ENUM_ENVELOPE_ENTRADA EntradaIndicador3 = ENVELOPE_SUPERIOR; // Entrada

input group "20.4.Estocastico";
input int KPeriodoIndicador4 = 5;                                 // K Periodo
input int DPeriodoIndicador4 = 3;                                 // D Periodo
input int LentidaoIndicador4 = 3;                                 // Lentidao
input ENUM_MA_METHOD TipoMediaIndicador4 = MODE_SMA;              // Tipo de media
input ENUM_STO_PRICE TipoEstocasticoIndicador4 = STO_LOWHIGH;     // Tipo estocastico
input ENUM_ESTOCASTICO_ENTRADA EntradaIndicador4 = ESTOCASTICO_PRINCIPAL; // Entrada

input group "20.5.RSI";
input int PeriodoIndicador1RSI = 14;                              // Periodo
input ENUM_APPLIED_PRICE ModoPrecoIndicador1RSI = PRICE_CLOSE;    // Modo de preco
input ENUM_RSI_ENTRADA EntradaIndicador1RSI = RSI_ENTRADA_RSI;    // Entrada

input group "20.6.Desvio Padrao";
input int PeriodoIndicador2DesvioPadrao = 20;                     // Periodo
input int DeslocamentoIndicador2DesvioPadrao = 0;                 // Deslocamento
input ENUM_MA_METHOD TipoMediaIndicador2DesvioPadrao = MODE_SMA;  // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador2DesvioPadrao = PRICE_CLOSE; // Modo de preco
input ENUM_DESVIO_PADRAO_ENTRADA EntradaIndicador2DesvioPadrao = DESVIO_PADRAO_ENTRADA_DESVIO_PADRAO; // Entrada

input group "20.7.Volume";
input ENUM_APPLIED_VOLUME VolumeIndicador3 = VOLUME_TICK;         // Volume
input ENUM_VOLUME_ENTRADA EntradaIndicador3Volume = VOLUME_ENTRADA_VOLUME; // Entrada

input group "20.8.ATR";
input int PeriodoIndicador4ATR = 14;                              // Periodo
input ENUM_ATR_ENTRADA EntradaIndicador4ATR = ATR_ENTRADA_ATR;    // Entrada

input group "20.9.Parabolic SAR";
input double PassoIndicador1ParabolicSAR = 0.02;                  // Passo
input double MaximoIndicador1ParabolicSAR = 0.2;                  // Maximo
input ENUM_PARABOLIC_SAR_ENTRADA EntradaIndicador1ParabolicSAR = PARABOLIC_SAR_ENTRADA_PARABOLIC_SAR; // Entrada

input group "20.10.Fractal";
input ENUM_FRACTAL_ENTRADA EntradaIndicador1Fractal = FRACTAL_SUPERIOR; // Entrada

input group "20.11.OBV";
input ENUM_APPLIED_VOLUME VolumeIndicador3OBV = VOLUME_TICK;      // Volume
input ENUM_OBV_ENTRADA EntradaIndicador3OBV = OBV_ENTRADA_OBV;     // Entrada

input group "20.12.Media Movel 1";
input int PeriodoIndicador1MediaMovel = 14;                        // Periodo
input int DeslocamentoIndicador1MediaMovel = 0;                    // Deslocamento
input ENUM_MA_METHOD TipoMediaIndicador1MediaMovel = MODE_SMA;     // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador1MediaMovel = PRICE_CLOSE; // Modo de preco
input ENUM_MEDIA_MOVEL_ENTRADA EntradaIndicador1MediaMovel = MEDIA_MOVEL_ENTRADA_MEDIA_MOVEL; // Entrada

input group "20.13.Media Movel 2";
input int PeriodoIndicador2MediaMovel = 14;                        // Periodo
input int DeslocamentoIndicador2MediaMovel = 0;                    // Deslocamento
input ENUM_MA_METHOD TipoMediaIndicador2MediaMovel = MODE_SMA;     // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador2MediaMovel = PRICE_CLOSE; // Modo de preco
input ENUM_MEDIA_MOVEL_ENTRADA EntradaIndicador2MediaMovel = MEDIA_MOVEL_ENTRADA_MEDIA_MOVEL; // Entrada

input group "20.14.Media Movel 3";
input int PeriodoIndicador3MediaMovel = 14;                        // Periodo
input int DeslocamentoIndicador3MediaMovel = 0;                    // Deslocamento
input ENUM_MA_METHOD TipoMediaIndicador3MediaMovel = MODE_SMA;     // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador3MediaMovel = PRICE_CLOSE; // Modo de preco
input ENUM_MEDIA_MOVEL_ENTRADA EntradaIndicador3MediaMovel = MEDIA_MOVEL_ENTRADA_MEDIA_MOVEL; // Entrada

input group "20.15.Keltner";
input int PeriodoIndicador1Keltner = 1;                            // Periodo
input double DesviosIndicador1Keltner = 0.01;                      // Desvios
input ENUM_MA_METHOD TipoMediaIndicador1Keltner = MODE_SMA;        // Tipo de media
input ENUM_KELTNER_ENTRADA EntradaIndicador1Keltner = KELTNER_CENTRAL; // Entrada

input group "20.16.Dochian";
input int PeriodoIndicador1Dochian = 1;                            // Periodo
input ENUM_DOCHIAN_ENTRADA EntradaIndicador1Dochian = DOCHIAN_CENTRAL; // Entrada

input group "20.17.Regressao";
input int PeriodoIndicador1Regressao = 1;                          // Periodo
input ENUM_MA_METHOD TipoMediaIndicador1Regressao = MODE_SMA;      // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Regressao = PRICE_CLOSE; // Modo de preco
input ENUM_REGRESSAO_ENTRADA EntradaIndicador1Regressao = REGRESSAO_RATIO; // Entrada

input group "20.18.Afastamento da media";
input int PeriodoIndicador1AfastamentoMedia = 1;                   // Periodo
input int DeslocamentoIndicador1AfastamentoMedia = 1;              // Deslocamento
input ENUM_MA_METHOD TipoMediaIndicador1AfastamentoMedia = MODE_SMA; // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador1AfastamentoMedia = PRICE_CLOSE; // Modo de preco
input ENUM_AFASTAMENTO_MEDIA_ENTRADA EntradaIndicador1AfastamentoMedia = AFASTAMENTO_MEDIA_ENTRADA_AFASTAMENTO_MEDIO; // Entrada

input group "20.19.Desvio Medio";
input int PeriodoIndicador1DesvioMedio = 1;                        // Periodo
input ENUM_MA_METHOD TipoMediaIndicador1DesvioMedio = MODE_SMA;    // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador1DesvioMedio = PRICE_MEDIAN; // Modo de preco
input ENUM_DESVIO_MEDIO_ENTRADA EntradaIndicador1DesvioMedio = DESVIO_MEDIO_ENTRADA_DESVIO_AFASTAMENTO; // Entrada

input group "20.20.Canal ATR";
input int PeriodoIndicador1CanalATR = 1;                           // Periodo
input double DesviosIndicador1CanalATR = 1.0;                      // Desvios
input ENUM_CANAL_ATR_ENTRADA EntradaIndicador1CanalATR = CANAL_ATR_CENTRAL; // Entrada

input group "20.21.A/D";
input ENUM_APPLIED_VOLUME VolumeIndicador1AD = VOLUME_TICK;        // Volume
input ENUM_AD_ENTRADA EntradaIndicador1AD = AD_ENTRADA_AD;         // Entrada

input group "20.22.MFI";
input int PeriodoIndicador1MFI = 14;                               // Periodo
input ENUM_APPLIED_VOLUME VolumeIndicador1MFI = VOLUME_REAL;       // Volume
input ENUM_MFI_ENTRADA EntradaIndicador1MFI = MFI_ENTRADA_MFI;     // Entrada

input group "20.23.Vidya";
input int PeriodoCMOIndicador1Vidya = 14;                          // Periodo CMO
input int PeriodoEMAIndicador1Vidya = 20;                          // Periodo EMA
input int DeslocamentoIndicador1Vidya = 0;                         // Deslocamento
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Vidya = PRICE_CLOSE;   // Modo de preco
input ENUM_VIDYA_ENTRADA EntradaIndicador1Vidya = VIDYA_ENTRADA_VIDYA; // Entrada

input group "20.24.Dema";
input int PeriodoIndicador1Dema = 14;                              // Periodo
input int DeslocamentoIndicador1Dema = 20;                         // Deslocamento
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Dema = PRICE_CLOSE;    // Modo de preco
input ENUM_DEMA_ENTRADA EntradaIndicador1Dema = DEMA_ENTRADA_DEMA; // Entrada

input group "20.25.Tema";
input int PeriodoIndicador1Tema = 14;                              // Periodo
input int DeslocamentoIndicador1Tema = 20;                         // Deslocamento
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Tema = PRICE_OPEN;     // Modo de preco
input ENUM_TEMA_ENTRADA EntradaIndicador1Tema = TEMA_ENTRADA_TEMA; // Entrada

input group "20.26.Frama";
input int PeriodoIndicador1Frama = 14;                             // Periodo
input int DeslocamentoIndicador1Frama = 20;                        // Deslocamento
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Frama = PRICE_OPEN;    // Modo de preco
input ENUM_FRAMA_ENTRADA EntradaIndicador1Frama = FRAMA_ENTRADA_FRAMA; // Entrada

input group "20.27.Trix";
input int PeriodoIndicador1Trix = 14;                              // Periodo
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Trix = PRICE_CLOSE;    // Modo de preco
input ENUM_TRIX_ENTRADA EntradaIndicador1Trix = TRIX_ENTRADA_TRIX; // Entrada

input group "20.28.Bears Power";
input int PeriodoIndicador1BearsPower = 14;                        // Periodo
input ENUM_BEARS_POWER_ENTRADA EntradaIndicador1BearsPower = BEARS_POWER_ENTRADA_BEARS_POWER; // Entrada

input group "20.29.Bulls Power";
input int PeriodoIndicador1BullsPower = 14;                        // Periodo
input ENUM_BULLS_POWER_ENTRADA EntradaIndicador1BullsPower = BULLS_POWER_ENTRADA_BULLS_POWER; // Entrada

input group "20.30.Chaikin Oscilador";
input int MediaRapidaIndicador1ChaikinOscilador = 14;              // Media rapida
input int MediaLentaIndicador1ChaikinOscilador = 10;               // Media lenta
input ENUM_MA_METHOD TipoMediaIndicador1ChaikinOscilador = MODE_SMA; // Tipo de media
input ENUM_APPLIED_VOLUME VolumeIndicador1ChaikinOscilador = VOLUME_TICK; // Volume
input ENUM_CHAIKIN_OSCILADOR_ENTRADA EntradaIndicador1ChaikinOscilador = CHAIKIN_OSCILADOR_ENTRADA_CHAIKIN_OSCILADOR; // Entrada

input group "20.31.Accelerator Oscilador";
input ENUM_ACCELERATOR_OSCILADOR_ENTRADA EntradaIndicador1AcceleratorOscilador = ACCELERATOR_OSCILADOR_ENTRADA_ACCELERATOR_OSCILADOR; // Accelerator nao requer parametros

input group "20.32.Awesome Oscilador";
input ENUM_AWESOME_OSCILADOR_ENTRADA EntradaIndicador1AwesomeOscilador = AWESOME_OSCILADOR_ENTRADA_AWESOME_OSCILADOR; // Awesome nao requer parametros

input group "20.33.CCI";
input int PeriodoIndicador1CCI = 14;                               // Periodo
input ENUM_APPLIED_PRICE ModoPrecoIndicador1CCI = PRICE_CLOSE;     // Modo de preco
input ENUM_CCI_ENTRADA EntradaIndicador1CCI = CCI_ENTRADA_CCI;     // Entrada

input group "20.34.DeMarker";
input int PeriodoIndicador1DeMarker = 14;                          // Periodo
input ENUM_DEMARKER_ENTRADA EntradaIndicador1DeMarker = DEMARKER_ENTRADA_DEMARKER; // Entrada

input group "20.35.Alligator";
input int PeriodoMandibulaIndicador1Alligator = 14;                // Periodo mandibula
input int DeslocamentoMandibulaIndicador1Alligator = 8;            // Deslocamento mandibula
input int PeriodoDenteIndicador1Alligator = 8;                     // Periodo dente
input int DeslocamentoDenteIndicador1Alligator = 5;                // Deslocamento dente
input int PeriodoBocaIndicador1Alligator = 5;                      // Periodo boca
input int DeslocamentoBocaIndicador1Alligator = 3;                 // Deslocamento boca
input ENUM_MA_METHOD TipoMediaIndicador1Alligator = MODE_SMA;      // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Alligator = PRICE_CLOSE; // Modo de preco
input ENUM_ALLIGATOR_ENTRADA EntradaIndicador1Alligator = ALLIGATOR_ENTRADA_MANDIBULA; // Entrada

input group "20.36.Ichimoku";
input int TenkanSenIndicador1Ichimoku = 14;                        // Tenkan-sen
input int KijunSenIndicador1Ichimoku = 8;                          // Kijun-sen
input int SenkouSpanBIndicador1Ichimoku = 8;                       // Senkou Span B
input ENUM_ICHIMOKU_ENTRADA EntradaIndicador1Ichimoku = ICHIMOKU_ENTRADA_TENKAN_SEN; // Entrada

input group "20.37.ADX";
input int PeriodoIndicador1ADX = 14;                               // Periodo
input ENUM_ADX_ENTRADA EntradaIndicador1ADX = ADX_ENTRADA_MAIN;    // Entrada

input group "20.38.ADX Wilder";
input int PeriodoIndicador1ADXWilder = 14;                         // Periodo
input ENUM_ADX_WILDER_ENTRADA EntradaIndicador1ADXWilder = ADX_WILDER_ENTRADA_MAIN; // Entrada

input group "20.39.Gator";
input int PeriodoMandibulaIndicador1Gator = 14;                    // Periodo mandibula
input int DeslocamentoMandibulaIndicador1Gator = 8;                // Deslocamento mandibula
input int PeriodoDenteIndicador1Gator = 8;                         // Periodo dente
input int DeslocamentoDenteIndicador1Gator = 5;                    // Deslocamento dente
input int PeriodoBocaIndicador1Gator = 5;                          // Periodo boca
input int DeslocamentoBocaIndicador1Gator = 3;                     // Deslocamento boca
input ENUM_MA_METHOD TipoMediaIndicador1Gator = MODE_SMA;          // Tipo de media
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Gator = PRICE_CLOSE;   // Modo de preco
input ENUM_GATOR_ENTRADA EntradaIndicador1Gator = GATOR_ENTRADA_SUPERIOR; // Entrada

input group "20.40.WPR";
input int PeriodoIndicador1WPR = 14;                               // Periodo
input int DesviosIndicador1WPR = 8;                                // Desvios
input ENUM_WPR_ENTRADA EntradaIndicador1WPR = WPR_ENTRADA_WPR;     // Entrada

input group "20.41.Market Facilitation Index";
input ENUM_APPLIED_VOLUME VolumeIndicador1MarketFacilitationIndex = VOLUME_TICK; // Volume
input ENUM_MARKET_FACILITATION_INDEX_ENTRADA EntradaIndicador1MarketFacilitationIndex = MARKET_FACILITATION_INDEX_ENTRADA_MARKET_FACILITATION_INDEX; // Entrada

input group "20.42.Momentum";
input int PeriodoMedioIndicador1Momentum = 14;                     // Periodo Medio
input ENUM_APPLIED_PRICE ModoPrecoIndicador1Momentum = PRICE_CLOSE; // Modo de preco
input ENUM_MOMENTUM_ENTRADA EntradaIndicador1Momentum = MOMENTUM_ENTRADA_MOMENTUM; // Entrada

input group "20.43.RVI";
input int PeriodoIndicador1RVI = 2;                               // Periodo
input ENUM_RVI_ENTRADA EntradaIndicador1RVI = RVI_ENTRADA_PRINCIPAL; // Entrada

input group "21.Ajustes finais";
input ENUM_SIM_NAO CancelarPendenteEntradaSinalOposto = SIM;      // Cancelar pendente de entrada se aparecer sinal oposto
input ENUM_SIM_NAO ReposicionarStoplossAumentoFavor = SIM;         // Reposicionar stoploss no aumento a favor da operacao
input ENUM_SIM_NAO ReposicionarTakeprofitAumentoContra = SIM;      // Reposicionar takeprofit no aumento contra a operacao
input ENUM_SIM_NAO MovimentarStoplossPrecoMedio = SIM;             // Movimentar stoploss com base no preco medio
input ENUM_SIM_NAO MovimentarTakeprofitPrecoMedio = SIM;           // Movimentar takeprofit com base no preco medio
input ENUM_SIM_NAO UsarPrecoMedioReferenciaParciais = SIM;         // Usar preco medio como referencia das parciais
input ENUM_SIM_NAO ImpedirSinalSaidaVelaEntrada = SIM;             // Impedir sinal de saida na vela que gerou entrada
input ENUM_SIM_NAO ImpedirSinalEntradaVelaSaida = SIM;             // Impedir sinal de entrada na vela que gerou saida
input ENUM_SIM_NAO RecalcularPrecoMedioSaidasParciais = NAO;       // Recalcular o preco medio com base nas saidas parciais

input group "22.Complementos";
input ENUM_SIM_NAO ProcurarEntradaVelaSeguinteSaida = NAO;         // Procurar entrada na vela seguinte a saida
input ENUM_SIM_NAO ProcurarSaidaVelaSeguinteEntrada = NAO;         // Procurar saida na vela seguinte a entrada
input double SaldoAjusteSomarConta = 0.0;                          // Saldo de ajuste para somar com a conta

input group "23.Finalizacao";
input bool ExibirIndicadoresAoCarregarExpertNoGrafico = false;     // Exibir indicadores ao carregar o expert advisor em um grafico
input bool CriarPainelEBoletaNoGrafico = false;                    // Criar painel e boleta no grafico
input bool CriarLogDoExpertNoGrafico = false;                      // Criar log do expert no grafico
input bool CriarEtiquetasPersonalizadasNasOrdens = false;          // Criar etiquetas personalizadas nas ordens
input bool AlterarLayoutDoGraficoCoresFundoECandles = false;       // Alterar layout do grafico (cores de fundo e candles)

CTrade trade;
datetime ultimaEntrada = 0;
datetime ultimaVelaEntrada = 0;
int handleCanal = INVALID_HANDLE;
int handleMA = INVALID_HANDLE;
int handleRSI = INVALID_HANDLE;
int handleStochastic = INVALID_HANDLE;
int handleCCI = INVALID_HANDLE;
int handleMFI = INVALID_HANDLE;

//+------------------------------------------------------------------+
//| CACHE DE DADOS DA VELA - OTIMIZACAO DE PERFORMANCE
//+------------------------------------------------------------------+
struct DadosVela
  {
   double open0;      // Abertura da vela atual
   double open1;      // Abertura da vela anterior
   double close0;     // Fechamento da vela atual
   double close1;     // Fechamento da vela anterior
   double high0;      // Maxima da vela atual
   double high1;      // Maxima da vela anterior
   double low0;       // Minima da vela atual
   double low1;       // Minima da vela anterior
   long volume0;      // Volume da vela atual
   long volume1;      // Volume da vela anterior
  };

DadosVela dados;

ENUM_TIMEFRAMES ObterTimeframe(const ENUM_TEMPO_GRAFICO tempoGrafico)
  {
   switch(tempoGrafico)
     {
      case CORRENTE:
         return PERIOD_CURRENT;
      case M1:
         return PERIOD_M1;
      case M2:
         return PERIOD_M2;
      case M3:
         return PERIOD_M3;
      case M4:
         return PERIOD_M4;
      case M5:
         return PERIOD_M5;
      case M6:
         return PERIOD_M6;
      case M10:
         return PERIOD_M10;
      case M12:
         return PERIOD_M12;
      case M15:
         return PERIOD_M15;
      case M30:
         return PERIOD_M30;
      case H1:
         return PERIOD_H1;
      case H2:
         return PERIOD_H2;
      case H3:
         return PERIOD_H3;
      case H4:
         return PERIOD_H4;
      case H6:
         return PERIOD_H6;
      case H8:
         return PERIOD_H8;
      case H12:
         return PERIOD_H12;
      case D1:
         return PERIOD_D1;
      case W1:
         return PERIOD_W1;
      case MN1:
         return PERIOD_MN1;
      default:
         return PERIOD_CURRENT;
     }
  }

int ObterDeslocamentoVela(const ENUM_QUAL_VELA qualVela)
  {
   switch(qualVela)
     {
      case VELA_ULTIMA:
         return 1;
      case VELA_PENULTIMA:
         return 2;
      case VELA_ANTEPENULTIMA:
         return 3;
      default:
         return 1;
     }
  }

bool IsNewBar()
  {
   static datetime ultimaBarra = 0;

   const datetime tempoAtual = iTime(_Symbol, _Period, 0);

   if(tempoAtual != ultimaBarra)
     {
      ultimaBarra = tempoAtual;
      return true;
     }

   return false;
  }

bool ObterVelaPorDeslocamento(const int deslocamento, MqlRates &vela)
  {
   MqlRates rates[];
   ArrayResize(rates, 1);
   ArraySetAsSeries(rates, true);

   const int copied = CopyRates(_Symbol, ObterTimeframe(TempoGrafico), deslocamento, 1, rates);
   if(copied < 1)
      return false;

   vela = rates[0];
   return true;
  }

double CalcularPrecoReferenciaPendente(const ENUM_REFERENCIA_PRECO referencia, const ENUM_QUAL_VELA qualVela, const double precoAtual, const double precoBase)
  {
   switch(referencia)
     {
      case PRECO_ATUAL:
         return precoAtual;
      case PRECO_BASE:
         return precoBase;
      default:
         break;
     }

   if(referencia == ABERTURA_VELA_ATUAL)
     {
      MqlRates velaAtual;
      if(!ObterVelaPorDeslocamento(0, velaAtual))
         return precoAtual;

      return velaAtual.open;
     }

   MqlRates velaSelecionada;
   if(!ObterVelaPorDeslocamento(ObterDeslocamentoVela(qualVela), velaSelecionada))
      return precoAtual;

   switch(referencia)
     {
      case MAXIMA_VELA_ANTERIOR:
         return velaSelecionada.high;
      case MINIMA_VELA_ANTERIOR:
         return velaSelecionada.low;
      case ABERTURA_VELA_ANTERIOR:
         return velaSelecionada.open;
      case FECHAMENTO_VELA_ANTERIOR:
         return velaSelecionada.close;
      default:
         return precoAtual;
     }
  }

double ObterPrecoReferenciaEntradaPendente(const double precoAtual, const double precoBase)
  {
   return CalcularPrecoReferenciaPendente(ReferenciaPrecoEntrada, QualVelaEntrada, precoAtual, precoBase);
  }

double ObterPrecoReferenciaSaidaPendente(const double precoAtual, const double precoBase)
  {
   return CalcularPrecoReferenciaPendente(ReferenciaPrecoSaida, QualVelaSaida, precoAtual, precoBase);
  }

long ObterIntervaloSegundosNovaEntrada()
  {
   if(TempoParaNovaEntrada <= 0)
      return 0;

   switch(ReferenciaTempoFiltro)
     {
      case SEGUNDOS:
         return (long)TempoParaNovaEntrada;
      case MINUTOS:
         return (long)TempoParaNovaEntrada * 60;
      case HORAS:
         return (long)TempoParaNovaEntrada * 3600;
      case VELAS:
        {
         int segundosPorVela = PeriodSeconds(ObterTimeframe(TempoGrafico));
         if(segundosPorVela <= 0)
            segundosPorVela = PeriodSeconds((ENUM_TIMEFRAMES)_Period);

         if(segundosPorVela <= 0)
            return 0;

         return (long)TempoParaNovaEntrada * segundosPorVela;
        }
      default:
         return (long)TempoParaNovaEntrada;
     }
  }

bool PodeOperar()
  {
   const datetime agora = TimeCurrent();
   MqlDateTime tempoAtual;
   TimeToStruct(agora, tempoAtual);

   const int horaInicialMinuto = (int)HorarioInicialHora * 60 + MathMax(0, MathMin(59, HorarioInicialMin));
   const int horaFinalMinuto = (int)HorarioFinalHora * 60 + MathMax(0, MathMin(59, HorarioFinalMin));
   const int minutoAtual = tempoAtual.hour * 60 + tempoAtual.min;

   bool horarioPermitido = false;
   if(horaInicialMinuto <= horaFinalMinuto)
      horarioPermitido = (minutoAtual >= horaInicialMinuto && minutoAtual <= horaFinalMinuto);
   else
      horarioPermitido = (minutoAtual >= horaInicialMinuto || minutoAtual <= horaFinalMinuto);

   if(!horarioPermitido)
      return false;

   if(SpreadMaximo > 0)
     {
      MqlTick tick;
      if(!SymbolInfoTick(_Symbol, tick))
        {
         Print("Nao foi possivel obter o tick atual para validar spread.");
         return false;
        }

      const double spreadPontos = (tick.ask - tick.bid) / _Point;
      if(spreadPontos > SpreadMaximo)
         return false;
     }

   if(ultimaEntrada > 0 && TempoParaNovaEntrada > 0)
     {
      const long intervaloMinimo = ObterIntervaloSegundosNovaEntrada();
      if(intervaloMinimo > 0 && (agora - ultimaEntrada) < intervaloMinimo)
         return false;
     }

   return true;
  }

bool ExistePosicaoAberta()
  {
   return PositionSelect(_Symbol);
  }

//+------------------------------------------------------------------+
//| MODULO 18 - CRUZAMENTO DE SINAIS
//+------------------------------------------------------------------+

double ObterValorFonte(const ENUM_SINAL_FONTE fonte, const int shift)
  {
   const ENUM_TIMEFRAMES timeframe = ObterTimeframe(TempoGrafico);

   switch(fonte)
     {
      case FONTE_FECHAMENTO_VELA:
         if(shift == 0)
            return dados.close0;
         if(shift == 1)
            return dados.close1;
         return iClose(_Symbol, timeframe, shift);

      case FONTE_ABERTURA_VELA:
         if(shift == 0)
            return dados.open0;
         if(shift == 1)
            return dados.open1;
         return iOpen(_Symbol, timeframe, shift);

      case FONTE_MAXIMA_VELA:
         if(shift == 0)
            return dados.high0;
         return iHigh(_Symbol, timeframe, shift);

      case FONTE_MINIMA_VELA:
         if(shift == 0)
            return dados.low0;
         return iLow(_Symbol, timeframe, shift);

      case FONTE_MEDIA_MOVEL:
        {
         if(handleMA == INVALID_HANDLE)
            return 0.0;

         double valor[];
         ArrayResize(valor, 1);
         ArraySetAsSeries(valor, true);

         if(CopyBuffer(handleMA, 0, shift, 1, valor) < 1)
            return 0.0;

         return valor[0];
        }

      default:
         return 0.0;
     }
  }

bool CruzouParaCima(const double rapido0, const double rapido1, const double lento0, const double lento1)
  {
   return (rapido1 < lento1 && rapido0 > lento0);
  }

bool CruzouParaBaixo(const double rapido0, const double rapido1, const double lento0, const double lento1)
  {
   return (rapido1 > lento1 && rapido0 < lento0);
  }

bool SinalCruzamentoCompra()
  {
   if(EntradaCruzamento == SINAL_ENTRADA_NAO_USAR)
      return false;

   double rapidoAtual = ObterValorFonte(SinalRapido, 0);
   double rapidoAnterior = ObterValorFonte(SinalRapido, 1);

   double lentoAtual = ObterValorFonte(SinalLento, 0);
   double lentoAnterior = ObterValorFonte(SinalLento, 1);

   if(rapidoAtual == 0.0 || rapidoAnterior == 0.0 || lentoAtual == 0.0 || lentoAnterior == 0.0)
      return false;

   bool cruzouParaCima = CruzouParaCima(rapidoAtual, rapidoAnterior, lentoAtual, lentoAnterior);

   if(EntradaCruzamento == SINAL_ENTRADA_CRUZAMENTO)
     {
      if(SentidoCruzamento == SINAL_SENTIDO_TENDENCIA)
         return cruzouParaCima;
      else
         return CruzouParaBaixo(rapidoAtual, rapidoAnterior, lentoAtual, lentoAnterior);
     }

   if(EntradaCruzamento == SINAL_ENTRADA_CRUZAMENTO_FECHANDO)
     {
      double rapidoShift2 = ObterValorFonte(SinalRapido, 2);
      double lentoShift2 = ObterValorFonte(SinalLento, 2);

      if(rapidoShift2 == 0.0 || lentoShift2 == 0.0)
         return false;

      if(SentidoCruzamento == SINAL_SENTIDO_TENDENCIA)
         return cruzouParaCima && CruzouParaCima(rapidoAnterior, rapidoShift2, lentoAnterior, lentoShift2);
      else
         return CruzouParaBaixo(rapidoAtual, rapidoAnterior, lentoAtual, lentoAnterior) && 
                CruzouParaBaixo(rapidoAnterior, rapidoShift2, lentoAnterior, lentoShift2);
     }

   return false;
  }

bool SinalCruzamentoVenda()
  {
   if(EntradaCruzamento == SINAL_ENTRADA_NAO_USAR)
      return false;

   double rapidoAtual = ObterValorFonte(SinalRapido, 0);
   double rapidoAnterior = ObterValorFonte(SinalRapido, 1);

   double lentoAtual = ObterValorFonte(SinalLento, 0);
   double lentoAnterior = ObterValorFonte(SinalLento, 1);

   if(rapidoAtual == 0.0 || rapidoAnterior == 0.0 || lentoAtual == 0.0 || lentoAnterior == 0.0)
      return false;

   bool cruzouParaBaixo = CruzouParaBaixo(rapidoAtual, rapidoAnterior, lentoAtual, lentoAnterior);

   if(EntradaCruzamento == SINAL_ENTRADA_CRUZAMENTO)
     {
      if(SentidoCruzamento == SINAL_SENTIDO_TENDENCIA)
         return cruzouParaBaixo;
      else
         return CruzouParaCima(rapidoAtual, rapidoAnterior, lentoAtual, lentoAnterior);
     }

   if(EntradaCruzamento == SINAL_ENTRADA_CRUZAMENTO_FECHANDO)
     {
      double rapidoShift2 = ObterValorFonte(SinalRapido, 2);
      double lentoShift2 = ObterValorFonte(SinalLento, 2);

      if(rapidoShift2 == 0.0 || lentoShift2 == 0.0)
         return false;

      if(SentidoCruzamento == SINAL_SENTIDO_TENDENCIA)
         return cruzouParaBaixo && CruzouParaBaixo(rapidoAnterior, rapidoShift2, lentoAnterior, lentoShift2);
      else
         return CruzouParaCima(rapidoAtual, rapidoAnterior, lentoAtual, lentoAnterior) && 
                CruzouParaCima(rapidoAnterior, rapidoShift2, lentoAnterior, lentoShift2);
     }

   return false;
  }

bool SinalSaidaCruzamento(const bool compra)
  {
   if(SaidaCruzamento != SINAL_SAIDA_CRUZAMENTO_OPOSTO)
      return false;

   double rapidoAtual = ObterValorFonte(SinalRapido, 0);
   double rapidoAnterior = ObterValorFonte(SinalRapido, 1);

   double lentoAtual = ObterValorFonte(SinalLento, 0);
   double lentoAnterior = ObterValorFonte(SinalLento, 1);

   if(rapidoAtual == 0.0 || rapidoAnterior == 0.0 || lentoAtual == 0.0 || lentoAnterior == 0.0)
      return false;

   if(compra)
      return CruzouParaBaixo(rapidoAtual, rapidoAnterior, lentoAtual, lentoAnterior);
   else
      return CruzouParaCima(rapidoAtual, rapidoAnterior, lentoAtual, lentoAnterior);
  }

//+------------------------------------------------------------------+
//| MODULO 19 - OSCILADORES (SOBRECOMPRA/SOBREVENDA)
//+------------------------------------------------------------------+

double ObterValorOscilador(const ENUM_OSCILADOR_INDICADOR indicador, const int shift)
  {
   double valor[];
   ArrayResize(valor, 1);
   ArraySetAsSeries(valor, true);

   switch(indicador)
     {
      case RSI:
         if(handleRSI == INVALID_HANDLE)
            return 0.0;
         if(CopyBuffer(handleRSI, 0, shift, 1, valor) < 1)
            return 0.0;
         return valor[0];

      case ESTOCASTICO:
         if(handleStochastic == INVALID_HANDLE)
            return 0.0;
         if(CopyBuffer(handleStochastic, 0, shift, 1, valor) < 1)
            return 0.0;
         return valor[0];

      case CCI:
         if(handleCCI == INVALID_HANDLE)
            return 0.0;
         if(CopyBuffer(handleCCI, 0, shift, 1, valor) < 1)
            return 0.0;
         return valor[0];

      case MFI:
         if(handleMFI == INVALID_HANDLE)
            return 0.0;
         if(CopyBuffer(handleMFI, 0, shift, 1, valor) < 1)
            return 0.0;
         return valor[0];

      default:
         return 0.0;
     }
  }

bool OsciladorHabilitado()
  {
   return (IndicadorSobreCompraVenda != NAO_USAR && EntradaSobreCompraVenda != OSCILADOR_ENTRADA_NAO_USAR);
  }

bool SinalOsciladorCompra()
  {
   if(!OsciladorHabilitado())
      return false;

   double valorAtual = ObterValorOscilador(IndicadorSobreCompraVenda, 0);
   double valorAnterior = ObterValorOscilador(IndicadorSobreCompraVenda, 1);

   if(valorAtual == 0.0 && valorAnterior == 0.0)
      return false;

   bool estaEmSobrevenda = (valorAtual < NivelSobrevenda);

   if(EntradaSobreCompraVenda == OSCILADOR_ENTRADA_FECHOU_FORA)
     {
      bool estava = (valorAnterior < NivelSobrevenda);
      if(estava && !estaEmSobrevenda)
        {
         if(SentidoSobreCompraVenda == OSCILADOR_SENTIDO_TENDENCIA)
            return true;  // Sobrevenda -> compra (tendencia)
         else
            return false; // Sobrevenda -> nao compra (contra)
        }
     }

   if(EntradaSobreCompraVenda == OSCILADOR_ENTRADA_ESTANDO_FORA)
     {
      if(estaEmSobrevenda)
        {
         if(SentidoSobreCompraVenda == OSCILADOR_SENTIDO_TENDENCIA)
            return true;  // Estando em sobrevenda -> compra (tendencia)
         else
            return false; // Estando em sobrevenda -> nao compra (contra)
        }
     }

   return false;
  }

bool SinalOsciladorVenda()
  {
   if(!OsciladorHabilitado())
      return false;

   double valorAtual = ObterValorOscilador(IndicadorSobreCompraVenda, 0);
   double valorAnterior = ObterValorOscilador(IndicadorSobreCompraVenda, 1);

   if(valorAtual == 0.0 && valorAnterior == 0.0)
      return false;

   bool estaEmSobrecompra = (valorAtual > NivelSobrecompra);

   if(EntradaSobreCompraVenda == OSCILADOR_ENTRADA_FECHOU_FORA)
     {
      bool estava = (valorAnterior > NivelSobrecompra);
      if(estava && !estaEmSobrecompra)
        {
         if(SentidoSobreCompraVenda == OSCILADOR_SENTIDO_TENDENCIA)
            return true;  // Sobrecompra -> venda (tendencia)
         else
            return false; // Sobrecompra -> nao venda (contra)
        }
     }

   if(EntradaSobreCompraVenda == OSCILADOR_ENTRADA_ESTANDO_FORA)
     {
      if(estaEmSobrecompra)
        {
         if(SentidoSobreCompraVenda == OSCILADOR_SENTIDO_TENDENCIA)
            return true;  // Estando em sobrecompra -> venda (tendencia)
         else
            return false; // Estando em sobrecompra -> nao venda (contra)
        }
     }

   return false;
  }

//+------------------------------------------------------------------+

bool CanalBandasHabilitado()
  {
   return (IndicadorCanalBandas != BANDAS_NAO_USAR && EntradaCanalBandas != ENTRADA_NAO_USAR);
  }

bool ObterValoresCanalPorDeslocamento(const int deslocamento, double &bandaSuperior, double &bandaMedia, double &bandaInferior)
  {
   if(handleCanal == INVALID_HANDLE)
      return false;

   double upper[];
   double middle[];
   double lower[];
   ArrayResize(upper, 1);
   ArrayResize(middle, 1);
   ArrayResize(lower, 1);
   ArraySetAsSeries(upper, true);
   ArraySetAsSeries(middle, true);
   ArraySetAsSeries(lower, true);

   if(CopyBuffer(handleCanal, 0, deslocamento, 1, upper) < 1)
      return false;
   if(CopyBuffer(handleCanal, 1, deslocamento, 1, middle) < 1)
      return false;
   if(CopyBuffer(handleCanal, 2, deslocamento, 1, lower) < 1)
      return false;

   bandaSuperior = upper[0];
   bandaMedia = middle[0];
   bandaInferior = lower[0];

   if(bandaSuperior == EMPTY_VALUE || bandaMedia == EMPTY_VALUE || bandaInferior == EMPTY_VALUE)
      return false;

   return true;
  }

bool ObterValoresCanal(double &bandaSuperior, double &bandaMedia, double &bandaInferior)
  {
   return ObterValoresCanalPorDeslocamento(0, bandaSuperior, bandaMedia, bandaInferior);
  }

bool ObterFechamentosCanal(double &fechamentoAtual, double &fechamentoAnterior)
  {
   fechamentoAtual = dados.close0;
   fechamentoAnterior = dados.close1;
   return true;
  }

bool SinalCanalCompra()
  {
   if(!CanalBandasHabilitado())
      return false;

   double fechamentoAtual = 0.0;
   double fechamentoAnterior = 0.0;
   if(!ObterFechamentosCanal(fechamentoAtual, fechamentoAnterior))
      return false;

   switch(EntradaCanalBandas)
     {
      case ENTRADA_FECHOU_FORA:
        {
         double bandaSuperiorAnterior = 0.0;
         double bandaMediaAnterior = 0.0;
         double bandaInferiorAnterior = 0.0;
         if(!ObterValoresCanalPorDeslocamento(1, bandaSuperiorAnterior, bandaMediaAnterior, bandaInferiorAnterior))
            return false;

         if(SentidoCanalBandas == SENTIDO_TENDENCIA)
            return (fechamentoAnterior > bandaSuperiorAnterior);

         return (fechamentoAnterior < bandaInferiorAnterior);
        }
      case ENTRADA_ESTANDO_FORA:
        {
         double bandaSuperior = 0.0;
         double bandaMedia = 0.0;
         double bandaInferior = 0.0;
         if(!ObterValoresCanal(bandaSuperior, bandaMedia, bandaInferior))
            return false;

         if(SentidoCanalBandas == SENTIDO_TENDENCIA)
            return (fechamentoAtual > bandaSuperior);

         return (fechamentoAtual < bandaInferior);
        }
      default:
         return false;
     }
  }

bool SinalCanalVenda()
  {
   if(!CanalBandasHabilitado())
      return false;

   double fechamentoAtual = 0.0;
   double fechamentoAnterior = 0.0;
   if(!ObterFechamentosCanal(fechamentoAtual, fechamentoAnterior))
      return false;

   switch(EntradaCanalBandas)
     {
      case ENTRADA_FECHOU_FORA:
        {
         double bandaSuperiorAnterior = 0.0;
         double bandaMediaAnterior = 0.0;
         double bandaInferiorAnterior = 0.0;
         if(!ObterValoresCanalPorDeslocamento(1, bandaSuperiorAnterior, bandaMediaAnterior, bandaInferiorAnterior))
            return false;

         if(SentidoCanalBandas == SENTIDO_TENDENCIA)
            return (fechamentoAnterior < bandaInferiorAnterior);

         return (fechamentoAnterior > bandaSuperiorAnterior);
        }
      case ENTRADA_ESTANDO_FORA:
        {
         double bandaSuperior = 0.0;
         double bandaMedia = 0.0;
         double bandaInferior = 0.0;
         if(!ObterValoresCanal(bandaSuperior, bandaMedia, bandaInferior))
            return false;

         if(SentidoCanalBandas == SENTIDO_TENDENCIA)
            return (fechamentoAtual < bandaInferior);

         return (fechamentoAtual > bandaSuperior);
        }
      default:
         return false;
     }
  }

bool SinalSaidaCanal(const ENUM_POSITION_TYPE tipoPosicao)
  {
   if(handleCanal == INVALID_HANDLE)
      return false;

   if(SaidaCanalBandas != SAIDA_CRUZAR_CENTRO)
      return false;

   double fechamentoAtual = 0.0;
   double fechamentoAnterior = 0.0;
   if(!ObterFechamentosCanal(fechamentoAtual, fechamentoAnterior))
      return false;

   double bandaSuperiorAtual = 0.0;
   double bandaMediaAtual = 0.0;
   double bandaInferiorAtual = 0.0;
   if(!ObterValoresCanalPorDeslocamento(0, bandaSuperiorAtual, bandaMediaAtual, bandaInferiorAtual))
      return false;

   double bandaSuperiorAnterior = 0.0;
   double bandaMediaAnterior = 0.0;
   double bandaInferiorAnterior = 0.0;
   if(!ObterValoresCanalPorDeslocamento(1, bandaSuperiorAnterior, bandaMediaAnterior, bandaInferiorAnterior))
      return false;

   if(tipoPosicao == POSITION_TYPE_BUY)
      return (fechamentoAnterior > bandaMediaAnterior && fechamentoAtual <= bandaMediaAtual);

   if(tipoPosicao == POSITION_TYPE_SELL)
      return (fechamentoAnterior < bandaMediaAnterior && fechamentoAtual >= bandaMediaAtual);

   return false;
  }

void GerenciarSaidaCanal()
  {
   if(!PositionSelect(_Symbol))
      return;

   if(TipoOrdemSaida != MERCADO)
      return;

   const ENUM_POSITION_TYPE tipoPosicao = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
   if(tipoPosicao != POSITION_TYPE_BUY && tipoPosicao != POSITION_TYPE_SELL)
      return;

   if(!SinalSaidaCanal(tipoPosicao))
      return;

   const ulong ticket = (ulong)PositionGetInteger(POSITION_TICKET);
   if(!trade.PositionClose(ticket))
      PrintFormat("Falha ao fechar posicao por saida do canal. Ticket=%I64u Retcode=%d (%s)", ticket, trade.ResultRetcode(), trade.ResultRetcodeDescription());
  }

void FecharPosicao()
  {
   if(!PositionSelect(_Symbol))
      return;

   const ulong ticket = (ulong)PositionGetInteger(POSITION_TICKET);
   if(!trade.PositionClose(ticket))
      PrintFormat("Falha ao fechar posicao. Ticket=%I64u Retcode=%d (%s)", ticket, trade.ResultRetcode(), trade.ResultRetcodeDescription());
  }

double CalcularDistanciaPreco(const ENUM_TIPO_CALCULO_DISTANCIAS tipoCalculo, const double distancia, const bool isCompra, const double precoReferencia)
  {
   if(distancia == 0.0 || precoReferencia <= 0.0)
      return 0.0;

   const double distanciaAbsoluta = MathAbs(distancia);
   double variacao = 0.0;

   if(tipoCalculo == EM_PONTOS)
      variacao = distanciaAbsoluta * _Point;
   else
      variacao = precoReferencia * distanciaAbsoluta / 100.0;

   double direcao = isCompra ? -1.0 : 1.0;
   if(distancia < 0.0)
      direcao *= -1.0;

   return NormalizeDouble(precoReferencia + (direcao * variacao), _Digits);
  }

void AbrirCompra()
  {
   if(TipoOrdemEntrada != MERCADO)
     {
      Print("TipoOrdemEntrada = PENDENTE ainda nao implementado nesta etapa.");
      return;
     }

   double preco = 0.0;
   if(!SymbolInfoDouble(_Symbol, SYMBOL_ASK, preco))
     {
      Print("Falha ao obter preco ASK para abertura de compra.");
      return;
     }

   double sl = 0.0;
   double tp = 0.0;

   if(StoplossInicial > 0.0)
      sl = CalcularDistanciaPreco(TipoCalculoStoploss, StoplossInicial, true, preco);

   if(TakeProfitInicial > 0.0)
      tp = CalcularDistanciaPreco(TipoCalculoTakeProfit, -TakeProfitInicial, true, preco);

   if(sl > 0.0)
      sl = NormalizeDouble(sl, _Digits);
   if(tp > 0.0)
      tp = NormalizeDouble(tp, _Digits);

   if(!trade.Buy(VolumeInicial, _Symbol, preco, sl, tp))
     {
      PrintFormat("Falha ao abrir compra. Retcode=%d (%s)", trade.ResultRetcode(), trade.ResultRetcodeDescription());
      return;
     }

   ultimaEntrada = TimeCurrent();
  }

void AbrirVenda()
  {
   if(TipoOrdemEntrada != MERCADO)
     {
      Print("TipoOrdemEntrada = PENDENTE ainda nao implementado nesta etapa.");
      return;
     }

   double preco = 0.0;
   if(!SymbolInfoDouble(_Symbol, SYMBOL_BID, preco))
     {
      Print("Falha ao obter preco BID para abertura de venda.");
      return;
     }

   double sl = 0.0;
   double tp = 0.0;

   if(StoplossInicial > 0.0)
      sl = CalcularDistanciaPreco(TipoCalculoStoploss, StoplossInicial, false, preco);

   if(TakeProfitInicial > 0.0)
      tp = CalcularDistanciaPreco(TipoCalculoTakeProfit, -TakeProfitInicial, false, preco);

   if(sl > 0.0)
      sl = NormalizeDouble(sl, _Digits);
   if(tp > 0.0)
      tp = NormalizeDouble(tp, _Digits);

   if(!trade.Sell(VolumeInicial, _Symbol, preco, sl, tp))
     {
      PrintFormat("Falha ao abrir venda. Retcode=%d (%s)", trade.ResultRetcode(), trade.ResultRetcodeDescription());
      return;
     }

   ultimaEntrada = TimeCurrent();
  }

bool StopLossCandidatoValido(const ENUM_POSITION_TYPE tipoPosicao, const double novoSL, const double bid, const double ask, const int stopLevelPontos)
  {
   if(novoSL <= 0.0)
      return false;

   const double distanciaMinima = stopLevelPontos * _Point;

   if(tipoPosicao == POSITION_TYPE_BUY)
     {
      if(novoSL >= bid)
         return false;

      if(stopLevelPontos > 0 && (bid - novoSL) < distanciaMinima)
         return false;

      return true;
     }

   if(tipoPosicao == POSITION_TYPE_SELL)
     {
      if(novoSL <= ask)
         return false;

      if(stopLevelPontos > 0 && (novoSL - ask) < distanciaMinima)
         return false;

      return true;
     }

   return false;
  }

void GerenciarStopLoss()
  {
   if(PositionsTotal() <= 0)
      return;

   double bid = 0.0;
   double ask = 0.0;
   if(!SymbolInfoDouble(_Symbol, SYMBOL_BID, bid) || !SymbolInfoDouble(_Symbol, SYMBOL_ASK, ask))
     {
      Print("Falha ao obter BID/ASK para gerenciamento de stop.");
      return;
     }

   const int stopLevelPontos = (int)SymbolInfoInteger(_Symbol, SYMBOL_TRADE_STOPS_LEVEL);

   for(int i = PositionsTotal() - 1; i >= 0; i--)
     {
      const ulong ticket = PositionGetTicket(i);
      if(ticket == 0 || !PositionSelectByTicket(ticket))
         continue;

      if(PositionGetString(POSITION_SYMBOL) != _Symbol)
         continue;

      const ENUM_POSITION_TYPE tipoPosicao = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(tipoPosicao != POSITION_TYPE_BUY && tipoPosicao != POSITION_TYPE_SELL)
         continue;

      const double precoEntrada = PositionGetDouble(POSITION_PRICE_OPEN);
      const double slAtual = PositionGetDouble(POSITION_SL);
      const double tpAtual = PositionGetDouble(POSITION_TP);
      const double precoAtual = (tipoPosicao == POSITION_TYPE_BUY) ? bid : ask;
      const double lucroPontos = (tipoPosicao == POSITION_TYPE_BUY) ? (precoAtual - precoEntrada) / _Point : (precoEntrada - precoAtual) / _Point;

      double novoSL = slAtual;
      bool alterarSL = false;

      if(InicioBreakEvenSL > 0.0 && lucroPontos >= InicioBreakEvenSL)
        {
         const double slBreakEven = NormalizeDouble((tipoPosicao == POSITION_TYPE_BUY) ? (precoEntrada + (DistanciaBreakEvenSL * _Point)) : (precoEntrada - (DistanciaBreakEvenSL * _Point)), _Digits);

         if(tipoPosicao == POSITION_TYPE_BUY)
           {
            if(novoSL <= 0.0 || slBreakEven > (novoSL + (_Point * 0.1)))
              {
               novoSL = slBreakEven;
               alterarSL = true;
              }
           }
         else
           {
            if(novoSL <= 0.0 || slBreakEven < (novoSL - (_Point * 0.1)))
              {
               novoSL = slBreakEven;
               alterarSL = true;
              }
           }
        }

      if(InicioTrailingStop > 0.0 && PassoTrailingStop > 0.0 && lucroPontos >= InicioTrailingStop)
        {
         const double slTrailing = NormalizeDouble((tipoPosicao == POSITION_TYPE_BUY) ? (precoAtual - (PassoTrailingStop * _Point)) : (precoAtual + (PassoTrailingStop * _Point)), _Digits);

         if(tipoPosicao == POSITION_TYPE_BUY)
           {
            if(novoSL <= 0.0 || slTrailing > (novoSL + (_Point * 0.1)))
              {
               novoSL = slTrailing;
               alterarSL = true;
              }
           }
         else
           {
            if(novoSL <= 0.0 || slTrailing < (novoSL - (_Point * 0.1)))
              {
               novoSL = slTrailing;
               alterarSL = true;
              }
           }
        }

      if(!alterarSL)
         continue;

      novoSL = NormalizeDouble(novoSL, _Digits);

      if(slAtual > 0.0 && MathAbs(novoSL - slAtual) < (_Point * 0.5))
         continue;

      if(!StopLossCandidatoValido(tipoPosicao, novoSL, bid, ask, stopLevelPontos))
         continue;

      if(!trade.PositionModify(ticket, novoSL, tpAtual))
         PrintFormat("Falha ao modificar SL. Ticket=%I64u Retcode=%d (%s)", ticket, trade.ResultRetcode(), trade.ResultRetcodeDescription());
     }
  }

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   const ENUM_TIMEFRAMES timeframe = ObterTimeframe(TempoGrafico);
   handleCanal = INVALID_HANDLE;
   handleMA = INVALID_HANDLE;

   switch(IndicadorCanalBandas)
     {
      case BANDAS_NAO_USAR:
         break;
      case BANDAS_BOLLINGER:
         handleCanal = iBands(_Symbol, timeframe, PeriodoBandasBolinger, DeslocamentoBandasBolinger, DesviosBandasBolinger, ModoPrecoBandasBolinger);
         break;
      case BANDAS_ENVELOPES:
         handleCanal = iCustom(_Symbol, timeframe, "Canais\\Envelopes", PeriodoEnvelopes, DeslocamentoEnvelopes, TipoMediaEnvelopes, ModoPrecoEnvelopes, DesviosEnvelopes);
         break;
      case BANDAS_KELTNER:
         handleCanal = iCustom(_Symbol, timeframe, "Canais\\Keltner", PeriodoKeltner, DesviosKeltner);
         break;
      case BANDAS_DONCHIAN:
         handleCanal = iCustom(_Symbol, timeframe, "Canais\\Dochian", PeriodoDochian);
         break;
      case BANDAS_ATR:
         handleCanal = iCustom(_Symbol, timeframe, "Canais\\Canal-ATR", PeriodoCanalATR, DesviosCanalATR);
         break;
      default:
         PrintFormat("Indicador de canal nao suportado: %d", (int)IndicadorCanalBandas);
         return(INIT_FAILED);
     }

   if(IndicadorCanalBandas != BANDAS_NAO_USAR && handleCanal == INVALID_HANDLE)
     {
      PrintFormat("Falha ao criar handle do canal. Indicador=%d Erro=%d", (int)IndicadorCanalBandas, GetLastError());
      return(INIT_FAILED);
     }

   // Inicializar handle de media movel para cruzamento se necessario
   if(SinalRapido == FONTE_MEDIA_MOVEL || SinalLento == FONTE_MEDIA_MOVEL)
     {
      handleMA = iMA(_Symbol, timeframe, PeriodoIndicador1MediaMovel, DeslocamentoIndicador1MediaMovel, TipoMediaIndicador1MediaMovel, ModoPrecoIndicador1MediaMovel);
      if(handleMA == INVALID_HANDLE)
        {
         PrintFormat("Falha ao criar handle da media movel. Erro=%d", GetLastError());
         return(INIT_FAILED);
        }
     }

   // Inicializar handles de osciladores
   if(IndicadorSobreCompraVenda != NAO_USAR)
     {
      switch(IndicadorSobreCompraVenda)
        {
         case RSI:
            handleRSI = iRSI(_Symbol, timeframe, PeriodoRSI, ModoPrecoRSI);
            if(handleRSI == INVALID_HANDLE)
              {
               PrintFormat("Falha ao criar handle RSI. Erro=%d", GetLastError());
               return(INIT_FAILED);
              }
            break;

         case ESTOCASTICO:
            handleStochastic = iStochastic(_Symbol, timeframe, KPeriodoEstocastico, DPeriodoEstocastico, LentidaoEstocastico, TipoMediaEstocastico, TipoEstocastico);
            if(handleStochastic == INVALID_HANDLE)
              {
               PrintFormat("Falha ao criar handle Estocastico. Erro=%d", GetLastError());
               return(INIT_FAILED);
              }
            break;

         case CCI:
            handleCCI = iCCI(_Symbol, timeframe, PeriodoCCI, ModoPrecoCCI);
            if(handleCCI == INVALID_HANDLE)
              {
               PrintFormat("Falha ao criar handle CCI. Erro=%d", GetLastError());
               return(INIT_FAILED);
              }
            break;

         case MFI:
            handleMFI = iMFI(_Symbol, timeframe, PeriodoMFI, VolumeMFI);
            if(handleMFI == INVALID_HANDLE)
              {
               PrintFormat("Falha ao criar handle MFI. Erro=%d", GetLastError());
               return(INIT_FAILED);
              }
            break;

         default:
            break;
        }
     }

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   if(handleCanal != INVALID_HANDLE)
     {
      IndicatorRelease(handleCanal);
      handleCanal = INVALID_HANDLE;
     }

   if(handleMA != INVALID_HANDLE)
     {
      IndicatorRelease(handleMA);
      handleMA = INVALID_HANDLE;
     }

   if(handleRSI != INVALID_HANDLE)
     {
      IndicatorRelease(handleRSI);
      handleRSI = INVALID_HANDLE;
     }

   if(handleStochastic != INVALID_HANDLE)
     {
      IndicatorRelease(handleStochastic);
      handleStochastic = INVALID_HANDLE;
     }

   if(handleCCI != INVALID_HANDLE)
     {
      IndicatorRelease(handleCCI);
      handleCCI = INVALID_HANDLE;
     }

   if(handleMFI != INVALID_HANDLE)
     {
      IndicatorRelease(handleMFI);
      handleMFI = INVALID_HANDLE;
     }

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void AtualizarDadosVela()
  {
   MqlRates rates[2];
   ArraySetAsSeries(rates, true);

   if(CopyRates(_Symbol, ObterTimeframe(TempoGrafico), 0, 2, rates) < 2)
      return;

   dados.open0 = rates[0].open;
   dados.close0 = rates[0].close;
   dados.high0 = rates[0].high;
   dados.low0 = rates[0].low;
   dados.volume0 = rates[0].tick_volume;

   dados.open1 = rates[1].open;
   dados.close1 = rates[1].close;
   dados.high1 = rates[1].high;
   dados.low1 = rates[1].low;
   dados.volume1 = rates[1].tick_volume;
  }

void OnTick()
  {
//---
   if(!IsNewBar())
      return;

   AtualizarDadosVela();

   if(!PodeOperar())
     {
      GerenciarStopLoss();
      GerenciarSaidaCanal();
      return;
     }

   if(ExistePosicaoAberta())
     {
      GerenciarStopLoss();
      GerenciarSaidaCanal();

      // Gerenciar saida por cruzamento oposto
      ENUM_POSITION_TYPE tipoPosicao = (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(SinalSaidaCruzamento(tipoPosicao == POSITION_TYPE_BUY))
         FecharPosicao();

      return;
     }

   // Modulo 18 - Cruzamento de Sinais
   if(EntradaCruzamento != SINAL_ENTRADA_NAO_USAR)
     {
      if(OperarCompra == SIM && SinalCruzamentoCompra())
        {
         const datetime velaAtual = iTime(_Symbol, _Period, 0);
         if(velaAtual != ultimaVelaEntrada)
           {
            ultimaVelaEntrada = velaAtual;
            AbrirCompra();
           }
        }
      else
         if(OperarVenda == SIM && SinalCruzamentoVenda())
           {
            const datetime velaAtual = iTime(_Symbol, _Period, 0);
            if(velaAtual != ultimaVelaEntrada)
              {
               ultimaVelaEntrada = velaAtual;
               AbrirVenda();
              }
           }
     }

   // Modulo 19 - Osciladores (Sobrecompra/Sobrevenda)
   else if(OsciladorHabilitado())
     {
      if(OperarCompra == SIM && SinalOsciladorCompra())
        {
         const datetime velaAtual = iTime(_Symbol, _Period, 0);
         if(velaAtual != ultimaVelaEntrada)
           {
            ultimaVelaEntrada = velaAtual;
            AbrirCompra();
           }
        }
      else
         if(OperarVenda == SIM && SinalOsciladorVenda())
           {
            const datetime velaAtual = iTime(_Symbol, _Period, 0);
            if(velaAtual != ultimaVelaEntrada)
              {
               ultimaVelaEntrada = velaAtual;
               AbrirVenda();
              }
           }
     }

   else if(CanalBandasHabilitado())
     {
      if(OperarCompra == SIM && SinalCanalCompra())
        {
         const datetime velaAtual = iTime(_Symbol, _Period, 0);
         if(velaAtual != ultimaVelaEntrada)
           {
            ultimaVelaEntrada = velaAtual;
            AbrirCompra();
           }
        }
      else
         if(OperarVenda == SIM && SinalCanalVenda())
           {
            const datetime velaAtual = iTime(_Symbol, _Period, 0);
            if(velaAtual != ultimaVelaEntrada)
              {
               ultimaVelaEntrada = velaAtual;
               AbrirVenda();
              }
           }
     }

   else
     {
      if(OperarCompra == SIM)
        {
         const datetime velaAtual = iTime(_Symbol, _Period, 0);
         if(velaAtual != ultimaVelaEntrada)
           {
            ultimaVelaEntrada = velaAtual;
            AbrirCompra();
           }
        }
      else
         if(OperarVenda == SIM)
           {
            const datetime velaAtual = iTime(_Symbol, _Period, 0);
            if(velaAtual != ultimaVelaEntrada)
              {
               ultimaVelaEntrada = velaAtual;
               AbrirVenda();
              }
           }
     }

   GerenciarStopLoss();
   GerenciarSaidaCanal();
  }
//+------------------------------------------------------------------+
