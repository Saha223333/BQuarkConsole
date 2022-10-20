unit u_reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzLstBox,
  RzDBList, RzLabel, RzButton, ComCtrls, RzTreeVw, RzTabs, DB,
  DBCtrls, GridsEh, DBGridEh, DBCtrlsEh, ImgList,
  ExtCtrls, RzDBNav, Oracle, OracleData, RzRadChk, Grids, DBGrids,
  RzShellDialogs, RzPanel, RzSplit, Menus, RzPrgres, RzStatus, AxCtrls,
  OleCtrls, VCF1, OleServer, ExcelXP, ADODB, Buttons, IWControl, IWExtCtrls,
  RzLaunch,DateUtils, frxClass, frxDBSet, RzRadGrp, frxExportXLS, RzChkLst,
  RzBmpBtn, frxPreview;
  
          
type
  TReports = class(TForm)
	 RzBitBtn1: TRzBitBtn;
	 ndate: TRzDateTimeEdit;
	 kdate: TRzDateTimeEdit;
	 RzLabel1: TRzLabel;
	 RzLabel2: TRzLabel;
	 DBFRXErrors: TfrxDBDataset;
    ODSErrors: TOracleDataSet;
    Qry: TOracleQuery;
    ODSPokaz: TOracleDataSet;
	 DBFRXPokaz: TfrxDBDataset;                          
	 ODSLastPok: TOracleDataSet;
	 DBFRXLastPokaz: TfrxDBDataset;
    ODSLastPokID_CON: TIntegerField;
    ODSLastPokCON_NAME: TStringField;
	 ODSLastPokID_COUNTER: TIntegerField;
	 ODSLastPokID_CONCENTRATOR: TIntegerField;
    ODSLastPokID_CON_1: TIntegerField;
    ODSLastPokCOUNTER_NAME: TStringField;
    ODSLastPokTYPE_ID: TIntegerField;
    ODSLastPokSTREET: TStringField;
    ODSLastPokDOM: TStringField;
    ODSLastPokFLAT: TStringField;
    ODSLastPokSERIAL_NUMBER: TStringField;
    ODSLastPokCOUNTER_ADDRESS: TIntegerField;
    ODSLastPokCOMMENTS: TStringField;
    ODSLastPokTEHN_ADDRESS: TWideStringField;
    ODSLastPokOVERFLOW_RATE: TIntegerField;
    ODSLastPokLAST_POK: TFloatField;
    ODSLastPokDATE_LAST_POK: TDateTimeField;
    ODSPustSerNum: TOracleDataSet;
    frxDBDataset1: TfrxDBDataset;
	 ODSPustSerNumID_COUNTER: TIntegerField;
    ODSPustSerNumID_CONCENTRATOR: TIntegerField;
    ODSPustSerNumID_CON: TIntegerField;
    ODSPustSerNumCOUNTER_NAME: TStringField;
    ODSPustSerNumTYPE_ID: TIntegerField;
    ODSPustSerNumSTREET: TStringField;
    ODSPustSerNumDOM: TStringField;
	 ODSPustSerNumFLAT: TStringField;
	 ODSPustSerNumSERIAL_NUMBER: TStringField;
    ODSPustSerNumCOUNTER_ADDRESS: TIntegerField;
    ODSPustSerNumCOMMENTS: TStringField;
    ODSPustSerNumTEHN_ADDRESS: TWideStringField;
    ODSPustSerNumOVERFLOW_RATE: TIntegerField;
    ODSPustSerNumLAST_POK: TFloatField;
    ODSPustSerNumDATE_LAST_POK: TDateTimeField;
    vse: TRzCheckBox;
    frxXLSExport1: TfrxXLSExport;
    cg: TRzRadioGroup;
    FieldsList: TRzCheckList;
    ODSLastPokACTUAL: TFloatField;
    ODSLastPokDIST: TStringField;
    Label1: TLabel;
    CreateTaskCheck: TRzCheckBox;
    RzRadioGroup1: TRzRadioGroup;
    RzBmpButton1: TRzBmpButton;
	 RzBmpButton2: TRzBmpButton;
    CommunCB: TCheckBox;
	 DateSortRG: TRzRadioGroup;
    ODSTPList: TOracleDataSet;
    DBFRXTPList: TfrxDBDataset;
    Reps: TfrxReport;
	 procedure RzBitBtn1Click(Sender: TObject);
	 procedure FormErrorsRep;
	 procedure FormPokazRep;
	 procedure FormLastPokazRep;
    procedure RzBitBtn2Click(Sender: TObject);
	 procedure cgChanging(Sender: TObject; NewIndex: Integer;
		var AllowChange: Boolean);
	 procedure PrepeareFields(ReportIndex: Integer);
    procedure RzRadioGroup1Changing(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure kdateCloseUp(Sender: TObject);
    procedure ndateCloseUp(Sender: TObject);
    procedure RzBmpButton1Click(Sender: TObject);
    procedure RzBmpButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TSearchThread = class(TThread)  //поток поиска счетчиков
	 private
	{ Private declarations }
  protected
	 procedure Execute; override;
  end;

var
  Reports: TReports;
  ConnID,ConcID,CountID:integer;
  //строка серийных номеров счетчиков для запросов
  numbers:string;
  SearchThread:TSearchThread;

implementation

uses u_main,u_search;

{$R *.dfm}
procedure TSearchThread.Execute;
begin
	//поток поиска счетчиков (сделан в качестве эксперимента)
  Main.StructureTreeCur.Items.Clear;
  Main.Refresh;
  Reports.Refresh;
  Reports.ODSErrors.First;

	While not Reports.ODSErrors.Eof do
	 Begin
	  SearchForm.CreateTaskAfterReport(Reports.ODSErrors.FieldByName('serial_number').AsString);
	  Reports.ODSErrors.Next;
	 end;
end;

procedure TReports.RzBitBtn1Click(Sender: TObject);
var
query:string;
i,ObjType:integer;
CurNode:TTreeNode;

begin
If CG.ItemIndex=3 then 
 Begin
  If ODSTPList.Active=false then
  ODSTPList.Open;

  Reps.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TPList.fr3',true);
  Reps.ShowReport;
  Exit;
 End;

If (vse.Checked=true) and (Main.StructureTreeCur.Items.Count>0) then
 begin              
  If Application.MessageBox('Чтобы сформировать отчет по всем счетчикам нужно очистить текущее расписание. Продолжить?',
	'Предупреждение',mb_YesNo)=6 then
	Main.StructureTreeCur.Items.Clear
  else
	exit;
 end;
Reps.PrepareReport(true);
//проверки
If (Main.StructureTreeCur.Items.Count=0) and (vse.Checked=false) then
  Begin
	ShowMessage('В расписании нет ни одного узла!');
	Exit;
  End; 

If (ndate.Date>kdate.Date) and (kdate.Text<>'') then
begin 
 ShowMessage('Начальная дата не может быть больше конечной');
 Exit;
end;

If CG.itemindex=-1 then
 begin
	ShowMessage('Не выбран ни один отчет для формирования');
	Exit
 end; 
numbers:='';

//составляем строку серийных номеров для формирования запросов
For i:=0 to Main.StructureTreeCur.Items.Count-1 do
 Begin
  CurNode:=main.StructureTreeCur.Items.Item[i];
  ObjType:=PNodeItemRec(CurNode.Data)^.Object_id;
	
	If ObjType=2003 then
	 Begin
		Query:='Select serial_number from bqrk.counters where id_counter='+
						 IntToStr(PNodeItemRec(CurNode.Data)^.id_node);
		Qry.Close;
		Qry.SQL.Clear;
		Qry.SQL.Add(Query);
		Qry.Execute;

		If Qry.Field(0)<>'' then 
		  Begin
			numbers:=numbers+Qry.Field(0)+''',''';
		  End;		
	 End;
 End;
//отрезаем последнюю лишнюю апятую
numbers:=Copy(numbers,1,length(numbers)-2);
numbers:=' and a.serial_number in ('''+numbers+')';
//если отмечена галочка "по всем" то очищаем эту строку
If (vse.Checked=true) and (Main.StructureTreeCur.Items.Count=0) then numbers:='';
Reports.Close;
//принимаем решения о формировании отчетов
  If CG.itemindex=0 then FormErrorsRep;
  If CG.itemindex=1 then FormPokazRep;
  If CG.itemindex=2 then FormLastPokazRep;
end;

procedure TReports.FormErrorsRep;
var
ErrorsSet,sq,nd,kd,descStr:string;
begin
ErrorsSet:=' in (''''';
			
if ndate.Text<>'' then
 nd:=' and a.wdate>='''+ndate.Text+'''';
If kdate.text<>'' then
 kd:=' and a.wdate<='''+kdate.Text+'''';

descStr:='';
If DateSortRg.ItemIndex=1 then descStr:=' desc';

If ODSErrors.Active=true then ODSErrors.Close;
//составляем список помеченных на вывод типов ошибок из представленного списка
If FieldsList.ItemChecked[0]=true then  ErrorsSet:=ErrorsSet+',''Нет данных''';
If FieldsList.ItemChecked[1]=true then  ErrorsSet:=ErrorsSet+',''Дата не изменилась''';
If FieldsList.ItemChecked[2]=true then  ErrorsSet:=ErrorsSet+',''Нет серийного номера''';
If FieldsList.ItemChecked[3]=true then  ErrorsSet:=ErrorsSet+',''Отрицательный расход''';
If FieldsList.ItemChecked[4]=true then  ErrorsSet:=ErrorsSet+',''Перерасход''';

//Если ни одного критерия не выбрано, то выходим
If FieldsList.ItemsChecked=0 then 
 Begin
  ShowMessage('Ни одного критерия не выбрано!');
  Exit;
 End;
	//формируем соответствующий запрос
	sq:='Select a.*,b.street,b.dom from bqrk.errors a,bqrk.counters b '+
	 'where 1=1 and a.serial_number=b.serial_number and a.error_text '+ErrorsSet+') '
+numbers+nd+kd+' order by a.wdate'+descStr;

 ODSErrors.SQL.Clear;
 ODSErrors.SQL.Add(sq);	
 ODSErrors.Open;

 Reps.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Errors.fr3',true);
 Reps.ShowReport;

//если стоит галка по созданию расписания на основании отчета, то идем по этой ветке
If CreateTaskCheck.Checked=true then
 Begin
  //создаем и вызываем поток поиска счетчиков
  SearchThread:=TSearchThread.Create(true);
  SearchThread.FreeOnTerminate:=true;
  SearchThread.Priority:=tpNormal;
  SearchThread.Resume;

  Main.ODSTochka.EnableControls;
 End;

end;

procedure TReports.FormPokazRep;
var
	sq,nd,kd,descStr:string;
begin

if ndate.Text<>'' then
 nd:=' and date_pok>='''+ndate.Text+'''';
If kdate.text<>'' then
 kd:=' and date_pok<='''+kdate.Text+'''';

descStr:='';
If DateSortRg.ItemIndex=1 then descStr:=' desc';

 If ODSPokaz.Active=true then  ODSPokaz.Close;

 If CommunCB.Checked=true then
	sq:='Select c.*,b.id_con,b.con_name,a.tehn_address,a.street,a.dom,a.counter_address from bqrk.pokaz c,'+
	'bqrk.con_points b,bqrk.counters a'+
	 ' where a.id_con=b.id_con and a.id_counter=c.id_counter and c.id_con=b.id_con '+ 
	 numbers+nd+kd+' and a.actual=3'+' order by b.id_con,a.serial_number,a.street,a.dom,c.date_pok'+descStr;

 If CommunCB.Checked=false then
	sq:='Select c.*,b.id_con,b.con_name,a.tehn_address,a.street,a.dom,a.counter_address from bqrk.pokaz c,'+
	'bqrk.con_points b,bqrk.counters a'+
	 ' where a.id_con=b.id_con and a.id_counter=c.id_counter and c.id_con=b.id_con '+ 
	 numbers+nd+kd+ ' order by b.id_con,a.serial_number,a.street,a.dom,c.date_pok'+descStr;
	 
 ODSPokaz.SQL.Clear;
 ODSPokaz.SQL.Add(sq);	
 ODSPokaz.Open;

 Reps.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Pokaz.fr3',true);
 Reps.ShowReport;
//если стоит галка по созданию расписания то идем по этой ветке
If (CreateTaskCheck.Checked=true) and (vse.Checked=true) then
 Begin
  Main.Refresh;
  Reports.Refresh;
  ODSPokaz.First;
	While not ODSPokaz.Eof do
	 Begin
	  SearchForm.CreateTaskAfterReport(ODSPokaz.FieldByName('serial_number').AsString);
	  ODSPokaz.Next;
	 end;
  Main.ODSTochka.EnableControls;
 End;

end;

procedure TReports.FormLastPokazRep;
var
commun,sq,nd,kd:string;
begin    
//PrepeareFields(cg.ItemIndex);
commun:='';

If CommunCB.Checked=true then
commun:=' and a.actual=3 ';
	 
if ndate.Text<>'' then
 nd:=' and date_last_pok>='''+ndate.Text+'''';
If kdate.text<>'' then
 kd:=' and date_last_pok<='''+kdate.Text+'''';

 If ODSLastPok.Active=true then  ODSLastPok.Close;

sq:='Select b.id_con,b.con_name,a.* from '+
	'bqrk.con_points b,bqrk.counters a'+
	 ' where a.id_con=b.id_con ' 
	 +numbers+nd+kd+commun;

 ODSLastPok.SQL.Clear;
 ODSLastPok.SQL.Add(sq);	
 ODSLastPok.Open;
							 
 Reps.LoadFromFile(ExtractFilePath(Application.ExeName)+'\LastPokaz.fr3',true);
 Reps.ShowReport;

//если стоит галка по созданию расписания то идем по этой ветке
If (CreateTaskCheck.Checked=true) and (vse.Checked=true) then
 Begin
  Main.Refresh;
  Reports.Refresh;
  ODSLastPok.First;
	While not ODSLastPok.Eof do
	 Begin
	  SearchForm.CreateTaskAfterReport(ODSLastPok.FieldByName('serial_number').AsString);
	  ODSLastPok.Next;
	 end;
Main.ODSTochka.EnableControls;
 End;

end;

procedure TReports.RzBitBtn2Click(Sender: TObject);
begin
If ODSTPList.Active=false then
 ODSTPList.Open;

 Reps.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TPList.fr3',true);
 Reps.ShowReport;
end;

 
procedure TReports.cgChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
FieldsList.Items.Clear;

 If NewIndex=0 then
  Begin
	FieldsList.Items.Add('Нет данных');
	FieldsList.Items.Add('Дата не изменилась');
	FieldsList.Items.Add('Нет серийного номера');
	FieldsList.Items.Add('Отрицательный расход');
	FieldsList.Items.Add('Перерасход');
  End;

 If NewIndex=2 then
  Begin
	FieldsList.Items.Add('Объект');
	FieldsList.Items.Add('Улица');
	FieldsList.Items.Add('Дом');
	FieldsList.Items.Add('Серийный №');
	FieldsList.Items.Add('Сетевой');
	FieldsList.Items.Add('Последние показания');
	FieldsList.Items.Add('Дата п\п');
  End;

  If NewIndex=2 then
end;

procedure TReports.PrepeareFields(ReportIndex: Integer);
 begin
//процедура подготовки полей для отчетов
 end;


procedure TReports.RzRadioGroup1Changing(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
If ndate.Text<>'' then 
  Begin
	 Case NewIndex of
	  1: kdate.Date:=ndate.Date+1;
	  2: kdate.Date:=ndate.Date+7;
	  3: kdate.Date:=ndate.Date+30;
	end;
  end;
end;

procedure TReports.kdateCloseUp(Sender: TObject);
begin
RzRadioGroup1.ItemIndex:=0;
end;

procedure TReports.ndateCloseUp(Sender: TObject);
begin
If kdate.Text<>'' then 
  Begin
	 Case RzRadioGroup1.ItemIndex of
	  1: kdate.Date:=ndate.Date+1;
	  2: kdate.Date:=ndate.Date+7;
	  3: kdate.Date:=ndate.Date+30;
	end;
  end;
end;

procedure TReports.RzBmpButton1Click(Sender: TObject);
begin
ndate.Text:='';
end;

procedure TReports.RzBmpButton2Click(Sender: TObject);
begin
kdate.Text:='';
end;

end.

