unit u_loadsch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzLstBox,
  RzDBList, RzLabel, RzButton, ComCtrls, RzTreeVw, RzTabs, DB,
  DBCtrls, GridsEh, DBGridEh, DBCtrlsEh, ImgList,
  ExtCtrls, RzDBNav, Oracle, OracleData, RzRadChk, Grids, DBGrids,
  RzShellDialogs, RzPanel, RzSplit, Menus, RzBorder;
  
type
  TLoadSchedForm = class(TForm)
    ODSSchedule: TOracleDataSet;
    DSSchedule: TDataSource;
	 DBGridEh1: TDBGridEh;
    CancelButt: TRzBitBtn;
    OKButt: TRzBitBtn;
    ODSScheduleID_SCHEDULE: TIntegerField;
    ODSScheduleNAME_SCHEDULE: TStringField;
    ODSScheduleCREATE_DATE: TDateTimeField;
    ODSScheduleLAST_DATE: TDateTimeField;
    ODSScheduleCOMMENTS: TWideStringField;
    ODSGrid: TOracleDataSet;
    qry: TOracleQuery;
    RzBitBtn1: TRzBitBtn;
    QryConc: TOracleQuery;
    QryCounters: TOracleQuery;
    RzBitBtn2: TRzBitBtn;
    RzDBNavigator1: TRzDBNavigator;
    ODSScheduleTIME_OPROS: TStringField;
    Timer: TTimer;
    GroupBox1: TGroupBox;
    StartButt: TRzBitBtn;
    StopButt: TRzBitBtn;
    MonitorLabel: TRzLabel;
    TrayPop: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure CancelButtClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
	 procedure OKButtClick(Sender: TObject);
	 Function SelectImageForNode (IdObj:integer):integer;
	 procedure DelSchedule(Overwrite:boolean);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure ODSScheduleBeforePost(DataSet: TDataSet);
	 procedure ODSScheduleAfterScroll(DataSet: TDataSet);
	 procedure LoadSched(pid_sched:integer);
	 procedure StartMonProc;
	 procedure StopMonProc;
    procedure StartButtClick(Sender: TObject);
    procedure StopButtClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);

  private
    { Private declarations }
  public
	 { Public declarations }
	IDSchedule:integer;
	
  end;

var
  LoadSchedForm: TLoadSchedForm;

 type
  PNodeItemRec = ^NodeItemRec;

  NodeItemRec = record
	ID_Node:integer;
	ID_Parent:integer;
	Object_id:integer;
  end;

 
implementation

uses u_main;
var
pivo:variant;
PropList:TSL;
{$R *.dfm}

procedure TLoadSchedForm.CancelButtClick(Sender: TObject);
begin
 Self.Close;
end;

procedure TLoadSchedForm.FormShow(Sender: TObject);
var
bla:variant;
begin
  if not ODSSchedule.Active then ODSSchedule.Open;
end;

procedure TLoadSchedForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin    
// If ODSSchedule.Active then ODSSchedule.Close;
// If ODSGrid.Active then ODSGrid.Close;

 If Main.ODSInterface.Active then Main.ODSInterface.Close;
 Main.ODSInterface.SQL.Clear;
 Main.ODSInterface.SQL.Text:='Select a.rowid,a.* from bqrk.interface a where id_schedule ='+IntToStr(IDSchedule);
 Main.ODSInterface.Open;
end;

procedure TLoadSchedForm.OKButtClick(Sender: TObject);
var
 psched_id:integer;

begin            
// ODSSchedule.FieldByName('id_schedule').AsString;            
 LoadSched(ODSSchedule.FieldByName('id_schedule').AsInteger);
end;

procedure TLoadSchedForm.DelSchedule(Overwrite:boolean);
Begin
 Qry.SQL.Clear;
 Qry.SQL.Add('Delete from bqrk.schedule where id_schedule='+ODSSchedule.FieldByName('id_schedule').AsString); 
 Qry.Execute; 
 Main.OS.Commit;

if Overwrite=false then
 ODSSchedule.Refresh;
End;

procedure TLoadSchedForm.RzBitBtn1Click(Sender: TObject);
begin
 DelSchedule(false);
end;

procedure TLoadSchedForm.FormCreate(Sender: TObject);
begin
  PropList:=TStringList.Create;
end;

procedure TLoadSchedForm.RzBitBtn2Click(Sender: TObject);
var
ns:string;

begin 
 if ODSSchedule.FieldByName('NAME_SCHEDULE').Value=null then
exit;

ns:=ODSSchedule.FieldByName('NAME_SCHEDULE').AsString;

if ODSSchedule.FieldByName('ID_SCHEDULE').Value=null then
 Main.NewSchedule(false,ns)
else
 Main.NewSchedule(true,ns); 
	
end;

procedure TLoadSchedForm.ODSScheduleBeforePost(DataSet: TDataSet);
begin
if ODSSchedule.FieldByName('NAME_SCHEDULE').Value=null then 
ODSSchedule.Cancel;
if (ODSSchedule.FieldByName('NAME_SCHEDULE').Value<>null) and
  (ODSSchedule.FieldByName('ID_SCHEDULE').Value=null)
 then ODSSchedule.Cancel;
end;

procedure TLoadSchedForm.ODSScheduleAfterScroll(DataSet: TDataSet);
begin
pivo:=ODSSchedule.FieldByName('NAME_SCHEDULE').Value;
end;

procedure TLoadSchedForm.LoadSched(pid_sched:integer);
var
 ParNode,ParConNode,ParConcNode,NewNode:TTreeNode;
 ObjType,a:integer;
 NodeRec:NodeItemRec;
 NodePtr:PNodeItemRec;

begin
Main.StructureTreeCur.Selected:=nil;
Main.StructureTreeCur.Items.Clear;

If not ODSGrid.Active then ODSGrid.Open;

Main.PB.PartsComplete:=0;
Main.PB.TotalParts:=ODSGrid.RecordCount;

ODSGrid.First;

//циклимся по шлюзам
 While not ODSGrid.Eof do
  Begin
	NodePtr:=@NodeRec; New(NodePtr);
	NodePtr^.ID_Node:=ODSGrid.FieldByName('id_node').asInteger;
	NodePtr^.ID_Parent:=ODSGrid.FieldByName('id_parent').asInteger;
	NodePtr^.Object_id:=ODSGrid.FieldByName('id_object').asInteger;

  NewNode:=Main.StructureTreeCur.Items.AddChildObject
  (nil,ODSGrid.FieldByName('text').asString,NodePtr);
  ParConNode:=NewNode;

 NewNode.ImageIndex:=SelectImageForNode(PNodeItemRec(NewNode.Data)^.Object_id);
 //запрашиваем концентраторы шлюза
 QryConc.SQL.Clear;
 QryConc.SQL.Add('Select * from bqrk.grid where id_schedule= '
	+IntToStr(pid_sched)+' and id_parent='+
	 IntToStr(PNodeItemRec(ParConNode.Data)^.id_node));

 QryConc.Execute;
 QryConc.First;
 //циклимся по концентраторам
while not QryConc.Eof do
 begin
 NodePtr:=@NodeRec; New(NodePtr);
 NodePtr^.ID_Node:=QryConc.Field(1);
 NodePtr^.ID_Parent:=QryConc.Field(2);
 NodePtr^.Object_id:=QryConc.Field(3);

  NewNode:=Main.StructureTreeCur.Items.AddChildObject
  (ParConNode,QryConc.Field(4),NodePtr);
  ParConcNode:=NewNode;

	NewNode.ImageIndex:=SelectImageForNode(PNodeItemRec(NewNode.Data)^.Object_id);
	QryCounters.SQL.Clear;
	//запрашиваем счетчики концентратора
	QryCounters.SQL.Add('Select * from bqrk.grid where id_schedule= '
	+IntToStr(pid_sched)+' and id_parent='+
	 IntToStr(PNodeItemRec(ParConcNode.Data)^.id_node));

QryCounters.Execute;
QryCounters.First; 
//циклимся по счетчикам
if QryCounters.RowCount<>0 then
 while not QRYCounters.Eof do
  begin
	NodePtr:=@NodeRec; New(NodePtr);
	NodePtr^.ID_Node:=QryCounters.Field(1);
	NodePtr^.ID_Parent:=QryCounters.Field(2);
	NodePtr^.Object_id:=QryCounters.Field(3);

  NewNode:=Main.StructureTreeCur.Items.AddChildObject
  (ParConcNode,QryCounters.Field(4),NodePtr);
  NewNode.ImageIndex:=SelectImageForNode(PNodeItemRec(NewNode.Data)^.Object_id);
	QryCounters.Next;	
  end;
 QryConc.Next;
 end;  //while not QryConc.Eof do	

	NewNode.ImageIndex:=SelectImageForNode(PNodeItemRec(NewNode.Data)^.Object_id);
	ODSGrid.Next; Main.PB.IncPartsByOne;

 End;   //While not ODSGrid.Eof do
 
IDSchedule:=pid_sched;
//заполняем список дополнительных полей для выпадающих списков
If Main.ODSAddFldsList.Active=false then Main.ODSAddFldsList.Open;

Main.ODSAddFldsList.First;

While not Main.ODSAddFldsList.Eof do
 Begin
	If PropList.IndexOf(Main.ODSAddFldsList.FieldByName('name').AsString)<0 then
	 PropList.Add(Main.ODSAddFldsList.FieldByName('name').AsString);
	If Main.ComboList.IndexOf(Main.ODSAddFldsList.FieldByName('name').AsString)<0 then
	 Main.ComboList.Add(Main.ODSAddFldsList.FieldByName('name').AsString);

	Main.ODSAddFldsList.Next;
 End;

Main.InterfaceGrid.Columns.Items[7].PickList:=PropList;
Main.InterfaceGrid.Columns.Items[7].KeyList:=PropList;

Main.IdSchToWW:=IDSchedule;
Main.GloSchedID:=IDSchedule;
Main.NameSched.Caption:=ODSSchedule.FieldByName('NAME_SCHEDULE').AsString;

Self.Close;
End;

Function TLoadSchedForm.SelectImageForNode (IdObj:Integer):integer;
Begin
//функция выбора пиктограммы для узла
 Case IdObj of
  1001:Result:=17; 1003:Result:=36; 2003:Result:=2;
  1002:Result:=0; 2001:Result:=1; 2002:Result:=3; 
  2004:Result:=4; 2005:Result:=1; 2007:Result:=5; 
  2009:Result:=6; 2006:Result:=4; 2008:Result:=6;
 End;
end;

procedure TLoadSchedForm.StartMonProc;
begin
 Timer.Enabled:= true;
 MonitorLabel.Caption:='Мониторинг включен';
 MonitorLabel.Font.Color:=clBlack;
 MonitorLabel.Blinking:= true;
 Main.TrayIcon.Animated:=true;
 N1.Checked:=true;
end;

procedure TLoadSchedForm.StopMonProc;
begin
 Timer.Enabled:= false;
 MonitorLabel.Caption:='Мониторинг выключен'; 
 MonitorLabel.Blinking:= false;
 MonitorLabel.Font.Color:=clRed;
 Main.TrayIcon.Animated:=false;
 N1.Checked:=false;
end;

procedure TLoadSchedForm.StartButtClick(Sender: TObject);
begin
 StartMonProc;
end;

procedure TLoadSchedForm.StopButtClick(Sender: TObject);
begin
 StopMonProc;
end;

procedure TLoadSchedForm.TimerTimer(Sender: TObject);
var
s:string;

begin
Qry.Close;
//берем текущее время
s:=TimeToStr(GetTime);
//если текущее время меньше 10:00:00, т.е. меньше 8 символов, то надо дописать
//впереди 0 т.к. маска во времени опроса расписания предполагает 8 символов
//а ф-ция GetTime возвращает время меньше 10:00:00 без нуля впереди
if Length(s)=7 then
 Insert('0',s,0);

Qry.SQL.Text:='select id_schedule from bqrk.schedule where time_opros='''
					+s+'''';
Qry.Execute;
 
  If Qry.RowCount<>0 then
	Begin	 
	 LoadSched(Qry.Field(0));
	 Main.QuickDial(false);
	 Main.PokazToDataBase;
	End;
end;

procedure TLoadSchedForm.N1Click(Sender: TObject);
begin
 If Timer.Enabled=true then StopMonProc
  else
 StartMonProc;
end;

procedure TLoadSchedForm.N2Click(Sender: TObject);
begin
 Application.Terminate;
end;

end.
