//+------------------------------------------------------------------+
//| Envelopes Tester EA (D1)                                         |
//| Regras conforme descritas pelo usuário                           |
//+------------------------------------------------------------------+
#property strict

#include <Trade/Trade.mqh>

input ENUM_TIMEFRAMES InpSignalTF      = PERIOD_D1;   // Timeframe do sinal
input int            InpMAPeriod       = 25;          // Período (Envelopes)
input double         InpDeviationPct   = 5.0;         // Desvio em % (Envelopes)
input ENUM_MA_METHOD InpMAMethod       = MODE_SMA;    // Método MA
input ENUM_APPLIED_PRICE InpApplied    = PRICE_CLOSE; // Aplicar em
input double         InpBandBufferPct  = 1.0;         // "1% abaixo/acima" (filtro do fechamento)
input double         InpLots           = 0.10;        // Lote
input long           InpMagic          = 250125;      // Magic Number
input int            InpMaxAttempts    = 3;           // Total de tentativas (candle sinal + 2)
input int            InpSlippagePoints = 10;          // Slippage (points)

CTrade trade;

// Handle do indicador
int hEnv = INVALID_HANDLE;

// Estado do "setup" pendente
enum SetupDir { SETUP_NONE=0, SETUP_BUY=1, SETUP_SELL=-1 };
SetupDir setup_dir = SETUP_NONE;
int      setup_attempts = 0;            // quantas tentativas já feitas
datetime setup_signal_bar_time = 0;     // time do candle sinal (D1 fechado)

// Para detectar novo candle no TF de sinal
datetime last_tf_bar_time = 0;

//+------------------------------------------------------------------+
//| Utilitários                                                      |
//+------------------------------------------------------------------+
bool GetEnvelopes(double &upper1, double &lower1, double &upper0, double &lower0)
{
   // buffers do Envelopes: 0 = upper, 1 = lower (padrão MQL5)
   double up[2], lo[2];
   if(CopyBuffer(hEnv, 0, 0, 2, up) != 2) return false;
   if(CopyBuffer(hEnv, 1, 0, 2, lo) != 2) return false;

   upper0 = up[0];
   upper1 = up[1];
   lower0 = lo[0];
   lower1 = lo[1];
   return true;
}

bool GetRates(MqlRates &r0, MqlRates &r1)
{
   MqlRates rr[2];
   if(CopyRates(_Symbol, InpSignalTF, 0, 2, rr) != 2) return false;
   r0 = rr[0];
   r1 = rr[1];
   return true;
}

bool HasOpenPosition()
{
   if(!PositionSelect(_Symbol)) return false;
   long magic = (long)PositionGetInteger(POSITION_MAGIC);
   return (magic == InpMagic);
}

int PositionType()
{
   if(!PositionSelect(_Symbol)) return -1;
   long magic = (long)PositionGetInteger(POSITION_MAGIC);
   if(magic != InpMagic) return -1;
   return (int)PositionGetInteger(POSITION_TYPE); // POSITION_TYPE_BUY / SELL
}

bool FindPendingOrder(ulong &ticket, ENUM_ORDER_TYPE &type, double &price)
{
   ticket = 0;
   type = (ENUM_ORDER_TYPE)-1;
   price = 0.0;

   int total = OrdersTotal();
   for(int i=0; i<total; i++)
   {
      ulong tk = OrderGetTicket(i);
      if(tk == 0) continue;
      if(!OrderSelect(tk)) continue;

      string sym = OrderGetString(ORDER_SYMBOL);
      if(sym != _Symbol) continue;

      long magic = (long)OrderGetInteger(ORDER_MAGIC);
      if(magic != InpMagic) continue;

      ENUM_ORDER_STATE st = (ENUM_ORDER_STATE)OrderGetInteger(ORDER_STATE);
      if(st != ORDER_STATE_PLACED && st != ORDER_STATE_PARTIAL) continue;

      ENUM_ORDER_TYPE ot = (ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);
      if(ot != ORDER_TYPE_BUY_LIMIT && ot != ORDER_TYPE_SELL_LIMIT) continue;

      ticket = (ulong)OrderGetInteger(ORDER_TICKET);
      type = ot;
      price = OrderGetDouble(ORDER_PRICE_OPEN);
      return true;
   }
   return false;
}

bool CancelAllPendings()
{
   bool ok = true;
   int total = OrdersTotal();
   for(int i=total-1; i>=0; i--)
   {
      ulong tk = OrderGetTicket(i);
      if(tk == 0) continue;
      if(!OrderSelect(tk)) continue;
      if(OrderGetString(ORDER_SYMBOL) != _Symbol) continue;
      if((long)OrderGetInteger(ORDER_MAGIC) != InpMagic) continue;

      ENUM_ORDER_TYPE ot = (ENUM_ORDER_TYPE)OrderGetInteger(ORDER_TYPE);
      if(ot != ORDER_TYPE_BUY_LIMIT && ot != ORDER_TYPE_SELL_LIMIT) continue;

      if(!trade.OrderDelete(tk)) ok = false;
   }
   return ok;
}

bool ModifyPending(ulong ticket, double newPrice)
{
   MqlTradeRequest req;
   MqlTradeResult  res;
   ZeroMemory(req);
   ZeroMemory(res);

   req.action   = TRADE_ACTION_MODIFY;
   req.order    = ticket;
   req.symbol   = _Symbol;
   req.price    = NormalizeDouble(newPrice, (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS));
   req.magic    = InpMagic;

   // manter SL/TP atuais (se houver)
   if(OrderSelect(ticket))
   {
      req.sl = OrderGetDouble(ORDER_SL);
      req.tp = OrderGetDouble(ORDER_TP);
   }

   if(!OrderSend(req, res)) return false;
   return (res.retcode == TRADE_RETCODE_DONE);
}

double ND(double price)
{
   int d = (int)SymbolInfoInteger(_Symbol, SYMBOL_DIGITS);
   return NormalizeDouble(price, d);
}

//+------------------------------------------------------------------+
//| Inicialização                                                    |
//+------------------------------------------------------------------+
int OnInit()
{
   trade.SetExpertMagicNumber(InpMagic);
   trade.SetDeviationInPoints(InpSlippagePoints);

   EventSetTimer(60); // verifica a cada 60 segundos

   hEnv = iEnvelopes(_Symbol, InpSignalTF, InpMAPeriod, 0, InpMAMethod, InpApplied, InpDeviationPct);
   if(hEnv == INVALID_HANDLE)
   {
      Print("Erro ao criar iEnvelopes. code=", GetLastError());
      return INIT_FAILED;
   }

   // Inicializa controle de novo candle
   MqlRates r0, r1;
   if(GetRates(r0, r1))
      last_tf_bar_time = r0.time;

   return INIT_SUCCEEDED;
}

void OnDeinit(const int reason)
{
   EventKillTimer();
   if(hEnv != INVALID_HANDLE) IndicatorRelease(hEnv);
}

//+------------------------------------------------------------------+
//| Gestão de saída (TP na banda oposta)                             |
//+------------------------------------------------------------------+
void CheckExit()
{
   if(!HasOpenPosition()) return;

   double upper1, lower1, upper0, lower0;
   if(!GetEnvelopes(upper1, lower1, upper0, lower0)) return;

   int ptype = PositionType();
   if(ptype == POSITION_TYPE_BUY)
   {
      double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      if(bid >= upper0)
      {
         trade.PositionClose(_Symbol);
      }
   }
   else if(ptype == POSITION_TYPE_SELL)
   {
      double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      if(ask <= lower0)
      {
         trade.PositionClose(_Symbol);
      }
   }
}

//+------------------------------------------------------------------+
//| Lógica de sinal e pendentes (executa em novo candle do TF)        |
//+------------------------------------------------------------------+
void OnNewSignalBar()
{
   // Se abriu posição, cancela qualquer pendente e limpa setup
   if(HasOpenPosition())
   {
      CancelAllPendings();
      setup_dir = SETUP_NONE;
      setup_attempts = 0;
      setup_signal_bar_time = 0;
      return;
   }

   // Coleta dados do candle fechado [1]
   MqlRates r0, r1;
   if(!GetRates(r0, r1)) return;

   double upper1, lower1, upper0, lower0;
   if(!GetEnvelopes(upper1, lower1, upper0, lower0)) return;

   // "Fechar dentro do envelopes" no candle [1]
   bool close_inside = (r1.close >= lower1 && r1.close <= upper1);

   // Se já existe setup pendente, primeiro verifica cancelamento por fechar dentro
   if(setup_dir != SETUP_NONE)
   {
      if(close_inside)
      {
         CancelAllPendings();
         setup_dir = SETUP_NONE;
         setup_attempts = 0;
         setup_signal_bar_time = 0;
         return;
      }

      // Se ainda tentando e não entrou: move a ordem para a mínima/máxima do candle [1]
      ulong tk; ENUM_ORDER_TYPE ot; double op;
      bool hasPend = FindPendingOrder(tk, ot, op);

      // Se acabou o número de tentativas (ordem ficou ativa no candle anterior e não pegou), cancela agora.
      if(setup_attempts >= InpMaxAttempts)
      {
         if(hasPend) CancelAllPendings();
         setup_dir = SETUP_NONE;
         setup_attempts = 0;
         setup_signal_bar_time = 0;
         return;
      }

      // Ainda pode tentar mais uma vez: modifica/coloca pendente no novo nível
      if(setup_dir == SETUP_BUY)
      {
         double newPrice = ND(r1.low);
         if(hasPend && ot == ORDER_TYPE_BUY_LIMIT)
         {
            ModifyPending(tk, newPrice);
         }
         else
         {
            CancelAllPendings();
            trade.BuyLimit(InpLots, newPrice, _Symbol);
         }
         setup_attempts++;
         return;
      }
      else if(setup_dir == SETUP_SELL)
      {
         double newPrice = ND(r1.high);
         if(hasPend && ot == ORDER_TYPE_SELL_LIMIT)
         {
            ModifyPending(tk, newPrice);
         }
         else
         {
            CancelAllPendings();
            trade.SellLimit(InpLots, newPrice, _Symbol);
         }
         setup_attempts++;
         return;
      }
   }

   // Se não há setup ativo, avalia novo sinal
   double bandBuffer = InpBandBufferPct / 100.0;

   bool buySignal  = (r1.high < lower1) && (r1.close > lower1 * (1.0 - bandBuffer));
   bool sellSignal = (r1.low  > upper1) && (r1.close < upper1 * (1.0 + bandBuffer));

   if(buySignal)
   {
      CancelAllPendings();
      double entry = ND(r1.low); // compra na mínima
      if(trade.BuyLimit(InpLots, entry, _Symbol))
      {
         setup_dir = SETUP_BUY;
         setup_attempts = 1;              // tentativa #1 (no candle sinal)
         setup_signal_bar_time = r1.time;
      }
      return;
   }

   if(sellSignal)
   {
      CancelAllPendings();
      double entry = ND(r1.high); // venda na máxima
      if(trade.SellLimit(InpLots, entry, _Symbol))
      {
         setup_dir = SETUP_SELL;
         setup_attempts = 1;
         setup_signal_bar_time = r1.time;
      }
      return;
   }
}

//+------------------------------------------------------------------+
//| OnTick                                                           |
//+------------------------------------------------------------------+
void OnTick()
{
   // 1) Saída por toque na banda oposta (monitorada em todo tick)
   CheckExit();
}

//+------------------------------------------------------------------+
//| OnTimer                                                         |
//+------------------------------------------------------------------+
void OnTimer()
{
   MqlRates r0, r1;
   if(!GetRates(r0, r1))
      return;

   if(r0.time != last_tf_bar_time)
   {
      last_tf_bar_time = r0.time;
      OnNewSignalBar(); // sua lógica principal
   }
}
