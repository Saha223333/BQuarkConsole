unit u_transfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, ADODB, Oracle, RzButton, StdCtrls,qstrings;

type
  TTransForm = class(TForm)
    InStarConn: TADOConnection;
    DS: TDataSource;
    G: TDBGridEh;
    ADOQueryComcentrators: TADOQuery;
    ConnTbl: TADOTable;
    ConnTblid: TAutoIncField;
    ConnTblconnection_type: TWordField;
    ConnTblname: TWideStringField;
    ConnTbladdress: TWideStringField;
    ConnTblport_name: TWideStringField;
    ConnTblport_BaudRate: TIntegerField;
    ConnTblport_data_bits: TWordField;
    ConnTblport_parity: TWordField;
    ConnTblport_stop_bit: TWordField;
    ConnTblgsm_phone: TWideStringField;
    ConnTbltimeout: TWordField;
    ConnTbltimeout_wait: TWordField;
    ConnTblgsm_timeout_dial: TIntegerField;
    ConnTblgsm_count_dial_attempt: TWordField;
    ConnTblgsm_CBST: TWideStringField;
    ConnTblgateway_model: TWideStringField;
    ConnTblgateway_auto_config: TWordField;
    ConnTblgateway_auto_config_string: TWideStringField;
    OQ: TOracleQuery;
    ADOQueryCounters: TADOQuery;
    RzButton1: TRzButton;
    ADOQueryComcentratorsid: TAutoIncField;
    ADOQueryComcentratorsconnection_id: TIntegerField;
    ADOQueryComcentratorsname: TWideStringField;
	 ADOQueryComcentratorsaddress: TWideStringField;
    ADOQueryComcentratorsp_number: TIntegerField;
    ADOQueryComcentratorsmodel: TWideStringField;
	 ADOQueryComcentratorsserial_number: TWideStringField;
	 ADOQueryComcentratorsconcentrator_addres: TIntegerField;
	 ADOQueryComcentratorsisCollect_1: TWordField;
    ADOQueryComcentratorsisCollect_2: TWordField;
    ADOQueryCountersid: TAutoIncField;
    ADOQueryCountersconcentrator_id: TIntegerField;
    ADOQueryCountersname: TWideStringField;
    ADOQueryCountersaddress: TWideStringField;
    ADOQueryCountersp_number: TIntegerField;
    ADOQueryCountersmodel: TWideStringField;
    ADOQueryCountersserial_number: TWideStringField;
    ADOQueryCounterscounter_addres: TIntegerField;
    CheckBox1: TCheckBox;
    Button1: TButton;
    ADOMonitorResults: TADOQuery;
    ADOobject_counter_points: TADOQuery;
    ADOCAN_results: TADOQuery;
    ADOMax_date: TADOQuery;
    ADOCAN_resultsmax_pok: TFloatField;
    ADOCAN_resultsaddress: TWideStringField;
    ADOCAN_resultsserial_number: TWideStringField;
    CanCB: TCheckBox;
    WaterCB: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzButton1Click(Sender: TObject);
	 procedure Button1Click(Sender: TObject);
	 procedure TransferCANs(ConnIDBQRK,ConnIDInStar:integer);


  private
    { Private declarations }
  public
	 { Public declarations }
  end;

var
  TransForm: TTransForm;

implementation

uses u_main,u_util,u_loginfrom;

{$R *.dfm}

procedure TTransForm.FormShow(Sender: TObject);

begin
{
 try
  If InStarConn.Connected=false then 
	begin

	  
	 InStarConn.ConnectionString:=InStarString;

 InStarConn.Connected:=true;

	end                                  

 except
  ShowMessage('Не могу соединиться с БД');
  exit;
 end;

  If ConnTbl.Active=false then ConnTbl.Open; 

  ADOQueryComcentrators.SQL.Text:=
 'select * from InStar_'+City+'.dbo.object_concentrator_plc_points '+
 'where connection_id=:id_conn';

ADOQueryCounters.SQL.Text:=
'select * from InStar_'+City+'.dbo.object_concentrator_plc_counter_points '+
'where concentrator_id=:id_conc';

ADOobject_counter_points.SQL.Text:=
'select * from InStar_'+City+'.dbo.object_counter_points where connection_id=:id_conn';

ADOMonitorResults.SQL.Text:=

'SELECT a.d_value_energy_0_ts_ap AS max_pok, a2.address AS adress, a2.ser_num, b_1.md '+
'FROM InStar_'+City+'.dbo.result_monitor_concentrator_plc_results AS a RIGHT OUTER JOIN '+
'(SELECT     concentrator_plc_counter_id, MAX(date_time_energy_0_ts_ap) '+
'AS md, MAX(id) AS id1 '+
'FROM  InStar_'+City+'.dbo.result_monitor_concentrator_plc_results  '+
'GROUP BY concentrator_plc_counter_id) AS b_1 ON '+
'a.concentrator_plc_counter_id = b_1.concentrator_plc_counter_id AND '+
'a.date_time_energy_0_ts_ap = b_1.md AND a.id = b_1.id1 RIGHT OUTER JOIN '+
'(SELECT serial_number AS ser_num, id, address '+
' FROM InStar_'+City+'.dbo.object_concentrator_plc_counter_points AS a1) AS a2 '+
'ON a2.id = a.concentrator_plc_counter_id '+
'WHERE (a.id IS NOT NULL) and a2.ser_num=:ser_num';

ADOCAN_results.SQL.Text:=
'select a.d_value as max_pok,adress,ser_num,w.date_time,1 as is_can '+
'from instar_'+City+'.dbo.result_monitor_results a right join '+
'(select max(monitor_point_id) as mp,counter_id cid '+
'from instar_'+City+'.dbo.result_monitor_results '+
						'group by counter_id) z  '+
'on a.monitor_point_id=z.mp and a.counter_id=z.cid '+
'left join (select address AS adress,serial_number as ser_num, '+
'id from instar_'+City+'.dbo.object_counter_points) q on a.counter_id=q.id '+
'left join (select id,date_time '+
'from instar_'+City+'.dbo.result_monitor_points) w on w.id=a.monitor_point_id '+
'where a.codename = ''energy_0_ts_ap'' and ser_num=:ser_num';
}
end;

procedure TTransForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 {
 If ConnTbl.Active=true then ConnTbl.Close;
  If InStarConn.Connected=true then InStarConn.Connected:=false;
  if ADOQueryComcentrators.Active=true then ADOQueryComcentrators.close;
 }
end;

procedure TTransForm.RzButton1Click(Sender: TObject);
{
var
 ConnID,ConcID:integer;  //эти переменные для выборки из инстара
 SeqConnID,SeqConcID,SeqCntrID:integer; //эти переменные для вставки в бикварк
//причина - разные способы присваивания ИД: в бикварке сквозной а в инстаре независимо
 mp:string; //ADOMonitorResults.FieldByName('max_pok').AsString

codename,con_type:string;
}
begin
 {

ConnTbl.First;

if trim(ConnTbl.FieldByName('gateway_model').AsString)='none' 
then con_type:='1001'
else con_type:='1002';

While not ConnTbl.Eof do
begin
//тащим новое значение из сквозной последовательности
OQ.SQL.Text:='select bqrk.GlobalNum.Nextval as Val from dual';
OQ.Execute; SeqConnID:=OQ.Field(0);
//вставка шлюза
OQ.SQL.Text:='Insert into bqrk.con_points (id_con,con_name,street,phone_number,con_type) values ('+
				  IntToStr(SeqConnID)+','''+
				  trim(ConnTbl.FieldByName('name').AsString)+''','''+
				  trim(ConnTbl.FieldByName('address').AsString)+''','''+
				  ConnTbl.FieldByName('gsm_phone').AsString+
					''','+''''+con_type+''''+')';
try
 OQ.Execute;
except
 if CheckBox1.checked=true then
 ShowMessage('Ошибка при переносе');

 continue;
end;
 //каскадно переносим концентраторы и их счетчики
 ConnID:=ConnTbl.fieldByName('id').AsInteger; 

  If ADOQueryComcentrators.Active=true then ADOQueryComcentrators.Close;
  ADOQueryComcentrators.Parameters.ParamByName('id_conn').Value:=ConnID;
  ADOQueryComcentrators.Open;
  ADOQueryComcentrators.First;

	If ADOQueryComcentrators.RecordCount=0 then 
	 Begin
	
		//если концентраторы пусты то вызвать процедуру переноса кановских счетчиков
		if CanCB.Checked=true then 
		  TransferCANs(SeqConnID,ConnID);

	  ConnTbl.Next;
	  continue;
	 End;                               

	 While not ADOQueryComcentrators.Eof do
	  Begin
	  OQ.SQL.Text:='select bqrk.GlobalNum.Nextval as Val from dual';
	  OQ.Execute; SeqConcID:=OQ.Field(0);
								
	  ConcID:=ADOQueryComcentrators.FieldByName('id').AsInteger;
			//вставка концентратора
			OQ.SQL.Text:='Insert into bqrk.concentrator_points (id_con,id_concentrator,name_concentrator,'
						  +'concentrator_address,type) values ('
					+IntToStr(SeqConnID)+','+IntToStr(SeqConcID)+','''+
				  trim(ADOQueryComcentrators.FieldByName('name').AsString)+''','''+
				  IntToHex(ADOQueryComcentrators.FieldByName('concentrator_addres').AsInteger,4)
					+''','+'''2001'''+')';
		  try
			OQ.Execute;
			except
			if CheckBox1.checked=true then
			 ShowMessage('Ошибка при переносе');

			 ADOQueryComcentrators.Next;
			 continue;
			end;                        //'energy_0_ts_ap'
				//определяем тип счетчика для того чтобы понять какой результат тащить
			
			  Codename:='energy_0_ts_ap'; //сумма тарифов по электроэнергии
			

	  If ADOQueryCounters.Active=true then ADOQueryCounters.Close;
		  ADOQueryCounters.Parameters.ParamByName('id_conc').Value:=ConcID;
		 
		  ADOQueryCounters.Open;
		  ADOQueryCounters.First;
								
		  if WaterCB.Checked=false then
			if Trim(ADOQueryCounters.FieldByName('model').AsString)='M229W' then
		 	 break;

			While not ADOQueryCounters.Eof do
			 begin
		  //последние показания
		  If ADOMonitorResults.Active=true then ADOMonitorResults.Close;
		  ADOMonitorResults.Parameters.ParamByName('ser_num').Value:=
			  trim(ADOQueryCounters.FieldByName('serial_number').AsString);
		  ADOMonitorResults.Open;

		 //последние показания в отдельной переменной потому что запрос 
		 //иногда возвращает пустую строку
		 mp:=ADOMonitorResults.FieldByName('max_pok').AsString;
		 if mp='' then mp:='0';

				OQ.SQL.Text:='select bqrk.GlobalNum.Nextval as Val from dual';
				OQ.Execute; SeqCntrID:=OQ.Field(0);
				//вставка счетчика
				OQ.SQL.Text:='Insert into bqrk.counters (id_con,id_concentrator,id_counter,counter_name,'
						  +'street,serial_number,counter_address,last_pok,date_last_pok,is_can) values ('
				  +IntToStr(SeqConnID)+','+IntToStr(SeqConcID)+','+IntToStr(SeqCntrID)+','''+
				  trim(ADOQueryCounters.FieldByName('name').AsString)+''','''+
				  Q_ReplaceText(trim(ADOQueryCounters.FieldByName('address').AsString),'''',' ')+''','''+
				  trim(ADOQueryCounters.FieldByName('serial_number').AsString)+''','+
				  trim(ADOQueryCounters.FieldByName('counter_addres').AsString)+','+
				  //ADOQueryCounters.FieldByName('value_overflow_rate').AsString+','+
				  mp+','+
				  'trunc(to_date('''+ADOMonitorResults.FieldByName('md').AsString+
					''',''dd.mm.yyyy hh24:mi:ss''))'+',0)';	
		  try
			OQ.Execute;
			except
			 if CheckBox1.checked=true then
			 ShowMessage('Ошибка при переносе');

			 ADOQueryCounters.Next;
			 continue;
			end;

		  ADOQueryCounters.Next;
			 end;
		ADOQueryComcentrators.Next;
	  End;  

Main.OP.CallProcedure('update_address',[]);
ConnTbl.Next;
end; //самый верхний цикл по таблице подключений
Main.OS.Commit;
ShowMessage('Перенос завершен успешно');

}
end;

procedure TTransForm.Button1Click(Sender: TObject);
begin
{
  Main.OP.CallProcedure('clear_base',[]);
  ShowMessage('база очищена');
  //ConnTbl.Refresh;
}
end;

procedure TTransForm.TransferCANs(ConnIDBQRK,ConnIDInStar:integer);
{
var

	//эти переменные для выборки из инстара
 SeqConcID,SeqCntrID:integer; //эти переменные для вставки в бикварк
 LastPok:string;
}
begin
 {

//процедура переноса кановских счетчиков (вызывается из общей процедуры переноса)

	 //значение последовательности для "виртуального" концентратора. Он на поделючении будет один.
	OQ.SQL.Text:='select bqrk.GlobalNum.Nextval as Val from dual';
	OQ.Execute; SeqConcID:=OQ.Field(0);
	 //вставка концентратора. В данном случае они виртуальные, нужны для того чтобы не переделывать все
	OQ.SQL.Text:='Insert into bqrk.concentrator_points (id_con,id_concentrator,name_concentrator,'
						  +'concentrator_address,type) values ('
					+IntToStr(ConnIDBQRK)+','+IntToStr(SeqConcID)+',''Виртуальный'','''+
				  IntToHex(ADOQueryComcentrators.FieldByName('concentrator_addres').AsInteger,4)
					+''','+'''2001'''+')';
		 
			OQ.Execute;
		
	 
	  //пошли счетчики
If ADOobject_counter_points.Active=true then ADOobject_counter_points.Close;
	ADOobject_counter_points.Parameters.ParamByName('id_conn').Value:=ConnIDInStar;

	ADOobject_counter_points.Open;
	ADOobject_counter_points.First;

	While not ADOobject_counter_points.Eof do
	  begin
		  //последние показания
		  If ADOCAN_results.Active=true then ADOCAN_results.Close;

		  ADOCAN_results.Parameters.ParamByName('ser_num').Value:=
			  trim(ADOobject_counter_points.FieldByName('serial_number').AsString);
		  ADOCAN_results.Open;

				OQ.SQL.Text:='select bqrk.GlobalNum.Nextval as Val from dual';
				OQ.Execute; SeqCntrID:=OQ.Field(0);
				 LastPok:=Q_ReplaceText(ADOCAN_results.FieldByName('max_pok').AsString,',','.');
				if lastPok='' then lastpok:='0';
	//ConcID:=ADOQueryComcentrators.FieldByName('id').AsInteger;
				//вставка счетчика
				OQ.SQL.Text:='Insert into bqrk.counters (id_con,id_concentrator,id_counter,counter_name,'
						  +'street,serial_number,counter_address,last_pok,date_last_pok,is_can) values ('
				  +IntToStr(ConnIDBQRK)+','+IntToStr(SeqConcID)+','+IntToStr(SeqCntrID)+','''+
				  trim(ADOobject_counter_points.FieldByName('name').AsString)+''','''+
				  trim(ADOobject_counter_points.FieldByName('address').AsString)+''','''+
				  trim(ADOobject_counter_points.FieldByName('serial_number').AsString)+''','+
				  trim(ADOobject_counter_points.FieldByName('counter_addres').AsString)+','+
				  //ADOQueryCounters.FieldByName('value_overflow_rate').AsString+','+
				  LastPok+
					',to_date(sysdate,''dd:mm:yyyy hh24:mi:ss''),1)';
					//'trunc(to_date('''+ADOCAN_results.FieldByName('max_date').AsString+
					//'''dd.mm.yyyy hh24:mi:ss''))'+')';
		  try
			OQ.Execute;
			except
			 if CheckBox1.checked=true then
			 ShowMessage('Ошибка при переносе');

			 ADOobject_counter_points.Next;
			 continue;
			end; 

		  ADOobject_counter_points.Next;
		 end;
 }
end;

end.

