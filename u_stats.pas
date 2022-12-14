unit u_stats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, Oracle, RzButton, Grids, DB,
  OracleData, ComCtrls, RzPrgres, Buttons,ClipBrd, AxCtrls, OleCtrls, VCF1,
  Menus, A7Rep, RzRadChk, QStrings;

type
  TStatForm = class(TForm)
	 QueryButt: TRzBitBtn;
	 DepthDate: TRzDateTimeEdit;
	 RzLabel1: TRzLabel;
	 OQStats: TOracleDataSet;
	 PB: TRzProgressBar;
	 A7Rep: TA7Rep;
	 ActualCheck: TRzCheckBox;
	 procedure QueryButtClick(Sender: TObject);
	 procedure FormShow(Sender: TObject);
	 procedure N1Click(Sender: TObject);
  private
	 { Private declarations }
  public
	 { Public declarations }
  end;

var
  StatForm: TStatForm;

implementation
 uses u_loginfrom, u_main;
{$R *.dfm}

procedure TStatForm.QueryButtClick(Sender: TObject);
var
 GatesQ,ModemsQ,QryString,ACaiis,ACopros,GateName,CheckString:String;
 i,j,k,q,qb:integer;
begin 
 Main.ShowLastLogButt.Click;     
 //????? ???-?? ??????
 q:=0; 
 //???-?? ?????? ? ???????????
 qb:=0;

 While CheckString<>'--------------------' do
  Begin
	CheckString:=Main.AutoAnalizerMemo.Lines.Strings[q];
	inc(q);
  End;

For j:=3 to q do
  Begin  //???????? ????? ??????
	i:=Q_PosStr('????',Main.AutoAnalizerMemo.Lines.Strings[j],0);
	k:=Q_PosStr('??????????',Main.AutoAnalizerMemo.Lines.Strings[j],0);    
	GateName:=Copy(Main.AutoAnalizerMemo.Lines.Strings[j],i+5,k-7);
   //???? ???? ? ???????????, ?? ?????????? ???-?? ???????????? ? ???????????
	If Q_PosStr('???????????',GateName,0)>0 then inc(qb);
  End;

If ActualCheck.Checked=true then
Begin
 ACaiis:=''; 
 ACopros:='where';
end
 else
Begin
 ACaiis:='where actual=3'; 
 ACopros:='where actual=3 and';     
End;

If City='SKEK' then
 Begin
 A7Rep.OpenTemplate(ExtractFilePath(Application.ExeName)+'StatKemTemplate.xls');
 A7Rep.PasteBand('Title');

 PB.PartsComplete:=0;
 PB.TotalParts:=17;

 If OQStats.Active=true then
 OQStats.Close;
 //???-?? ?????? ???????? ?? ??????? ????????????
 OQStats.SQL.Clear;
 OQStats.SQL.Add('select id_con,con_type from bqrk.con_points '+
 'minus '+
 'select id_con,con_type from bqrk.con_points where dist like ''%???%'' ');
 OQStats.Open;

 A7Rep.SetValue('#KEM_SHKAFS#',IntToStr(OQStats.RecordCount));
 PB.IncPartsByOne;

 If OQStats.Active=true then
 OQStats.Close;
 //???-?? ??????? ???????? ?? ??????? ????????????
 OQStats.SQL.Clear;
 OQStats.SQL.Add('select id_con,con_type from bqrk.con_points where con_type = 1001'+
 'minus '+
 'select id_con,con_type from bqrk.con_points where dist like ''%???%'' ');
 OQStats.Open;

 A7Rep.SetValue('#MODEMSQ#',IntToStr(OQStats.RecordCount));
 PB.IncPartsByOne;

 If OQStats.Active=true then
 OQStats.Close;
 //???-?? ?????? ???????????
 OQStats.SQL.Clear;
 OQStats.SQL.Add('select id_con,con_type from bqrk.con_points where dist like ''???%'' ');
 OQStats.Open;

 A7Rep.SetValue('#BER_SHKAFQ#',IntToStr(OQStats.RecordCount));
 PB.IncPartsByOne;

 If OQStats.Active=true then
 OQStats.Close;
 //???-?? ??????? ???????????
 OQStats.SQL.Clear;
 OQStats.SQL.Add('select id_con,con_type from bqrk.con_points where dist like ''???%'' and con_type=1001');
 OQStats.Open;

 A7Rep.SetValue('#BER_MODEMQ#',IntToStr(OQStats.RecordCount));
 PB.IncPartsByOne;
 //?????? ??????? ?? ??????? ? ????? ?? ? ????
 //??????? ??? ??? ???? ? ????
 //????????
 QryString:='select * from counters '+ACaiis
 +' minus select * from counters where actual in (2,5,6,7,8)';

  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#KEM_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

 //------------------??????
 QryString:='select * from counters where actual=1';

  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#KEM_PROCH_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

  //----------???????????  ????????????
  QryString:='select * from counters where actual=8'; 
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#BER_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //----------??????????? ??????
  QryString:='select * from counters where actual=1 and dist like ''???%'''; 
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#BER_PROCH_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

 //-----------?????? ??????
  QryString:='select * from counters where actual=2';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#LP_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //-------------------????????? ???????
  QryString:='select * from counters where actual=6 ';
				
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#GD_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //--------------------????????? ??????
  QryString:='select * from counters where actual=7';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#MI_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //--------------------??????? ?????
  QryString:='select * from counters where actual=5';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#PN_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //----------------------------------------------------------
  //----------------?????? ?? ??? ?????? ? ????????? ????????
  //----------------------------------------------------------
  //????????
  QryString:=
  'select * from counters '+ACopros+' date_last_pok>='''+DepthDate.Text+
''' minus '
  +'select * from counters where actual in (2,5,6,7,8)';

  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#KEM_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

  //?????? ? ??????
  QryString:='select * from counters where actual=1 and date_last_pok>='''+DepthDate.Text+'''';

  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#KEM_PROCH_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

  //-------------??????????? ????????????
  QryString:=
 'select * from counters where actual=8 '
 +'and date_last_pok>='''+DepthDate.Text+'''';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#BER_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //------------??????????? ??????
   QryString:=
  'select * from counters where actual=1 and dist like ''???%'' '
  +'and date_last_pok>='''+DepthDate.Text+'''';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#BER_PROCH_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

  //-----------------?????? ??????
  QryString:=
 'select * from counters where actual=2 and date_last_pok>='''+DepthDate.Text+'''';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#LP_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //-------------------????????? ???????
  QryString:=
  'select * from counters where actual=6 and date_last_pok>='''+DepthDate.Text+'''';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#GD_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //------------------????????? ??????
  QryString:='select * from counters where actual=7 '
  +'and date_last_pok>='''+DepthDate.Text+'''';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#MI_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //------------------??????? ?????
  QryString:='select * from counters where actual=5 '
  +'and date_last_pok>='''+DepthDate.Text+'''';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#PN_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

  //???-?? ???????????? ?????? ???????? ?? ??????? ???????????? ? ?????????
  A7Rep.SetValue('#SHKAFOFF_KEM#',IntToStr(q-4-qb));
  //???-?? ???????????? ?????? ? ???????????
  A7Rep.SetValue('#SHKAFOFF_BER#',IntToStr(qb));
 End;

//???????
If City='LK' then
 Begin
  A7Rep.OpenTemplate(ExtractFilePath(Application.ExeName)+'StatLenTemplate.xls');
  A7Rep.PasteBand('Title');

  PB.PartsComplete:=0;
  PB.TotalParts:=6;

  If OQStats.Active=true then
  OQStats.Close;
  //???-?? ?????? ???????
  OQStats.SQL.Clear;
  OQStats.SQL.Add('select * from bqrk.con_points where con_type in (1002,1003)');
  OQStats.Open;

  A7Rep.SetValue('#GATESQ#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

  If OQStats.Active=true then
  OQStats.Close;
  //---------------???-?? ??????? ???????
  OQStats.SQL.Clear;
  OQStats.SQL.Add('select * from bqrk.con_points where con_type in (1001)');
  OQStats.Open;

  A7Rep.SetValue('#MODEMSQ#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

  //???????????? ?????? ?? ??????
  QryString:='select * from counters where actual=3';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#LEN_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;
  //-------------------??????
  QryString:='select * from counters where actual=1';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#ETC_AIIS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

 //?????? ??, ??? ? ??????
 //? ????? ?? ??????
	 QryString:=
	'select * from counters where ' 
	+'date_last_pok>='''+DepthDate.Text+''' and actual=3';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#LEN_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne;

  //-------------------??????
	 QryString:=
	'select * from counters where ' 
	+'date_last_pok>='''+DepthDate.Text+''' and actual=1';
  
  If OQStats.Active=true then
	  OQStats.Close;

  OQStats.SQL.Clear;
  OQStats.SQL.Add(QryString);
  OQStats.Open;
  A7Rep.SetValue('#ETC_OPROS#',IntToStr(OQStats.RecordCount));
  PB.IncPartsByOne; 

  //???-?? ???????????? ?????? ? ????????
  A7Rep.SetValue('#SHKAFOFF#',IntToStr(q-4));
 End;


 A7Rep.Show;
end;

procedure TStatForm.FormShow(Sender: TObject);
begin
 DepthDate.Date:=Date-3;
end;

procedure TStatForm.N1Click(Sender: TObject);
begin
//If City='SKEK' then
 //F1.SetSelection(1,1,6,4);
//If City='LK' then
 //F1.SetSelection(1,1,3,4);

 //F1.EditCopy;
end;

end.

