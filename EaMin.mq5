//+------------------------------------------------------------------+
//|                                                        EaMin.mq5 |
//|                                  Copyright 2026, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2026, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

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
   PRECO_BASE = 1
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
input ENUM_REFERENCIA_PRECO ReferenciaPrecoEntrada = PRECO_ATUAL;           // Referencia de preco da entrada pendente (preco atual/base)

input group "5.2.Pendente saida";
input ENUM_TIPO_CALCULO_DISTANCIAS TipoCalculoDistanciaSaida = PERCENTUAL; // Usar somente se TipoOrdemSaida = PENDENTE
input double DistanciaSaida = 0.0;                                          // Distancia da saida pendente (percentual ou pontos)
input int ExpiracaoSaidaMinutos = 0;                                        // Expiracao da saida pendente em minutos (0 = sem expiracao)
input ENUM_REFERENCIA_PRECO ReferenciaPrecoSaida = PRECO_ATUAL;             // Referencia de preco da saida pendente (preco atual/base)

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

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
